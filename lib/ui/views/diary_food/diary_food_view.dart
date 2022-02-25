import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/calendar_rolling_strip.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'diary_food_viewmodel.dart';
import 'widgets/food_container.dart';

class DiaryFoodRoute extends MaterialPageRoute {
  DiaryFoodRoute() : super(builder: (context) => const DiaryFoodView());
}

class DiaryFoodView extends StatelessWidget {
  const DiaryFoodView();
  @override
  Widget build(BuildContext context) {
    final dataGridTextStyle =
        [AppStylesBig.body3Medium, AppStylesSmall.body3Medium].byHeight;

    return ViewModelBuilder<DiaryFoodViewModel>.reactive(
      viewModelBuilder: () => DiaryFoodViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            AppScaffold(
              title: Strings.current.food_diary,
              waiting: model.isBusy,
              stickyHeader: CalendarRollingStrip(
                from: model.minRollingDate,
                to: model.maxRollingDate,
                markedDates: model.markedDates,
                accentColor: AppColors.primary,
                value: model.selectedDate,
                onChange: model.changeDate,
                height: 88.0,
              ),
              body: Column(
                children: [
                  if (model.currentDayDiary?.summary != null)
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(""),
                              Text("${Strings.current.of_calories}:",
                                  style: dataGridTextStyle.copyWith(
                                      color: AppColors.greyB8)),
                              Text("${Strings.current.of_protein}:",
                                  style: dataGridTextStyle.copyWith(
                                      color: AppColors.greyB8)),
                              Text("${Strings.current.of_fat}:",
                                  style: dataGridTextStyle.copyWith(
                                      color: AppColors.greyB8)),
                              Text("${Strings.current.of_carbohydrate}:",
                                  style: dataGridTextStyle.copyWith(
                                      color: AppColors.greyB8)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Strings.current.plan, style: dataGridTextStyle),
                              Text(
                                  Utils.getKaloriesStr(
                                      model.currentDayDiary.summary.targetCalorie),
                                  style:
                                      dataGridTextStyle.copyWith(color: AppColors.green)),
                              Text(
                                  Utils.getMassStr(
                                      model.currentDayDiary.summary.targetProtein),
                                  style:
                                      dataGridTextStyle.copyWith(color: AppColors.blue)),
                              Text(
                                  Utils.getMassStr(
                                      model.currentDayDiary.summary.targetFat),
                                  style:
                                      dataGridTextStyle.copyWith(color: AppColors.pink)),
                              Text(
                                  Utils.getMassStr(
                                      model.currentDayDiary.summary.targetCarb),
                                  style: dataGridTextStyle.copyWith(
                                      color: AppColors.yellow)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Strings.current.fact, style: dataGridTextStyle),
                              Text(
                                  Utils.getKaloriesStr(
                                      model.currentDayDiary.summary.foodCalorie),
                                  style:
                                      dataGridTextStyle.copyWith(color: AppColors.green)),
                              Text(
                                  Utils.getMassStr(model.currentDayDiary.summary.protein),
                                  style:
                                      dataGridTextStyle.copyWith(color: AppColors.blue)),
                              Text(Utils.getMassStr(model.currentDayDiary.summary.fat),
                                  style:
                                      dataGridTextStyle.copyWith(color: AppColors.pink)),
                              Text(Utils.getMassStr(model.currentDayDiary.summary.carb),
                                  style: dataGridTextStyle.copyWith(
                                      color: AppColors.yellow)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Divider(),
                  ),
                  if (model.productsIsEmpty)
                    Text(
                      Strings.current.day_diary_is_empty,
                      style: dataGridTextStyle.copyWith(color: AppColors.greyB8),
                      textAlign: TextAlign.center,
                    )
                  else
                    ...model.currentDayDiary.foodContainers
                        .where((el) => el.products.isNotEmpty)
                        .map((el) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: FoodContainerWidget(el),
                            ))
                        .toList(),
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
