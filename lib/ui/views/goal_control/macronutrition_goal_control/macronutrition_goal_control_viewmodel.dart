import 'dart:async';

import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/data/model/custom_spot_model.dart';
import 'package:notfiguured/data/model/enum/history_type.dart';
import 'package:notfiguured/data/model/macronutrition_spots_model.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/data/services/food_service.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/data/model/macronutrition_history_item_model.dart';
import 'package:notfiguured/ui/views/diary_food/meal/meal_view.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/ui/views/goal_create/macronutrition_goal_create/macronutrition_create_view.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';

import '../goal_control_viewmodel.dart';

class MacronutritionGoalControlViewModel extends GoalControlViewModel {
  MacronutritionGoalControlViewModel(BuildContext context)
      : super(
          context,
          xAxis: ChartsAxisType.date,
          yAxis: ChartsAxisType.gr,
          plots: [
            ChartsType.macroprotein,
            ChartsType.macrofat,
            ChartsType.macrocarb,
          ],
        ) {
    service = context.read<DiaryService>();
    foodService = context.read<FoodService>();
  }

  ///CHART
  List<StackedColumnSeries<Spot, DateTime>> series = [];

  ///DETAIL
  TargetMacroModel get target => diaryRepository.macro.val;
  FoodService foodService;
  String goalProtein;
  String goalFat;
  String goalCarbon;
  DiaryService service;

  String proteinInDay;
  String fatInDay;
  String carbonInDay;

  double proteinInDayNum;
  double fatInDayNum;
  double carbonInDayNum;

  String complitedPercent;

  Completer measureCompleter = Completer();

  ///HISTORY
  HistoryType historyType = HistoryType.all;
  final history = <MacronutritionHistoryItemModel>[];

  @override
  void changeDate(DateTime datetime) {
    selectedDate = datetime;
    final proteinPlot = plotByType(chart, ChartsType.macroprotein);
    final fatPlot = plotByType(chart, ChartsType.macrofat);
    final carbonPlot = plotByType(chart, ChartsType.macrocarb);
    prepareDetails(proteinPlot, fatPlot, carbonPlot);
  }

