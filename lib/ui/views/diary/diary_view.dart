import 'package:notfiguured/ui/views/diary/diary_viewmodel.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/ui/widgets/carousel.dart';
import 'package:notfiguured/ui/widgets/goal_card/goal_calories_card.dart';
import 'package:notfiguured/ui/widgets/goal_card/goal_macronutrition_card.dart';
import 'package:notfiguured/ui/widgets/goal_card/goal_weight_card.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';

import 'widgets/exercise_diary_card.dart';
import 'widgets/food_diary_card.dart';
import 'widgets/welcome_header.dart';

class DiaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DiaryViewModel>.reactive(
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        if (model.isEmpty) {
          return const GoalCreateView();
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  WelcomeHeader(
                    name: model.nickname,
                    onAddGoalTap: model.onNewGoalTap,
                  ),
                  AppCarouselView(
                    children: model.goalsList.mapIndexed((currentValue, index) {
                      if (currentValue is TargetWeightModel)
                        return GoalWeightCard(
                          index: index + 1,
                          current: model.current?.weight ?? 0,
                          target: model.repository.weight.val,
                          onTap: model.toWeightGoalControl,
                        );
                      else if (currentValue is TargetCalorieModel)
                        return GoalCaloriesCard(
                          index: index + 1,
                          current: (model.current?.calories ?? 0) - 0.0,
                          target: model.repository.calories.val,
                          burned: model.exerciseToday ?? 0,
                          onTap: model.toCaloriesGoalControl,
                        );
                      else if (currentValue is TargetMacroModel)
                        return GoalMacronutritionCard(
                          index: index + 1,
                          currentP: (model.current.protein /
                                      ((model.todayFood?.summary?.targetProtein ?? 0) /
                                          model.repository.macro.val.protein))
                                  .isNaN || (model.current.protein /
                                      ((model.todayFood?.summary?.targetProtein ?? 0) /
                                          model.repository.macro.val.protein))
                                  .isInfinite
                              ? 0
                              : model.current.protein /
                                  ((model.todayFood?.summary?.targetProtein ?? 0) /
                                      model.repository.macro.val.protein),
                          currentF: (model.current.fat /
                                      ((model.todayFood?.summary?.targetFat ?? 0) /
                                          model.repository.macro.val.fat))
                                  .isNaN || (model.current.fat /
                                      ((model.todayFood?.summary?.targetFat ?? 0) /
                                          model.repository.macro.val.fat))
                                  .isInfinite
                              ? 0
                              : model.current.fat /
                                  ((model.todayFood?.summary?.targetFat ?? 0) /
                                      model.repository.macro.val.fat),
                          currentC: (model.current.carbon /
                                      ((model.todayFood?.summary?.targetCarb ?? 0) /
                                          model.repository.macro.val.carbon))
                                  .isNaN || (model.current.carbon /
                                      ((model.todayFood?.summary?.targetCarb ?? 0) /
                                          model.repository.macro.val.carbon))
                                  .isInfinite
                              ? 0
                              : model.current.carbon /
                                  ((model.todayFood?.summary?.targetCarb ?? 0) /
                                      model.repository.macro.val.carbon),
                          target: model.repository.macro.val,
                          onTap: model.toMacronutritionGoalControl,
                        );
                    }).toList(),
                  ),
                  FoodDiaryCard(
                    model: model,
                    onTap: model.toDiaryFood,
                  ),
                  ExerciseDiaryCard(
                    today: model.exerciseToday ?? 0.0,
                    onTap: model.toDiaryExercise
                        
                  )
                ],
              ),
            ),
          );
        }
      },
      viewModelBuilder: () => DiaryViewModel(context),
    );
  }
}
