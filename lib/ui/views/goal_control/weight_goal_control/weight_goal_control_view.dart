import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/goal_history_card/single.dart';
import 'package:notfiguured/ui/widgets/history_legend.dart';
import 'package:notfiguured/ui/widgets/property_value.dart';
import 'package:notfiguured/ui/widgets/value_measure_text.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/charts_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../goal_control_view.dart';
import 'weight_goal_control_viewmodel.dart';

class WeightGoalControlRoute extends MaterialPageRoute {
  WeightGoalControlRoute() : super(builder: (context) => WeightGoalControlView());
}

class WeightGoalControlView extends GoalControlView<WeightGoalControlViewModel> {
  WeightGoalControlView()
      : super(
          mainColor: AppColors.pink,
          title: Strings.current.control_weight,
          assetIcon: Assets.kg,
        );

  @override
  Widget chart(WeightGoalControlViewModel model) {
    return SfCartesianChart(
      enableAxisAnimation: true,
      trackballBehavior: TrackballBehavior(activationMode: ActivationMode.singleTap),
      primaryXAxis: DateTimeAxis(
        tickPosition: TickPosition.inside,
        labelAlignment: model.periodMode == ChartPeriodMode.all ? LabelAlignment.end : LabelAlignment.center,
        rangePadding: ChartRangePadding.none,
        minimum: model.periodMode == ChartPeriodMode.all ? null : model.minimumDate,
        maximum: model.periodMode == ChartPeriodMode.all ? null : model.maximumDate,
        visibleMinimum: model.periodMode != ChartPeriodMode.all ? null : model.minRollingDate.isBefore(DateTime(2020)) ? DateTime(2020) : null,
        dateFormat: model.dateFormatter,
        interval: model.interval,
        intervalType: model.timeInterval,
        labelRotation: model.periodMode == ChartPeriodMode.all ? 45 : 0,
        majorGridLines:
            MajorGridLines(width: 0.5, color: Colors.grey[200]),
        minorGridLines:
            MinorGridLines(width: 0.5, color:  Colors.grey[200]),
      ),
      primaryYAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        tickPosition: TickPosition.inside,
        rangePadding: ChartRangePadding.auto,
        majorGridLines:
            MajorGridLines(width: 0.5, color: Colors.grey[200]),
        minorGridLines:
            MinorGridLines(width: 0.5, color:  Colors.grey[200]),
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
        textStyle: [
          AppStylesSmall.headline2Bold,
          AppStylesBig.headline2Bold,
        ].byHeight,
        alignment: ChartAlignment.near,
      ),
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        legendItemBuilder: (
          legendText,
          series,
          point,
          seriesIndex,
        ) {
          return Wrap(
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
              name: Strings.current.plan_weight,
              color: AppColors.greyDC,
              dataSource: model.planPlot.spots,
              xValueMapper: (Spot spot, _) =>
                  Jiffy(DateTime.fromMillisecondsSinceEpoch((spot.x * 1000).toInt()))
                      .startOf(Units.DAY),
              yValueMapper: (Spot spot, _) => spot.y),
        // sortingOrder: SortingOrder.descending,
        // // Sorting based on the specified field
        // sortFieldValueMapper: (Spot spot, _) => spot.x),
        if (model.weightPlot != null)
          LineSeries<Spot, DateTime>(
              name: model.weightPlot.name.name,
              color: AppColors.pink,
              dataSource: model.weightPlot.spots,
              xValueMapper: (Spot spot, _) =>
                  Jiffy(DateTime.fromMillisecondsSinceEpoch((spot.x * 1000).toInt()))
                      .startOf(Units.DAY),
              yValueMapper: (Spot spot, _) => spot.y,
              markerSettings: MarkerSettings(isVisible: true)),
        // sortingOrder: SortingOrder.ascending,
        // // Sorting based on the specified field
        // sortFieldValueMapper: (Spot spot, _) => spot.x),
      ],
    );
  }

  @override
  Widget detail(WeightGoalControlViewModel model) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ValueMeasureText(
              value: Utils.getMassStr((model.currentWeight ?? 0) * 1000),
              label: Strings.current.current_weight,
              withNewLine: true,
              reversed: true,
            ),
            ValueMeasureText(
              value: Utils.getMassStr((model.target?.endWeight ?? 0) * 1000),
              label: Strings.current.goal_weight,
              valueColor: mainColor,
              withNewLine: true,
              reversed: true,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              PropertyValue("${Strings.current.goal_met_by}:", model.goalMetBy ?? 0),
              PropertyValue(
                  "${Strings.current.remaining_to_goal}:", model.remainToGoal ?? 0),
              PropertyValue("${Strings.current.deviation}:", model.deviation),
              PropertyValue("${Strings.current.achievement_date}:",
                  "~ ${Jiffy(model.target.endDate).format('dd MMM yyyy')}"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  WeightGoalControlViewModel buildModel(BuildContext context) {
    return WeightGoalControlViewModel(context);
  }

  @override
  Widget historyHeader(WeightGoalControlViewModel model) => const HistoryLegend();

  @override
  Widget historyItem(
    WeightGoalControlViewModel model,
    BuildContext context,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleHistoryCard(
        color: AppColors.pink,
        date: model.history[index].date,
        spot: model.history[index].spot,
        units: 'кг',
        difference: double.parse(((model.history[index].spot.data ?? 0) -
                (model.history[index].spot.normal ?? 0))
            .toStringAsFixed(1)),
      ),
    );
  }
}
