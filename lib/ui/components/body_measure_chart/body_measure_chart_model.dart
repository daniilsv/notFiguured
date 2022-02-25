import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';

import 'body_measure_chart_component.dart';

class BodyMeasureChartComponentModel extends AppViewModel {
  final BuildContext context;

  BodyMeasureChartComponentModel(
    this.context,
    BodyMeasureChartComponentDemendency dependency,
  ) : super(context) {
    showPeriodControls = dependency?.showPeriodControls;
    chartsType = dependency?.chartsType;
    periodMode = ChartPeriodMode.all;
    period = dependency?.period;
  }

  bool showPeriodControls;
  DateTimeRange period;
  ChartPeriodMode periodMode;
  ChartsType chartsType;
  ChartDataModel chart;

  ChartPlot get mainPlot => chart?.plots?.first;
  ChartAddition get prognosis => chart?.plots?.first?.chartAdditions
      ?.firstWhere((e) => e.name == ChartsAdditionType.plan, orElse: () => null);

  DateTime get fromDate {
    switch (periodMode) {
      case ChartPeriodMode.week:
        return Jiffy().startOf(Units.WEEK);
      case ChartPeriodMode.month:
        return Jiffy().startOf(Units.MONTH);
      case ChartPeriodMode.all:
        return DateTime.fromMillisecondsSinceEpoch(0);
      default:
        return DateTime.now();
    }
  }

  void changePeriodMode(ChartPeriodMode mode) {
    periodMode = mode;
    load();
  }

  Future load() async {
    setBusy(true);
    try {
      final response = await api.api.v1MeasureGetMeasuresChartDataPost(
        body: MeasureChartDataRequestModel(
          fromDate: fromDate,
          toDate: DateTime.now(),
          chartTypes: [chartsType],
        ),
      );
      // chart = response.body.firstWhere(
      //   (c) =>
      //       c?.plots?.any((p) =>
      //           p.spots.isNotEmpty || p.additions.any((a) => a.spots.isNotEmpty)) ??
      //       false,
      //   orElse: () => null,
      // );
    } on Exception catch (ex) {
      logger.e(ex.toString());
    } finally {
      setBusy(false);
    }
  }

  void onReady() {
    load();
  }

  @override
  void errorRequest([int errorStatus]) {}
}
