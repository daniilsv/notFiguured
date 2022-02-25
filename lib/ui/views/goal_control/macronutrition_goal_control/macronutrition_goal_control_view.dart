import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/data/model/enum/history_type.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/chips_select.dart';
import 'package:notfiguured/ui/widgets/goal_history_card/macronutrition_history_card.dart';
import 'package:notfiguured/ui/widgets/history_legend.dart';
import 'package:flutter/material.dart';

import 'package:notfiguured/app/breakpoints.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../goal_control_view.dart';
import 'macronutrition_goal_control_viewmodel.dart';
import 'widgets/detail_goal_card.dart';
import 'widgets/detail_goal_item.dart';

class MacronutritionGoalControlRoute extends MaterialPageRoute {
  MacronutritionGoalControlRoute()
      : super(builder: (context) => MacronutritionGoalControlView());
}

class MacronutritionGoalControlView
    extends GoalControlView<MacronutritionGoalControlViewModel> {
  MacronutritionGoalControlView()
      : super(
          mainColor: AppColors.primary,
          title: Strings.current.control_macronutrition,
          assetIcon: Assets.macronutrion,
          chartHeight: 400,
          showAddMeasureButton: true,
          showSaveMeasureButton: false,
        );

  @override
  MacronutritionGoalControlViewModel buildModel(BuildContext context) {
    return MacronutritionGoalControlViewModel(context);
  }

  @override
  Widget chart(MacronutritionGoalControlViewModel model) {
    return IgnorePointer(
      ignoring: model.periodMode != ChartPeriodMode.all,
      child: SfCartesianChart(
        trackballBehavior: TrackballBehavior(activationMode: ActivationMode.singleTap),
        primaryXAxis: DateTimeCategoryAxis(
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
          text: model.chart == null ? null : model.chartTitle,
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
  Widget detail(MacronutritionGoalControlViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            MacronutritionDetailGoalCard(
              items: [
                MacronutritionDetailGoalItem(
                  title: 'Белков сегодня',
                  value: model.proteinInDay ?? '',
                ),
                MacronutritionDetailGoalItem(
                  title: 'Жиров сегодня',
                  value: model.fatInDay ?? '',
                ),
                MacronutritionDetailGoalItem(
                  title: 'Углеводов сегодня',
                  value: model.carbonInDay ?? '',
                  withDivider: false,
                ),
              ],
            ),
            const SizedBox(width: 13),
            MacronutritionDetailGoalCard(
              items: [
                MacronutritionDetailGoalItem(
                  title: 'Норма белков',
                  value: model.goalProtein ?? '',
                  valueColor: AppColors.blue,
                ),
                MacronutritionDetailGoalItem(
                  title: 'Норма жиров',
                  value: model.goalFat ?? '',
                  valueColor: AppColors.lightPink,
                ),
                MacronutritionDetailGoalItem(
                  title: 'Норма углеводов',
                  value: model.goalCarbon ?? '',
                  valueColor: AppColors.yellow,
                  withDivider: false,
                ),
              ],
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
  Widget historyHeader(MacronutritionGoalControlViewModel model) {
    return Column(
      children: [
        ChipsSelect<HistoryType>.single(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          options: HistoryType.values,
          value: model.historyType,
          onChange: model.changeHistoryType,
          accentColor: [
            AppColors.black,
            AppColors.blue,
            AppColors.lightPink,
            AppColors.yellow,
          ][model.historyType.index],
          getText: (item) {
            switch (item) {
              case HistoryType.all:
                return 'Все';
              case HistoryType.protein:
                return 'Белки';
              case HistoryType.fat:
                return 'Жиры';
              case HistoryType.carbon:
                return 'Углеводы';
            }
            return '';
          },
        ),
        const SizedBox(height: 25),
        const HistoryLegend(),
      ],
    );
  }

  @override
  Widget historyItem(
    MacronutritionGoalControlViewModel model,
    BuildContext context,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MacronutritionHistoryCard(
        historyItem: model.history[index],
        historyType: model.historyType,
      ),
    );
  }
}
