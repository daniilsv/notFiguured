import 'package:notfiguured/data/model/enum/chart_period_mode.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/calendar_rolling_strip.dart';
import 'package:notfiguured/ui/widgets/chips_select.dart';
import 'package:notfiguured/ui/widgets/history_row.dart';
import 'package:notfiguured/ui/widgets/inline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:supercharged/supercharged.dart';

import 'goal_control_viewmodel.dart';

abstract class GoalControlView<T extends GoalControlViewModel> extends StatelessWidget {
  final Color mainColor;
  final String assetIcon;
  final String title;
  final bool showAddMeasureButton;
  final bool showSaveMeasureButton;
  final bool showEditGoal;
  final double chartHeight;

  const GoalControlView({
    this.title = "Контроль цели",
    this.mainColor = AppColors.blue,
    this.showAddMeasureButton = true,
    this.showSaveMeasureButton = false,
    this.showEditGoal = true,
    this.chartHeight = 320,
    this.assetIcon,
    Key key,
  }) : super(key: key);

  T buildModel(BuildContext context);
  Widget detail(T model);
  Widget chart(T model);
  Widget historyHeader(T model);
  Widget historyItem(T model, BuildContext context, int index);

  String get addRecordText => Strings.current.add_record;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 20,
    );
    const loading = Center(child: CupertinoActivityIndicator());
    return ViewModelBuilder<GoalControlViewModel>.reactive(
      viewModelBuilder: () => buildModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) => Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: Navigator.of(context).focusScopeNode.unfocus,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: AppColors.white,
                leading: CupertinoButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.greyB8,
                  ),
                ),
                actions: [
                  if (assetIcon?.isNotEmpty ?? false)
                    SvgPicture.asset(
                      assetIcon,
                      height: 20,
                      width: 20,
                      color: mainColor,
                    ),
                  const SizedBox(width: 20),
                ],
              ),
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: padding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                title ?? '',
                                style: [
                                  AppStylesSmall.headline1Bold,
                                  AppStylesBig.headline1Bold,
                                ].byHeight,
                              ),
                              if (showEditGoal)
                                AppInlineButton(
                                  onTap: model.edit,
                                  text: Strings.current.edit_shortly,
                                ),
                            ],
                          ),
                        ),
                        CalendarRollingStrip(
                          from: model.minRollingDate ?? 14.days.ago(),
                          to: model.maxRollingDate ?? 7.days.fromNow(),
                          markedDates: model.markedDates,
                          accentColor: mainColor,
                          value: model.selectedDate,
                          onChange: model.changeDate,
                        ),
                        Padding(
                          padding: padding.copyWith(top: 35, bottom: 30),
                          child: model.measureIsBusy ? loading : detail(model),
                        ),
                        const Divider(),
                        Padding(
                          padding: padding,
                          child: Column(
                            children: [
                              ChipsSelect<ChartPeriodMode>.single(
                                options: ChartPeriodMode.values,
                                value: model.periodMode,
                                onChange: model.changePeriodMode,
                                getText: (item) => item?.name ?? '',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: chartHeight,
                          child: model.chartIsBusy
                              ? loading
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: chart(model),
                                ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  SliverStickyHeader(
                    header: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: padding,
                            child: Text(
                              Strings.current.changes_history,
                              style: [
                                AppStylesSmall.headline2Bold,
                                AppStylesBig.headline2Bold,
                              ].byHeight,
                            ),
                          ),
                          historyHeader(model),
                        ],
                      ),
                    ),
                    sliver: model.historyIsBusy
                        ? const SliverToBoxAdapter(child: loading)
                        : SliverPadding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (ctx, index) {
                                  if (index < (model.historyLength ?? 0)) {
                                    return historyItem(model, ctx, index);
                                  }
                                  return DecoratedBox(
                                    decoration: const BoxDecoration(
                                      borderRadius: AppBorderRadius.historyCard,
                                      boxShadow: [AppShadows.easy],
                                      color: AppColors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 18.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          HistoryRow(
                                            model.historyStartDate,
                                            color: mainColor,
                                          ),
                                          Text(
                                            Strings.current.start,
                                            style: [
                                              AppStylesSmall.body3Medium,
                                              AppStylesBig.body3Medium,
                                            ].byHeight.copyWith(color: mainColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                childCount: (model.historyLength ?? 0) + 1,
                              ),
                            ),
                          ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: (showAddMeasureButton || showSaveMeasureButton) ? 100 : 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showAddMeasureButton && MediaQuery.of(context).viewInsets.bottom == 0.0)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: padding,
                child: AppButton(
                  onPressed: model.addRecord,
                  text: addRecordText,
                  color: mainColor,
                ),
              ),
            ),
          if (showSaveMeasureButton && MediaQuery.of(context).viewInsets.bottom != 0.0)
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: Padding(
                padding: padding,
                child: AppButton(
                  onPressed: model.saveMeasurement,
                  text: Strings.current.save,
                  color: mainColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
