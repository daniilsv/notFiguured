import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/goal_control/goal_control_view.dart';
import 'package:notfiguured/ui/widgets/history_legend.dart';
import 'package:notfiguured/ui/widgets/history_row.dart';
import 'package:notfiguured/ui/widgets/input_card.dart';
import 'package:notfiguured/ui/widgets/property_value.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/charts_type.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'detail_measurement_viewmodel.dart';

class DetailMeasurementRoute extends MaterialPageRoute {
  DetailMeasurementRoute(MeasurementType measurementType, DateTime date)
      : super(
          builder: (context) =>
              DetailMeasurementView(measurementType: measurementType, date: date),
        );
}

class DetailMeasurementView extends GoalControlView<DetailMeasurementViewModel> {
  final MeasurementType measurementType;
  final DateTime date;

  DetailMeasurementView({@required this.measurementType, this.date})
      : super(
          title: measurementType.name,
          showEditGoal: false,
          showSaveMeasureButton: true,
        );

  @override
  String get addRecordText => Strings.current.add_measurement;

  @override
  DetailMeasurementViewModel buildModel(BuildContext context) =>
      DetailMeasurementViewModel(context, measurementType, date);

  @override
  Widget chart(DetailMeasurementViewModel model) {
    return SfCartesianChart(
      enableAxisAnimation: true,
      trackballBehavior: TrackballBehavior(activationMode: ActivationMode.singleTap),
      primaryXAxis: DateTimeAxis(
        tickPosition: TickPosition.inside,
        labelAlignment: model.periodMode == ChartPeriodMode.all
            ? LabelAlignment.end
            : LabelAlignment.center,
        rangePadding: ChartRangePadding.none,
        minimum: model.periodMode == ChartPeriodMode.all ? null : model.minimumDate,
        maximum: model.periodMode == ChartPeriodMode.all ? null : model.maximumDate,
        visibleMinimum: model.periodMode != ChartPeriodMode.all
            ? null
            : (model.minRollingDate.isBefore(DateTime(2020))
                ? DateTime(2020)
                : null),
        dateFormat: model.dateFormatter,
        interval: model.interval,
        intervalType: model.timeInterval,
        labelRotation: model.periodMode == ChartPeriodMode.all ? 45 : 0,
        majorGridLines: MajorGridLines(width: 0.5, color: Colors.grey[200]),
        minorGridLines: MinorGridLines(width: 0.5, color: Colors.grey[200]),
      ),
      primaryYAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        tickPosition: TickPosition.inside,
        rangePadding: ChartRangePadding.auto,
        majorGridLines: MajorGridLines(width: 0.5, color: Colors.grey[200]),
        minorGridLines: MinorGridLines(width: 0.5, color: Colors.grey[200]),
      ),
      zoomPanBehavior: model.periodMode == ChartPeriodMode.all
          ? ZoomPanBehavior(
              enablePanning: true,
              enablePinching: true,
              zoomMode: ZoomMode.x,
            )
          : null,
      title: ChartTitle(
        text: model.chartTitle,
        textStyle: [AppStylesSmall.headline2Bold, AppStylesBig.headline2Bold].byHeight,
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
                  AppStylesBig.body3Regular,
                ].byHeight,
              ),
              const SizedBox(width: 10.0),
            ],
          );
        },
      ),
      series: <ChartSeries<Spot, DateTime>>[
        if (model.planPlot != null)
          LineSeries<Spot, DateTime>(
            name: Strings.current.prediction,
            color: AppColors.greyDC,
            dataSource: model.planPlot.spots,
            xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch((spot.x * 1000).toInt()))
                      .startOf(Units.DAY),
            yValueMapper: (Spot spot, _) => spot.y,
          ),
        if (model.mainPlot != null)
          LineSeries<Spot, DateTime>(
              name: model.mainPlot.name.name,
              color: mainColor,
              dataSource: model.mainPlot.spots,
              xValueMapper: (Spot spot, _) => Jiffy(DateTime.fromMillisecondsSinceEpoch((spot.x * 1000).toInt()))
                      .startOf(Units.DAY),
              yValueMapper: (Spot spot, _) => spot.y,
              markerSettings: MarkerSettings(isVisible: true)),
      ],
    );
  }

  @override
  Widget detail(DetailMeasurementViewModel model) {
    return Column(
      children: [
        Builder(
          builder: (context) {
            model.updateTextEditingController(); //костыль
            return InputCard(
              title: '${measurementType.name}:',
              value: Utils.numToFixStr(model.currentValue, 1),
              units: measurementType.units,
              editable: true,
              onTextChange: model.onValueChanged,
              controller: model.controller,
            );
          },
        ),
        PropertyValue(
          "${Strings.current.last_measurement}:",
          model.lastValueString,
          highlightedValue: false,
        ),
      ],
    );
  }

  @override
  Widget historyHeader(DetailMeasurementViewModel model) {
    return const HistoryLegend();
  }

  @override
  Widget historyItem(
    DetailMeasurementViewModel model,
    BuildContext context,
    int index,
  ) {
    final Spot spot = model.mainPlot.spots[index];
    final date = DateTime.fromMillisecondsSinceEpoch((spot.x * 1000).toInt());
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 18.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HistoryRow(
            date ?? DateTime.now(),
            color: mainColor,
          ),
          Text(
            model.unitString(spot?.y ?? 0),
            style: [
              AppStylesSmall.body3Medium,
              AppStylesBig.body3Medium,
            ].byHeight.copyWith(color: mainColor),
          )
        ],
      ),
    );
  }
}
