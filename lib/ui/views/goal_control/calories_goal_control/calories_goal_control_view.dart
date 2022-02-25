import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/goal_history_card/single.dart';
import 'package:notfiguured/ui/widgets/history_legend.dart';
import 'package:flutter/material.dart';

import 'package:notfiguured/app/breakpoints.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../goal_control_view.dart';
import 'calories_goal_control_viewmodel.dart';
import 'widgets/detail_goal_card.dart';

class CaloriesGoalControlRoute extends MaterialPageRoute {
  CaloriesGoalControlRoute() : super(builder: (context) => CaloriesGoalControlView());
}

class CaloriesGoalControlView extends GoalControlView<CaloriesGoalControlViewModel> {
  CaloriesGoalControlView()
      : super(
          mainColor: AppColors.green,
          title: Strings.current.control_calories,
          assetIcon: Assets.calories,
          chartHeight: 400,
          showAddMeasureButton: true,
          showSaveMeasureButton: false,
        );

  @override
  CaloriesGoalControlViewModel buildModel(BuildContext context) {
    return CaloriesGoalControlViewModel(context);
  }

  @override
  Widget chart(CaloriesGoalControlViewModel model) {
    return IgnorePointer(
      ignoring: model.periodMode != ChartPeriodMode.all,
      child: SfCartesianChart(
        trackballBehavior: TrackballBehavior(activationMode: ActivationMode.singleTap),
        primaryXAxis: DateTimeCategoryAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          tickPosition: TickPosition.inside,
          labelAlignment: LabelAlignment.center,
          rangePadding: ChartRangePadding.none,
          minimum: model.minimumDate,
          maximum: model.maximumDate,
          dateFormat: model.dateFormatter,
          interval: 1,
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
          text: model.chart == null ? '' : model.chartTitle,
          textStyle: [
            AppStylesSmall.headline2Bold,
            AppStylesBig.headline2Bold,
          ].byHeight,
          alignment: ChartAlignment.near,
        ),
        legend: Legend(
          overflowMode: LegendItemOverflowMode.wrap,
          isVisible: true,
          width: '110%',
          height: '40%',
          position: LegendPosition.bottom,
          legendItemBuilder: (legendText, series, point, seriesIndex) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (seriesIndex % 2 == 0)
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: (series as StackedColumnSeries).color,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    )
                  else ...[
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: (series as StackedColumnSeries).color.withOpacity(1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Center(
                        child: Container(
                          width: 8.0,
                          height: 3.0,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: AppBorderRadius.card,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: (series as StackedColumnSeries).color,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: (series as StackedColumnSeries).color.withOpacity(1.0),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 110,
                    child: AutoSizeText(
                      "- $legendText",
                      style: [
                        AppStylesSmall.body3Regular,
                        AppStylesBig.body3Regular,
                      ].byHeight.copyWith(color: AppColors.text),
                    ),
                  ),
                  if (seriesIndex % 2 == 0) const SizedBox(width: 15.0),
                ],
              ),
            );
          },
        ),
        series: model.series,
      ),
    );
  }

  @override
  Widget detail(CaloriesGoalControlViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            CaloriesDetailGoalCard(
              title: 'Норма за день',
              value: model.goal,
              valueColor: AppColors.green,
            ),
            const SizedBox(width: 13),
            CaloriesDetailGoalCard(
              title: 'Осталось',
              value: model.leftCalorie,
              valueColor: AppColors.green,
            ),
          ],
        ),
        const SizedBox(height: 13),
        Row(
          children: [
            CaloriesDetailGoalCard(
              title: 'Съедено за день',
              value: model.eatenInDay,
            ),
            const SizedBox(width: 13),
            CaloriesDetailGoalCard(
              title: 'Сожжено за день',
              value: model.spentInDay,
            ),
          ],
        ),
        const SizedBox(height: 11),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [AppShadows.easy],
            borderRadius: AppBorderRadius.smallCard,
          ),
          child: Padding(
            padding: AppPaddings.all20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Цель выполнена на:',
                  style: [
                    AppStylesSmall.body3Regular,
                    AppStylesBig.body3Regular,
                  ].byHeight.copyWith(
                        color: AppColors.grey87,
                      ),
                ),
                Text(
                  model.complitedPercent ?? '',
                  style: [
                    AppStylesSmall.body3Regular,
                    AppStylesBig.body3Regular,
                  ].byHeight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget historyHeader(CaloriesGoalControlViewModel model) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: HistoryLegend(),
    );
  }

  @override
  Widget historyItem(
    CaloriesGoalControlViewModel model,
    BuildContext context,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleHistoryCard(
        color: AppColors.green,
        date: model.history[index].date,
        spot: model.history[index].spot,
        units: 'кК',
      ),
    );
  }
}
