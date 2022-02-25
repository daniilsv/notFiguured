import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/data/repository/diary_repository.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class GoalControlViewModel extends AppViewModel {
  final BuildContext context;
  final ChartsAxisType xAxis;
  final ChartsAxisType yAxis;
  final List<ChartsType> plots;

  GoalControlViewModel(
    this.context, {
    @required this.plots,
    @required this.xAxis,
    @required this.yAxis,
  })  : assert(plots?.isNotEmpty ?? false),
        assert(xAxis != null && yAxis != null),
        super(context) {
    diaryRepository = context.read<DiaryService>().repository;
  }

  Future loadMeasure();
  Future loadHistory() async {}
  Future loadChart() async {}
  void edit();
  void addRecord();
  void saveMeasurement();

  DateTime get minRollingDate;
  DateTime get maxRollingDate;
  int get historyLength;
  DateTime historyStartDate = Jiffy(DateTime.now().subtract(const Duration(days: 15))).startOf(Units.MONTH);

  DiaryRepository diaryRepository;
  ChartPeriodMode periodMode = ChartPeriodMode.week;
  DateTime selectedDate = Jiffy(DateTime.now()).startOf(Units.DAY);
  ChartDataModel chart;
  bool chartIsBusy = true;
  bool measureIsBusy = true;
  bool historyIsBusy = true;
  List<DateTime> markedDates = <DateTime>[];

  DateTime get fromDate {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return Jiffy(DateTime.now()).startOf(Units.DAY).subtract(const Duration(days: 6));
      case ChartPeriodMode.month:
        return Jiffy(DateTime.now().subtract(const Duration(days: 30)))
            .startOf(Units.WEEK);
      case ChartPeriodMode.all:
        return Jiffy(historyStartDate).startOf(Units.MONTH);
      default:
        return DateTime.now();
    }
  }

  DateTime get toDate {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return Jiffy(DateTime.now()).endOf(Units.DAY);
      case ChartPeriodMode.month:
        return Jiffy(DateTime.now()).endOf(Units.WEEK);
      case ChartPeriodMode.all:
        return Jiffy(DateTime.now()).endOf(Units.MONTH);
      default:
        return Jiffy(DateTime.now()).endOf(Units.DAY);
    }
  }

  DateFormat get dateFormatter {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return DateFormat.E();
      case ChartPeriodMode.month:
        return DateFormat("dd.MM");
      case ChartPeriodMode.all:
        return DateFormat('MMM');
      default:
        return DateFormat.EEEE();
    }
  }

  IntervalType get intervalType {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return IntervalType.day;
      case ChartPeriodMode.month:
        return IntervalType.week;
      case ChartPeriodMode.all:
        return IntervalType.month;
      default:
        return IntervalType.day;
    }
  }

  double get interval {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return 1.0;
      case ChartPeriodMode.month:
        return 7.0;
      case ChartPeriodMode.all:
        return 1.0;
      default:
        return 1.0;
    }
  }

  String get chartTitle {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return Utils.getDatePeriod(fromDate, toDate);
      case ChartPeriodMode.month:
        return Utils.getDatePeriod(
          fromDate,
          toDate,
        );
      case ChartPeriodMode.all:
        return Utils.getDatePeriod(
          fromDate,
          toDate,
        );
      default:
        return "---";
    }
  }

  DateTimeIntervalType get timeInterval {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return DateTimeIntervalType.days;
      case ChartPeriodMode.month:
        return DateTimeIntervalType.days;
      case ChartPeriodMode.all:
        return DateTimeIntervalType.months;
      default:
        return DateTimeIntervalType.days;
    }
  }

  DateTime get minimumDate {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return fromDate;
      case ChartPeriodMode.month:
        return fromDate;
      case ChartPeriodMode.all:
        return DateTime(2020);
      default:
        return null;
    }
  }

  DateTime get maximumDate {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return toDate;
      case ChartPeriodMode.month:
        return toDate;
      case ChartPeriodMode.all:
        return toDate;
      default:
        return null;
    }
  }

  Future<void> changePeriodMode(ChartPeriodMode mode) async {
    chartIsBusy = true;
    periodMode = mode;
    await _loadHistory();
    await loadChart();
    notifyListeners();
  }

  void changeDate(DateTime datetime) {
    selectedDate = datetime;
    _loadMeasure();
    notifyListeners();
  }

  Future<void> onReady() async {
    await _loadHistory();
    await _loadMeasure();
    await loadChart();
    notifyListeners();
  }

  Future _loadMeasure() async {
    measureIsBusy = true;
    notifyListeners();
    try {
      await loadMeasure();
    } on Exception catch (ex) {
      logger.e(ex.toString());
    } finally {
      measureIsBusy = false;
      notifyListeners();
    }
  }

  Future _loadHistory() async {
    historyIsBusy = true;
    notifyListeners();
    try {
      await loadHistory();
    } on Exception catch (ex) {
      logger.e(ex.toString());
    } finally {
      historyIsBusy = false;
      notifyListeners();
    }
  }

  

  @override
  void errorRequest([int errorStatus]) {}
}
