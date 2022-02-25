import 'dart:async';

import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/data/model/calories_history_item_model.dart';
import 'package:notfiguured/data/model/calories_spots_model.dart';
import 'package:notfiguured/data/model/custom_spot_model.dart';
import 'package:notfiguured/data/model/enum/history_type.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/exercise_service.dart';
import 'package:notfiguured/data/services/food_service.dart';
import 'package:notfiguured/ui/views/diary_add_record/diary_add_record_view.dart';
import 'package:notfiguured/ui/views/goal_create/calories_goal_create/calories_goal_create_view.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../goal_control_viewmodel.dart';

class CaloriesGoalControlViewModel extends GoalControlViewModel {
  CaloriesGoalControlViewModel(BuildContext context)
      : super(
          context,
          xAxis: ChartsAxisType.date,
          yAxis: ChartsAxisType.calorie,
          plots: [ChartsType.calorie],
        ) {
    exerciseService = context.read<ExerciseService>();
    diaryService = context.read<FoodService>();
    userRepository = context.read<UserRepository>();
  }
  FoodService diaryService;
  ExerciseService exerciseService;
  UserRepository userRepository;

  ///CHART
  ChartPlot chartPlot;
  ChartPlot historyPlot;
  List<StackedColumnSeries<Spot, DateTime>> series = [];

  ///DETAIL
  TargetCalorieModel get target => diaryRepository.calories.val;
  String goal;
  String leftCalorie;
  String eatenInDay;
  String spentInDay;
  String complitedPercent;

  Completer measureCompleter = Completer();

  ///HISTORY
  HistoryType historyType = HistoryType.all;
  final history = <CaloriesHistoryItemModel>[];

  @override
  Future loadChart() async {
    chartIsBusy = true;
    notifyListeners();
    try {
      chartPlot = await loadPlot(fromDate, intervalType);
      prepareChartData();
    } on Exception catch (ex) {
      logger.e(ex.toString());
    } finally {
      chartIsBusy = false;
      notifyListeners();
    }
  }

  @override
  Future<void> loadHistory() async {
    historyPlot =
        await loadPlot(DateTime.fromMillisecondsSinceEpoch(0), IntervalType.day);
    await Future.wait([
      prepareHistory(),
      prepareDetails(),
    ]);
    if (historyPlot.spots.isNotEmpty) {
      historyStartDate = DateTime.fromMillisecondsSinceEpoch(historyPlot.spots
              .reduce((curr, next) => curr.x < next.x ? curr : next)
              .x
              .toInt() *
          1000);
    }
    notifyListeners();
  }

  @override
  void changeDate(DateTime datetime) {
    selectedDate = datetime;
    prepareDetails();
  }

  Future prepareDetails() async {
    int goalValue;
    if (target.isZigzag) {
      goalValue = [
        target.mo,
        target.tu,
        target.we,
        target.th,
        target.fr,
        target.sa,
        target.su,
      ][(selectedDate ?? DateTime.now()).weekday - 1];
    } else {
      goalValue = target.calories;
    }
    final eatenInDayValue = await chartValueInDay();
    final spentInDayValue = await getSpentInDay();
    final leftCalorieValue =
        (goalValue - eatenInDayValue + spentInDayValue).clamp(0, 99999999);
    final complitedValue =
        Utils.numToFixStr((eatenInDayValue / (goalValue + spentInDayValue)) * 100);
    goal = Utils.numToFixStr(goalValue);
    eatenInDay = Utils.numToFixStr(eatenInDayValue);
    spentInDay = Utils.numToFixStr(spentInDayValue);
    leftCalorie = Utils.numToFixStr(leftCalorieValue);
    complitedPercent = '$complitedValue%';
    notifyListeners();
    if (!measureCompleter.isCompleted) {
      measureCompleter.complete();
    }
  }

  Future<double> getSpentInDay() async {
    final date = Jiffy(selectedDate).startOf(Units.DAY);
    final currentDayTrainings = await exerciseService.getDiary(date: date);
    final currentDayDiary =
        currentDayTrainings.isEmpty ? null : currentDayTrainings.first;
    final userWeight = userRepository.userModel.val?.weight ?? 70;
    return currentDayDiary?.exercises
            ?.sumByDouble((ex) => ex.amount / 60 * ex.calories * userWeight) ??
        0;
  }

