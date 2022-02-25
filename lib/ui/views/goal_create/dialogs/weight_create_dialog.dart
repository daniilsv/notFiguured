import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/goal_create/weight_goal_create/weight_create_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../goal_create.dart';
import 'main_create_dialog.dart';

class WeightCreateDialog extends StatelessWidget {
  const WeightCreateDialog({Key key, this.predefined}) : super(key: key);
  final PredefinedGoalData predefined;

  @override
  Widget build(BuildContext context) {
    return MainCreateDialog(
      prevGoalText: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: '« ',
                style: [
                  AppStylesSmall.body1SemiBold,
                  AppStylesBig.body1SemiBold,
                ].byHeight.copyWith(color: AppColors.greyB8)),
            TextSpan(text: '${predefined.weight} кг'),
            const TextSpan(text: ' → '),
            TextSpan(
                text: '${predefined.goal} кг',
                style: [
                  AppStylesSmall.body1SemiBold,
                  AppStylesBig.body1SemiBold,
                ].byHeight.copyWith(color: AppColors.pink)),
            TextSpan(
                text: ' »',
                style: [
                  AppStylesSmall.body1SemiBold,
                  AppStylesBig.body1SemiBold,
                ].byHeight.copyWith(color: AppColors.greyB8)),
          ],
          style: [
            AppStylesSmall.body1SemiBold,
            AppStylesBig.body1SemiBold,
          ].byHeight,
        ),
      ),
      goalImage: Assets.kg,
      onEditTap: () => Navigator.of(context).pushReplacement(
        WeightGoalCreateRoute(predefined),
      ),
      onNewTap: () => Navigator.of(context).pushReplacement(WeightGoalCreateRoute()),
      haveGoalText: 'У Вас уже есть цель по контролю веса.',
      primary: AppColors.pink,
      primaryDark: AppColors.pinkDark,
    );
  }
}
