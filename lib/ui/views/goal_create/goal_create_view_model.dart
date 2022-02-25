import 'package:notfiguured/ui/views/goal_create/calories_goal_create/calories_goal_create_view.dart';
import 'package:notfiguured/ui/views/goal_create/dialogs/calories_create_dialog.dart';
import 'package:notfiguured/ui/views/goal_create/dialogs/macronutrion_create_dialog.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/ui/views/goal_create/macronutrition_goal_create/macronutrition_create_view.dart';
import 'package:notfiguured/ui/views/goal_create/weight_goal_create/weight_create_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calories_goal_create/calories_goal_create_view.dart';
import 'dialogs/weight_create_dialog.dart';
import 'macronutrition_goal_create/macronutrition_create_view.dart';

class GoalCreateViewModel extends BaseViewModel {
  GoalCreateViewModel(
    BuildContext context, {
    this.predefinedWeight,
    this.predefinedCalories,
    this.predefinedMacronutrition,
  }) {
    navigator = Navigator.of(context);
  }
  final PredefinedGoalData predefinedWeight;
  final PredefinedGoalData predefinedCalories;
  final PredefinedGoalData predefinedMacronutrition;

  NavigatorState navigator;

  Future<void> onCreateWeightGoal() async {
    if (predefinedWeight != null) {
      showCupertinoModalPopup(
          context: navigator.context,
          builder: (ctx) {
            return WeightCreateDialog(predefined: predefinedWeight);
          });
    } else {
      navigator.push(WeightGoalCreateRoute());
    }
  }

  Future<void> onCreateCaloriesGoal() async {
    if (predefinedCalories != null) {
      showCupertinoModalPopup(
          context: navigator.context,
          builder: (ctx) {
            return CaloriesCreateDialog(predefined: predefinedCalories);
          });
    } else {
      navigator.push(CaloriesGoalCreateRoute());
    }
  }

  Future<void> onCreateMacronutritionGoal() async {
    if (predefinedMacronutrition != null) {
      showCupertinoModalPopup(
          context: navigator.context,
          builder: (ctx) {
            return MacronutrionCreateDialog(predefined: predefinedMacronutrition);
          });
    } else {
      navigator.push(MacronutritionGoalCreateRoute());
    }
  }
}
