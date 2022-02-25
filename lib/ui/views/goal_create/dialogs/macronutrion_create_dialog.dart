import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/views/goal_create/dialogs/main_create_dialog.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/ui/views/goal_create/macronutrition_goal_create/macronutrition_create_view.dart';
import 'package:flutter/material.dart';

class MacronutrionCreateDialog extends StatelessWidget {
  const MacronutrionCreateDialog({Key key, this.predefined}) : super(key: key);
  final PredefinedGoalData predefined;

  @override
  Widget build(BuildContext context) {
    return MainCreateDialog(
      onNewTap: () =>
          Navigator.of(context).pushReplacement(MacronutritionGoalCreateRoute()),
      onEditTap: () => Navigator.of(context)
          .pushReplacement(MacronutritionGoalCreateRoute(predefined)),
      goalImage: Assets.macronutrion,
      prevGoalText: const SizedBox(),
      haveGoalText: 'У Вас уже есть цель по контролю употребления БЖУ.',
    );
  }
}
