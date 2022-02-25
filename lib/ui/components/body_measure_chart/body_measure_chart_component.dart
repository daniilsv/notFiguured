import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/loading.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/charts_type.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'body_measure_chart_model.dart';

class BodyMeasureChartComponentDemendency {
  final bool showPeriodControls;
  final DateTimeRange period;
  final ChartPeriodMode periodMode;
  final ChartsType chartsType;

  BodyMeasureChartComponentDemendency({
    @required this.chartsType,
    this.periodMode = ChartPeriodMode.week,
    this.period,
    this.showPeriodControls = false,
  });
}

class BodyMeasureChartComponent extends StatelessWidget {
  final BodyMeasureChartComponentDemendency dependency;

  const BodyMeasureChartComponent({
    Key key,
    this.dependency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BodyMeasureChartComponentModel>.reactive(
      viewModelBuilder: () => BodyMeasureChartComponentModel(context, dependency),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return SizedBox(
          height: 400,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    if (model.mainPlot == null)
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Замеры за \n {такой-то такой-то} период \n отсутствуют",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    else
                      SfCartesianChart(
                        trackballBehavior:
                            TrackballBehavior(activationMode: ActivationMode.singleTap),
                        primaryXAxis: DateTimeAxis(),
                        zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true,
                          enablePinching: true,
                          zoomMode: ZoomMode.x,
                        ),
                        title: ChartTitle(
                          text: '2020 — 2021',
                          textStyle: [
                            AppStylesSmall.headline2Bold,
                            AppStylesBig.headline2Bold
                          ].byHeight,
                          alignment: ChartAlignment.near,
                        ),
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                          legendItemBuilder: (legendText, series, point, seriesIndex) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: (series as LineSeries).color,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  "- $legendText",
                                  style: [
                                    AppStylesSmall.body3Regular,
                                    AppStylesBig.body3Regular
                                  ].byHeight,
                                ),
                                const SizedBox(width: 10.0),
                              ],
                            );
                          },
                        ),
                        series: <ChartSeries<Spot, DateTime>>[
                          if (model.mainPlot != null)
                            LineSeries<Spot, DateTime>(
                              name: model.mainPlot.name.name,
                              color: AppColors.pink,
                              dataSource: model.mainPlot.spots,
                              xValueMapper: (Spot spot, _) =>
                                  DateTime.fromMillisecondsSinceEpoch((spot.x * 1000)
                                          .toInt())
                                      ,
                              yValueMapper: (Spot spot, _) => spot.y,
                            ),
                          if (model.prognosis != null)
                            LineSeries<Spot, DateTime>(
                              name: model.prognosis.name.toString(),
                              color: AppColors.greyDC,
                              dataSource: model.prognosis.spots,
                              xValueMapper: (Spot spot, _) =>
                                  DateTime.fromMillisecondsSinceEpoch((spot.x * 1000)
                                          .toInt())
                                    ,
                              yValueMapper: (Spot spot, _) => spot.y,
                            ),
                        ],
                      ),
                  ],
                ),
              ),
              LoadingOverlay(isBusy: model.isBusy),
            ],
          ),
        );
      },
    );
  }
}
