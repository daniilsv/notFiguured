import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/diary/diary_viewmodel.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class FoodDiaryCard extends StatelessWidget {
  final VoidCallback onTap;
  final DiaryViewModel model;

  const FoodDiaryCard({
    this.onTap,
    this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: AppPaddings.v10h20,
        child: Container(
          padding: AppPaddings.all20,
          decoration: const BoxDecoration(
            borderRadius: AppBorderRadius.smallCard,
            color: Colors.white,
            boxShadow: [AppShadows.easy],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Strings.current.food_diary,
                style:
                    [AppStylesBig.headline2Bold, AppStylesSmall.headline2Bold].byHeight,
              ),
              const SizedBox(height: 20.0),
              Text(
                "${Strings.current.plan_daily}:",
                style: [AppStylesBig.body3Medium, AppStylesSmall.body3Medium]
                    .byHeight
                    .copyWith(color: AppColors.greyB8),
              ),
              const SizedBox(height: 10.0),
              MacronutritionStrip(
                calories: model.todayFood?.summary?.targetCalorie ??
                    model?.repository?.calories?.val?.calories ??
                    2000,
                protein: model.todayFood?.summary?.targetProtein ??
                    ((model?.repository?.calories?.val?.calories ??
                    2000) / 100 * (model?.diaryService?.repository?.macro?.val?.protein ?? 0) / 4),
                fat: model.todayFood?.summary?.targetFat ??
                     ((model?.repository?.calories?.val?.calories ??
                    2000) / 100 * (model?.diaryService?.repository?.macro?.val?.fat ?? 0) / 9),
                carb: model.todayFood?.summary?.targetCarb ??
                     ((model?.repository?.calories?.val?.calories ??
                    2000) / 100 * (model?.diaryService?.repository?.macro?.val?.carbon ?? 0) / 4)
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(),
              ),
              Text(
                "${Strings.current.total_daily}:",
                style: [AppStylesBig.body3Medium, AppStylesSmall.body3Medium]
                    .byHeight
                    .copyWith(color: AppColors.greyB8),
              ),
              const SizedBox(height: 10.0),
              MacronutritionStrip(
                calories: model.todayFood?.summary?.foodCalorie ?? 0,
                protein: model.todayFood?.summary?.protein ?? 0,
                fat: model.todayFood?.summary?.fat ?? 0,
                carb: model.todayFood?.summary?.carb ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
