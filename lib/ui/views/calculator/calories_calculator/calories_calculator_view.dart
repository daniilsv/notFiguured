import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/calculator/widgets/calculator_scaffold.dart';
import 'package:notfiguured/ui/widgets/input_card.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:chopper_api/extensions/sex.dart';
import 'package:chopper_api/extensions/activity.dart';

import 'calories_calculator_viewmodel.dart';

class CalculateCaloriesRoute extends MaterialPageRoute {
  CalculateCaloriesRoute()
      : super(
          builder: (context) => ChangeNotifierProvider(
            create: (ctx) => CaloriesCalculatorViewModel(ctx),
            child: _CaloriesCalculatorView(),
          ),
          settings: const RouteSettings(name: 'calculate_calories'),
        );
}

class _CaloriesCalculatorView extends ViewModelWidget<CaloriesCalculatorViewModel> {
  @override
  Widget build(BuildContext context, CaloriesCalculatorViewModel model) {
    return CalculatorScaffold(
      title: 'Калькулятор\nупотребления калорий',
      assetIcon: Assets.calories,
      buttonText: 'Рассчитать норму',
      isBusy: model.isBusy,
      mainColor: AppColors.green,
      darkolor: AppColors.greenDark,
      onDone: model.calculate,
      children: [
        const SizedBox(height: 30),
        PickerCard(
          title: 'Ваш пол:',
          value: model.sex.localize,
          onPressed: model.onSexTap,
          error: model.errSex,
        ),
        PickerCard(
          title: 'Дата рождения:',
          value: model.birthdayString,
          onPressed: model.onBirthdayTap,
          error: model.errBirthday,
        ),
        PickerCard(
          title: 'Активность:',
          value: model.activity?.title ?? Strings.current.not_indicated,
          onPressed: model.onActivityTap,
          error: model.errActivity,
        ),
        InputCard(
          title: 'Рост:',
          value: model.height?.toString() ?? '0',
          units: Strings.current.sm,
          onPressed: model.onHeightTap,
          error: model.errHeight,
        ),
        InputCard(
          title: 'Вес сейчас:',
          value: model.weight?.toString() ?? '0',
          units: Strings.current.kg,
          onPressed: model.onWeightTap,
          error: model.errWeight,
        ),
        InputCard(
          title: 'Желаемый вес:',
          value: model.goal?.toString() ?? '0',
          units: Strings.current.kg,
          textColor: AppColors.green,
          onPressed: model.onWeightGoalTap,
          error: model.errGoal,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
