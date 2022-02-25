import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:supercharged/supercharged.dart';

extension ChartListExt on List<ChartDataModel> {
  ChartDataModel get kgByDate => firstWhere(
        (el) => el.xAxisType == ChartsAxisType.date && el.yAxisType == ChartsAxisType.kg,
        orElse: () => null,
      );

  ChartDataModel get numByDate => firstWhere(
        (el) =>
            el.xAxisType == ChartsAxisType.date && el.yAxisType == ChartsAxisType.number,
        orElse: () => null,
      );

  ChartDataModel get smByDate => firstWhere(
        (el) => el.xAxisType == ChartsAxisType.date && el.yAxisType == ChartsAxisType.sm,
        orElse: () => null,
      );
}

extension ChartDataModelExt on ChartDataModel {
  double get minX => plots?.map((e) => e.minX)?.minBy((a, b) => a.compareTo(b));
  double get maxX => plots?.map((e) => e.maxX)?.maxBy((a, b) => a.compareTo(b));

  double get minY => plots?.map((e) => e.minY)?.minBy((a, b) => a.compareTo(b));
  double get maxY => plots?.map((e) => e.maxY)?.maxBy((a, b) => a.compareTo(b));
}

extension ChartPlotExt on ChartPlot {
  double get spotsMinX => spots?.minBy((a, b) => a.x.compareTo(b.x))?.x;
  double get spotsMaxX => spots?.maxBy((a, b) => a.x.compareTo(b.x))?.x;

  double get spotsMinY => spots?.minBy((a, b) => a.y.compareTo(b.y))?.y;
  double get spotsMaxY => spots?.maxBy((a, b) => a.y.compareTo(b.y))?.y;

  double get additionMinX =>
      chartAdditions?.map((e) => e?.minX)?.minBy((a, b) => a.compareTo(b));
  double get additionMaxX =>
      chartAdditions?.map((e) => e?.maxX)?.maxBy((a, b) => a.compareTo(b));

  double get additionMinY =>
      chartAdditions?.map((e) => e?.minY)?.minBy((a, b) => a.compareTo(b));
  double get additionMaxY =>
      chartAdditions?.map((e) => e?.maxY)?.maxBy((a, b) => a.compareTo(b));

  // решение неочень красивое, но его легко дебажить
  double get minX => <double>[
        if (spotsMinX != null) spotsMinX,
        if (additionMinX != null) additionMinX
      ]?.minBy((a, b) => a?.compareTo(b));
  double get maxX => <double>[
        if (spotsMaxX != null) spotsMaxX,
        if (additionMaxX != null) additionMaxX
      ]?.maxBy((a, b) => a?.compareTo(b));

  double get minY => <double>[
        if (spotsMinY != null) spotsMinY,
        if (additionMinY != null) additionMinY
      ]?.minBy((a, b) => a?.compareTo(b));
  double get maxY => <double>[
        if (spotsMaxY != null) spotsMaxY,
        if (additionMaxY != null) additionMaxY
      ]?.maxBy((a, b) => a?.compareTo(b));
}

extension AdditionExt on ChartAddition {
  double get minX => spots?.minBy((a, b) => a.x.compareTo(b.x))?.x;
  double get maxX => spots?.maxBy((a, b) => a.x.compareTo(b.x))?.x;

  double get minY => spots?.minBy((a, b) => a.y.compareTo(b.y))?.y;
  double get maxY => spots?.maxBy((a, b) => a.y.compareTo(b.y))?.y;
}
