import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/goal_create/calories_goal_create/calories_goal_create_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../goal_create.dart';
import 'main_create_dialog.dart';

class CaloriesCreateDialog extends StatelessWidget {
  const CaloriesCreateDialog({Key key, this.predefined}) : super(key: key);
  final PredefinedGoalData predefined;

  @override
  Widget build(BuildContext context) {
    return MainCreateDialog(
      prevGoalText: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: '« ',
              style: [AppStylesSmall.body1SemiBold, AppStylesBig.body1SemiBold]
                  .byHeight
                  .copyWith(color: AppColors.greyB8)),
          if (predefined?.mo == null)
            TextSpan(text: '${predefined.calories} ккал в день')
          else
            const TextSpan(text: 'Программа зигзаг'),
          TextSpan(
              text: ' »',
              style: [AppStylesSmall.body1SemiBold, AppStylesBig.body1SemiBold]
                  .byHeight
                  .copyWith(color: AppColors.greyB8)),
        ], style: [AppStylesSmall.body1SemiBold, AppStylesBig.body1SemiBold].byHeight),
      ),
      goalImage: Assets.calories,
      onEditTap: () =>
          Navigator.of(context).pushReplacement(CaloriesGoalCreateRoute(predefined)),
      onNewTap: () => Navigator.of(context).pushReplacement(CaloriesGoalCreateRoute()),
      haveGoalText: 'У Вас уже есть цель по контролю калорий.',
      primary: AppColors.green,
      primaryDark: AppColors.greenDark,
    );
  }
}