  Future<void> prepareChartData() async {
    final spots = CaloriesSpots();
    for (final spot in chartPlot?.chartAdditions?.first?.spots ?? []) {
      spots.common[spot.x] ??= CustomSpot();
      spots.common[spot.x].normal = spot.y;
      if (spots.common[spot.x].data == null) {
        spots.common[spot.x].data = 0;
      }
    }
    for (final spot in chartPlot?.spots ?? []) {
      spots.common[spot.x] ??= CustomSpot();
      spots.common[spot.x].data = spot.y;
    }
    for (final entry in spots.common.entries) {
      final data = entry.value.data ?? 0.0;
      final normal = entry.value.normal ?? 0.0;
      if (data - normal > 20) {
        spots.data.add(Spot(x: entry.key, y: normal));
        spots.divider.add(Spot(x: entry.key, y: 20));
        spots.overflow.add(Spot(x: entry.key, y: data - normal - 20));
        spots.deficit.add(Spot(x: entry.key, y: 0));
      } else {
        spots.data.add(Spot(x: entry.key, y: data));
        spots.deficit.add(Spot(x: entry.key, y: normal - data));
        spots.divider.add(Spot(x: entry.key, y: 0));
        spots.overflow.add(Spot(x: entry.key, y: 0));
      }
    }
    series
      ..clear()
      ..addAll(spots?.toSeries(periodMode) ?? []);
    notifyListeners();
  }

  Future prepareHistory() async {
    final historyMap = <double,
        CaloriesHistoryItemModel>{}; //<timestamp, historyItem>{} for sort history by time
    for (final Spot spot in historyPlot.spots ?? []) {
      historyMap[spot.x] ??= CaloriesHistoryItemModel(
        date: DateTime.fromMillisecondsSinceEpoch((spot.x * 1000).toInt()),
      );
      historyMap[spot.x].addValue(data: spot.y);
    }
    for (final spot in historyPlot?.chartAdditions?.first?.spots ?? []) {
      if (!historyMap.containsKey(spot.x)) continue;
      historyMap[spot.x].addValue(normal: spot.y);
    }

    final sortedKeys = historyMap.keys.toList();
    sortedKeys.sort((double a, double b) => (b - a).floor());
    history.clear();
    for (final key in sortedKeys) {
      history.add(historyMap[key]);
    }
    notifyListeners();
  }

  void changeHistoryType(HistoryType historyType) {
    this.historyType = historyType;
    notifyListeners();
  }

  Future<int> chartValueInDay() async {
    final currentDayDiaryFood =
        await diaryService.getDiary(date: selectedDate, force: true);
    return currentDayDiaryFood?.summary?.foodCalorie ?? 0;
  }

  Future<ChartPlot> loadPlot(DateTime from, IntervalType interval) async {
    final response = await api.api.v1DiaryGetMacronutritionChartDataPost(
      body: DiaryChartDataRequestModel(
        chartTypes: [ChartsType.calorie],
        fromDate: from,
        toDate: toDate,
        interval: interval,
      ),
    );
    if (response.isSuccessful) {
      chart = response.body.where((c) => c.yAxisType == ChartsAxisType.calorie).first;
    }
    final plots = chart?.plots?.where((e) => e.name == ChartsType.calorie)?.toList();
    if (plots?.isNotEmpty ?? false) {
      return plots.first;
    }
    return null;
  }

  @override
  int get historyLength => history.length;

  // @override
  // DateTime get historyStartDate => (history?.isNotEmpty ?? true)
  //     ? history.last.date
  //     : DateTime.now();

  @override
  DateTime get minRollingDate => historyStartDate;

  @override
  DateTime get maxRollingDate => DateTime.now();

  @override
  Future<void> addRecord() async {
    await navigator.push(DiaryAddRecordRoute(date: selectedDate ?? DateTime.now()));
    super.onReady();
  }

  @override
  Future<void> edit() async {
    await navigator.push(
      CaloriesGoalCreateRoute(
        PredefinedGoalData(
          calories: diaryRepository.calories.val?.calories,
          mo: diaryRepository.calories.val.mo,
          tu: diaryRepository.calories.val.tu,
          we: diaryRepository.calories.val.we,
          th: diaryRepository.calories.val.th,
          fr: diaryRepository.calories.val.fr,
          sa: diaryRepository.calories.val.sa,
          su: diaryRepository.calories.val.su,
          popAfter: true,
        ),
      ),
    );
    super.onReady();
  }

  @override
  Future loadMeasure() async {
    await measureCompleter.future;
  }

  @override
  void saveMeasurement() {}
}