  @override
  Future loadChart() async {
    chartIsBusy = true;
    notifyListeners();
    try {
      final response = await api.api.v1DiaryGetMacronutritionChartDataPost(
        body: DiaryChartDataRequestModel(
          chartTypes: [
            ChartsType.macroprotein,
            ChartsType.macrofat,
            ChartsType.macrocarb,
          ],
          fromDate: fromDate,
          toDate: toDate,
          interval: intervalType,
        ),
      );
      chart = response.body.where((c) => c.yAxisType == ChartsAxisType.gr).first;
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
    final response = await api.api.v1DiaryGetMacronutritionChartDataPost(
      body: DiaryChartDataRequestModel(
        chartTypes: [
          ChartsType.macroprotein,
          ChartsType.macrofat,
          ChartsType.macrocarb,
        ],
        fromDate: DateTime.fromMillisecondsSinceEpoch(0),
        toDate: DateTime.now(),
        interval: IntervalType.day,
      ),
    );
    final _chart = response.body.where((c) => c.yAxisType == ChartsAxisType.gr).first;
    if (_chart.plots.first.spots.isNotEmpty) {
      historyStartDate = DateTime.fromMillisecondsSinceEpoch(_chart.plots.first.spots
              .reduce((curr, next) => curr.x < next.x ? curr : next)
              .x
              .toInt() *
          1000);
    }
    final proteinPlot = plotByType(_chart, ChartsType.macroprotein);
    final fatPlot = plotByType(_chart, ChartsType.macrofat);
    final carbonPlot = plotByType(_chart, ChartsType.macrocarb);
    await Future.wait([
      prepareHistory(proteinPlot, fatPlot, carbonPlot),
      prepareDetails(proteinPlot, fatPlot, carbonPlot),
    ]);
    measureIsBusy = false;
    notifyListeners();
  }

  Future prepareDetails(
    ChartPlot proteinPlot,
    ChartPlot fatPlot,
    ChartPlot carbonPlot,
  ) async {
    goalProtein = Utils.getMassStr(
        (diaryRepository.calories.val?.calories?.toDouble() ?? 2000) /
            100 *
            target.protein /
            4);
    goalFat = Utils.getMassStr(
        (diaryRepository.calories.val?.calories?.toDouble() ?? 2000) /
            100 *
            target.fat /
            9);
    goalCarbon = Utils.getMassStr(
        (diaryRepository.calories.val?.calories?.toDouble() ?? 2000) /
            100 *
            target.carbon /
            4);
    await chartValueInDay();
    proteinInDay = Utils.getMassStr(proteinInDayNum);
    fatInDay = Utils.getMassStr(fatInDayNum);
    carbonInDay = Utils.getMassStr(carbonInDayNum);
    final complitedNum = Utils.numToFixStr(
        ((proteinInDayNum + fatInDayNum + carbonInDayNum) /
            (((diaryRepository?.calories?.val?.calories?.toDouble() ?? 2000) /
                    100 *
                    target.protein /
                    4) +
                ((diaryRepository?.calories?.val?.calories?.toDouble() ?? 2000) /
                    100 *
                    target.fat /
                    9) +
                ((diaryRepository?.calories?.val?.calories?.toDouble() ?? 2000) /
                    100 *
                    target.carbon /
                    4)) *
            100));
    complitedPercent = '$complitedNum%';
    notifyListeners();
    if (!measureCompleter.isCompleted) {
      measureCompleter.complete();
    }
  }

  Future<void> prepareChartData() async {
    final proteinPlot = plotByType(chart, ChartsType.macroprotein);
    final fatPlot = plotByType(chart, ChartsType.macrofat);
    final carbonPlot = plotByType(chart, ChartsType.macrocarb);
    final proteinSpots = MacronutritionSpots(
      shortName: 'бел',
      groupName: 'Protein',
      color: AppColors.blue,
    );
    final fatSpots = MacronutritionSpots(
      shortName: 'жир',
      groupName: 'Fat',
      color: AppColors.lightPink,
    );
    final carbonSpots = MacronutritionSpots(
      shortName: 'угл',
      groupName: 'Carbon',
      color: AppColors.yellow,
    );
    for (int i = 0; i < 3; i++) {
      final plot = [proteinPlot, fatPlot, carbonPlot][i];
      final spots = [proteinSpots, fatSpots, carbonSpots][i];
      for (final spot in plot?.chartAdditions?.first?.spots ?? []) {
        spots.common[spot.x] ??= CustomSpot();
        spots.common[spot.x].normal = spot.y;
        if (spots.common[spot.x].data == null) {
          spots.common[spot.x].data = 0;
        }
      }
      for (final spot in plot?.spots ?? []) {
        spots.common[spot.x] ??= CustomSpot();
        spots.common[spot.x].data = spot.y;
      }

      for (final entry in spots.common.entries) {
        final data = entry.value.data ?? 0.0;
        final normal = entry.value.normal ?? 0.0;
        if (data - normal > 2) {
          spots.data.add(Spot(x: entry.key, y: normal));
          spots.divider.add(Spot(x: entry.key, y: 2));
          spots.overflow.add(Spot(x: entry.key, y: data - normal - 2));
          spots.deficit.add(Spot(x: entry.key, y: 0));
        } else {
          spots.data.add(Spot(x: entry.key, y: data));
          spots.deficit.add(Spot(x: entry.key, y: normal - data));
          spots.divider.add(Spot(x: entry.key, y: 0));
          spots.overflow.add(Spot(x: entry.key, y: 0));
        }
      }
    }
    series.clear();
    for (final spots in [proteinSpots, fatSpots, carbonSpots]) {
      series.addAll(spots?.toSeries(periodMode) ?? []);
    }
    notifyListeners();
  }

  Future prepareHistory(
    ChartPlot proteinPlot,
    ChartPlot fatPlot,
    ChartPlot carbonPlot,
  ) async {
    final historyMap = <double,
        MacronutritionHistoryItemModel>{}; //<timestamp, historyItem>{} for sort history by time
    final plots = [proteinPlot, fatPlot, carbonPlot];
    for (int i = 0; i < 3; i++) {
      for (final Spot spot in plots[i]?.spots ?? []) {
        historyMap[spot.x] ??= MacronutritionHistoryItemModel(
          date: DateTime.fromMillisecondsSinceEpoch(spot.x.floor() * 1000),
        );
        historyMap[spot.x].addValue(i, data: spot.y);
      }
      for (final spot in plots[i]?.chartAdditions?.first?.spots ?? []) {
        if (!historyMap.containsKey(spot.x)) continue;
        historyMap[spot.x].addValue(i, normal: spot.y);
      }
    }
    final sortedKeys = historyMap.keys.toList();
    sortedKeys.sort((double a, double b) => (b - a).floor());
    history.clear();
    for (final key in sortedKeys) {
      history.add(historyMap[key]);
    }
  }

  void changeHistoryType(HistoryType historyType) {
    this.historyType = historyType;
    notifyListeners();
  }

  Future<void> chartValueInDay() async {
    final todayFood = await foodService.getDiary(date: selectedDate);
    proteinInDayNum = todayFood?.summary?.protein ?? 0;
    fatInDayNum = todayFood?.summary?.fat ?? 0;
    carbonInDayNum = todayFood?.summary?.carb ?? 0;
    notifyListeners();
  }

  ChartPlot plotByType(ChartDataModel chart, ChartsType type) {
    final plots = chart?.plots?.where((e) => e.name == type)?.toList();
    if (plots?.isEmpty ?? true) return null;
    return plots.first;
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
  void addRecord() {
    navigator.push(MealRoute(date: selectedDate)).then(
          (value) => Future.wait(
            [
              service.fetch(),
              loadChart(),
              loadHistory(),
            ],
          ),
        );
  }

  @override
  Future<void> edit() async {
    await navigator.push(
      MacronutritionGoalCreateRoute(
        PredefinedGoalData(
          protein: diaryRepository.macro.val.protein,
          fat: diaryRepository.macro.val.fat,
          carbon: diaryRepository.macro.val.carbon,
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
