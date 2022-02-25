import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/calendar_rolling_strip.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'diary_exercise_viewmodel.dart';
import 'widgets/summary_exercise.dart';

class DiaryExerciseRoute extends MaterialPageRoute {
  DiaryExerciseRoute() : super(builder: (context) => const DiaryExerciseView());
}

class DiaryExerciseView extends StatelessWidget {
  const DiaryExerciseView();
  @override
  Widget build(BuildContext context) {
    final dataGridTextStyle =
        [AppStylesBig.body3Medium, AppStylesSmall.body3Medium].byHeight;
    final textStyleGrey = dataGridTextStyle.copyWith(color: AppColors.greyB8);
    final textStyleGreen = dataGridTextStyle.copyWith(color: AppColors.green);

    return ViewModelBuilder<DiaryExerciseViewModel>.reactive(
      viewModelBuilder: () => DiaryExerciseViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            AppScaffold(
              title: Strings.current.exercise_diary,
              waiting: model.isBusy,
              contentPadding: EdgeInsets.zero,
              stickyHeader: CalendarRollingStrip(
                from: model.minRollingDate,
                to: model.maxRollingDate,
                markedDates: model.markedDates,
                accentColor: AppColors.primary,
                value: model.selectedDate,
                onChange: model.changeDate,
                height: 88.0,
              ),
              onRefresh: () async => {model.loadDiary(force: true)},
              body: Column(
                children: [
                  const SizedBox(height: 25),
                  if (model.currentDayEat > 0 || model.currentDayBurn > 0) ...[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      padding: const EdgeInsets.all(18),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [AppShadows.easy],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          if (model.currentDayEat > 0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.current.today_eat,
                                  style: textStyleGrey,
                                ),
                                Text(
                                  Utils.getKaloriesStr(model.currentDayEat),
                                  style: dataGridTextStyle,
                                ),
                              ],
                            ),
                          if (model.currentDayEat > 0 && model.currentDayBurn > 0)
                            const SizedBox(height: 12),
                          if (model.currentDayBurn > 0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.current.today_burn,
                                  style: textStyleGrey,
                                ),
                                Text(
                                  '-${Utils.getKaloriesStr(model.currentDayBurn)}',
                                  style: textStyleGreen,
                                ),
                              ],
                            ),
                          if (model.currentDayEat > 0 && model.currentDayBurn > 0) ...[
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.current.today_ex,
                                  style: textStyleGrey,
                                ),
                                Text(
                                  Utils.getKaloriesStr(model.currentDaySum),
                                  style: model.currentDayEat > model.currentDayBurn
                                      ? dataGridTextStyle
                                      : textStyleGreen,
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                  ],
                  if (model.exercisesIsEmpty)
                    Text(
                      Strings.current.day_exercise_diary_is_empty,
                      style: dataGridTextStyle.copyWith(color: AppColors.greyB8),
                      textAlign: TextAlign.center,
                    )
                  else ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Ваша тренировка',
                            style: [
                              AppStylesBig.headline2Bold,
                              AppStylesSmall.headline2Bold
                            ].byHeight,
                          ),
                          const SizedBox(height: 20.0),
                          for (final exercise in model.currentDayDiary.exercises)
                            ExerciseSummaryCard(
                              exercise: exercise,
                              onTap: model.onExerciseTap,
                              userWeight: model.userWeight,
                            ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 120.0),
                ],
              ),
            ),
            if (!model.isBusy)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: AppButton(
                    onPressed: model.addRecord,
                    text: Strings.current.add_record,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
