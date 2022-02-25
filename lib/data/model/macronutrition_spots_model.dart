import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'custom_spot_model.dart';

class MacronutritionSpots {
  MacronutritionSpots({
    @required this.shortName,
    @required this.groupName,
    @required this.color,
  });
  List<Spot> data = [];
  List<Spot> divider = [];
  List<Spot> overflow = [];
  List<Spot> deficit = [];
  Map<double, CustomSpot> common = <double, CustomSpot>{};
  final String shortName;
  final String groupName;
  final Color color;
}

extension SpotsExtension on MacronutritionSpots {
  List<StackedColumnSeries<Spot, DateTime>> toSeries(ChartPeriodMode periodMode) {
    final t = this;
    double width;
    int start;
    switch (periodMode) {
      case ChartPeriodMode.week:
        start = 0;
        width = 0.8;
        break;
      case ChartPeriodMode.month:
        start = 0;
        width = 0.8;
        break;
      case ChartPeriodMode.all:
        start = 0;
        width = 0.8;
        break;
    }
    return [
      StackedColumnSeries<Spot, DateTime>(
        name: 'Съедено ${t.shortName}',
        groupName: t.groupName,
        borderRadius: AppBorderRadius.chartColumn,
        color: t.color,
        dataSource: t.data,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        // width: width,
      ),
      StackedColumnSeries<Spot, DateTime>(
        groupName: t.groupName,
        color: AppColors.white,
        dataSource: t.divider,
        isVisibleInLegend: false,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        width: width,
      ),
      StackedColumnSeries<Spot, DateTime>(
        groupName: t.groupName,
        borderRadius: AppBorderRadius.chartColumn,
        color: t.color,
        dataSource: t.overflow,
        isVisibleInLegend: false,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        // width: width,
      ),
      StackedColumnSeries<Spot, DateTime>(
        name: 'Норма ${t.shortName}',
        groupName: t.groupName,
        borderRadius: AppBorderRadius.chartColumn,
        color: t.color.withOpacity(0.2),
        dataSource: t.deficit,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        // width: width,
      ),
    ];
  }
}
