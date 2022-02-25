import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary/widgets/goal_button.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'goal_create_view_model.dart';

class PredefinedGoalData extends TargetCurrentFactModel {
  PredefinedGoalData({
    double weight,
    double protein,
    double fat,
    double carbon,
    int calories,
    double water,
    this.height,
    this.mo,
    this.tu,
    this.we,
    this.th,
    this.fr,
    this.sa,
    this.su,
    this.goal,
    this.popAfter = false,
  }) : super(
          weight: weight,
          protein: protein,
          fat: fat,
          carbon: carbon,
          calories: calories,
          water: water,
        );
  final int mo;
  final int tu;
  final int we;
  final int th;
  final int fr;
  final int sa;
  final int su;
  final double goal;
  final double height;
  final bool popAfter; //sorry
}

class GoalCreateRoute extends MaterialPageRoute {
  GoalCreateRoute({
    PredefinedGoalData predefinedWeight,
    PredefinedGoalData predefinedCalories,
    PredefinedGoalData predefinedMacronutrition,
  }) : super(
          settings: const RouteSettings(name: 'goal_create'),
          builder: (context) => GoalCreateView(
            isPage: true,
            predefinedWeight: predefinedWeight,
            predefinedCalories: predefinedCalories,
            predefinedMacronutrition: predefinedMacronutrition,
          ),
        );
}

class GoalCreateView extends StatelessWidget {
  const GoalCreateView({
    this.isPage = false,
    this.predefinedWeight,
    this.predefinedCalories,
    this.predefinedMacronutrition,
  });
  final bool isPage;
  final PredefinedGoalData predefinedWeight;
  final PredefinedGoalData predefinedCalories;
  final PredefinedGoalData predefinedMacronutrition;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GoalCreateViewModel>.reactive(
      viewModelBuilder: () => GoalCreateViewModel(
        context,
        predefinedWeight: predefinedWeight,
        predefinedCalories: predefinedCalories,
        predefinedMacronutrition: predefinedMacronutrition,
      ),
      builder: (context, model, _) => Container(
        color: AppColors.white,
        padding: AppPaddings.h30,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isPage) const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isPage ? Strings.current.new_goal : Strings.current.choose_goal,
                    style: [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold]
                        .byWidth,
                  ),
                  if (isPage)
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        Strings.current.to_cancel,
                        style: [AppStylesSmall.body3Medium, AppStylesBig.body3Medium]
                            .byHeight
                            .copyWith(color: AppColors.primary),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 35),
              Text(
                isPage
                    ? Strings.current.new_goal_description
                    : Strings.current.choose_goal_description,
                style: [AppStylesSmall.body1Regular, AppStylesBig.body1Regular]
                    .byWidth
                    .copyWith(color: AppColors.grey87),
              ),
              if (isPage) const Spacer() else SizedBox(height: [45.0, 50.0].byHeight),
              GoalButton(
                icon: Assets.kg,
                title: Strings.current.control_weight,
                onPressed: model.onCreateWeightGoal,
              ),
              GoalButton(
                icon: Assets.calories,
                title: Strings.current.control_calories,
                onPressed: model.onCreateCaloriesGoal,
              ),
              GoalButton(
                icon: Assets.macronutrion,
                title: Strings.current.control_macronutrition,
                onPressed: model.onCreateMacronutritionGoal,
              ),
              SizedBox(height: [10.0, 25.0].byHeight),
            ],
          ),
        ),
      ),
    );
  }
}
