import 'dart:async';

import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/data/model/weight_history_item_model.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/ui/views/goal_create/weight_goal_create/weight_create_view.dart';
import 'package:notfiguured/ui/views/measurements/add/add_measurement_view.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../goal_control_viewmodel.dart';

class WeightGoalControlViewModel extends GoalControlViewModel {
  WeightGoalControlViewModel(BuildContext context)
      : super(context,
            xAxis: ChartsAxisType.date,
            yAxis: ChartsAxisType.kg,
            plots: [ChartsType.weight, ChartsType.plan]) {
    measurementsService = context.read<MeasurementsService>();
    userRepository = context.read<UserRepository>();
  }
  UserRepository userRepository;
  MeasurementsService measurementsService;
  MeasureModel currentMeasure;
  List<Spot> weightSpots = [];
  List<Spot> awaitSpots = [];

  ///HISTORY
  final history = <WeightHistoryItemModel>[];

  TargetWeightModel get target => diaryRepository.weight?.val;
  double get currentWeight => currentMeasure?.weight ?? findLastValue(weightSpots) ?? 0;
  ChartPlot get weightPlot => chart?.plots?.firstWhere(
        (el) => el.name == ChartsType.weight,
        orElse: () => null,
      );
  ChartPlot get planPlot => chart?.plots?.firstWhere(
        (el) => el.name == ChartsType.plan,
        orElse: () => null,
      );
  String get goalMetBy =>
      "${Utils.numberToString((currentWeight - target.startWeight).abs() / (target.endWeight - target.startWeight).abs() * 100)} %";
  String get remainToGoal =>
      Utils.getMassStr((currentWeight - target.endWeight) * 1000, 1, true);
  String get deviation =>
      Utils.getMassStr((findLastValue(awaitSpots) - currentWeight) * 1000, 1, true);

  @override
  DateTime get minRollingDate => historyStartDate;

  @override
  DateTime get maxRollingDate => DateTime.now();

  ChartPlot historyPlot;

  double findLastValue(List<Spot> spots) {
    if (awaitSpots == null) return 0;
    final day = selectedDate.millisecondsSinceEpoch / 1000 + 8639;
    final finalSpots = (spots ?? []).where((spot) => spot.x < day).toList();
    if (finalSpots.isEmpty) return 0;
    finalSpots.sort((a, b) => a.x.compareTo(b.x));
    return finalSpots?.last?.y ?? 0;
  }

  @override
  Future loadHistory() async {
    historyIsBusy = true;
    chartIsBusy = true;
    await loadHistoryPlot();
    await prepareHistory();
    historyStartDate = DateTime.fromMillisecondsSinceEpoch(chart.plots
            .where((e) => e.name == ChartsType.weight)
            .first
            .spots
            .reduce((curr, next) => curr.x < next.x ? curr : next)
            .x
            .toInt() *
        1000);
        historyIsBusy = false;
    chartIsBusy = false;
    notifyListeners();
  }

  Future<void> loadHistoryPlot() async {
    final response = await api.api.v1MeasureGetMeasuresChartDataPost(
      body: MeasureChartDataRequestModel(
        fromDate: DateTime.fromMillisecondsSinceEpoch(0),
        toDate: DateTime.now(),
        chartTypes: [ChartsType.weight, ChartsType.plan],
      ),
    );
    if (response.isSuccessful) {
      chart = response.body.where((c) => c.yAxisType == ChartsAxisType.kg).first;
    }
    weightSpots
      ..clear()
      ..addAll(chart?.plots?.where((e) => e.name == ChartsType.weight)?.first?.spots);
    awaitSpots
      ..clear()
      ..addAll(chart?.plots?.where((e) => e.name == ChartsType.plan)?.first?.spots);
    notifyListeners();
  }

  @override
  Future<void> addRecord() async {
    await navigator.push(
      AddMeasurementRoute(
        MeasurementType.weightMass,
        color: AppColors.pink,
        date: selectedDate,
      ),
    );
    historyIsBusy = true;
    await loadHistory();
    historyIsBusy = false;
    measureIsBusy = true;
    await loadMeasure();
    measureIsBusy = false;
    chartIsBusy = true;
    await loadChart();
    chartIsBusy = false;
  }

  @override
  Future<void> edit() async {
    await navigator.push(
      WeightGoalCreateRoute(
        PredefinedGoalData(
          weight: measurementsService.repository.current.val.weight,
          goal: diaryRepository.weight.val.endWeight,
          popAfter: true,
        ),
      ),
    );
    loadHistory();
    loadMeasure();
  }

  @override
  void saveMeasurement() {}

  @override
  int get historyLength => history.length;

  Future prepareHistory() async {
    final historyMap = <DateTime,
        WeightHistoryItemModel>{}; //<timestamp, historyItem>{} for sort history by time
    for (final Spot spot in weightSpots ?? []) {
      final date = Jiffy(DateTime.fromMillisecondsSinceEpoch(spot.x.toInt() * 1000))
          .startOf(Units.DAY);
      historyMap[date] = WeightHistoryItemModel(date: date);
      final planSpot = awaitSpots
          .firstWhere((el) =>
              Jiffy(DateTime.fromMillisecondsSinceEpoch(el.x.toInt() * 1000))
                  .startOf(Units.DAY) ==
              date)
          .y;
      historyMap[date].addValue(data: spot?.y ?? 0, normal: planSpot);
    }
    final sortedKeys = historyMap.keys.toList();
    sortedKeys.sort((a, b) => b.compareTo(a));
    history.clear();
    for (final key in sortedKeys) {
      history.add(historyMap[key]);
    }
    notifyListeners();
  }

  // @override
  // DateTime get historyStartDate =>
  //     (history?.isNotEmpty ?? true) ? history.last.date : DateTime.now();

  @override
  Future loadMeasure() async {
    measureIsBusy = true;
    notifyListeners();
    final response = await api.api.v1MeasureGetMeasurePost(
      date: Jiffy(selectedDate).startOf(Units.DAY).toString() ??
          Jiffy(DateTime.now()).startOf(Units.DAY).toString(),
      body: null,
    );
    currentMeasure = response.body;
    measureIsBusy = false;
    notifyListeners();
  }
}
