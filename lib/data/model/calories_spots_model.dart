import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'custom_spot_model.dart';

class CaloriesSpots {
  List<Spot> data = [];
  List<Spot> divider = [];
  List<Spot> overflow = [];
  List<Spot> deficit = [];
  Map<double, CustomSpot> common = <double, CustomSpot>{};
}

extension SpotsExtension on CaloriesSpots {
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
        name: 'Съедено ккал',
        borderRadius: AppBorderRadius.chartColumn,
        color: AppColors.green,
        dataSource: t.data,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        width: width,
      ),
      StackedColumnSeries<Spot, DateTime>(
        color: AppColors.white,
        dataSource: t.divider,
        isVisibleInLegend: false,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        width: width,
      ),
      StackedColumnSeries<Spot, DateTime>(
        borderRadius: AppBorderRadius.chartColumn,
        color: AppColors.green,
        dataSource: t.overflow,
        isVisibleInLegend: false,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        width: width,
      ),
      StackedColumnSeries<Spot, DateTime>(
        name: 'Норма ккал',
        borderRadius: AppBorderRadius.chartColumn,
        color: AppColors.green.withOpacity(0.2),
        dataSource: t.deficit,
        xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch(
                (spot.x * 1000).toInt())).startOf(Units.DAY).subtract(Duration(hours: start)),
        yValueMapper: (Spot spot, _) => spot.y,
        width: width,
      ),
    ];
  }
}
