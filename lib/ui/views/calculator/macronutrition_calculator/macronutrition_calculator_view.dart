import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/components/macronutrition_input/macronutrition_input_component.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/calculator/widgets/calculator_scaffold.dart';
import 'package:notfiguured/ui/widgets/input_card.dart';
import 'package:notfiguured/ui/views/calculator/widgets/meals_%D1%81ount_card.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'macronutrition_calculator_viewmodel.dart';

class CalculateMacronutritionRoute extends MaterialPageRoute {
  CalculateMacronutritionRoute()
      : super(
          builder: (context) => ChangeNotifierProvider(
            create: (ctx) => MacronutritionCalculatorViewModel(ctx),
            child: _MacronutritionCalculatorView(),
          ),
          settings: const RouteSettings(name: 'calculate_macronutrition'),
        );
}

class _MacronutritionCalculatorView
    extends ViewModelWidget<MacronutritionCalculatorViewModel> {
  @override
  Widget build(BuildContext context, MacronutritionCalculatorViewModel model) {
    return CalculatorScaffold(
      title: 'Калькулятор\nупотребления БЖУ',
      assetIcon: Assets.macronutrion,
      buttonText: 'Рассчитать норму',
      mainColor: AppColors.primary,
      onDone: model.calculate,
      children: [
        const SizedBox(height: 30),
        InputCard(
          title: 'Съедаю в день:',
          value: model.macronutrition.calories?.toString() ?? "0",
          units: Strings.current.kkal,
          editable: true,
          onTextChange: model.onCaloriesChange,
        ),
        PickerCard(
          title: 'Соотношение БЖУ:',
          value: model.selectedMacroProportions,
          onPressed: model.onMacroProportionsTap,
        ),
        MacronutritionInputComponent(
          onChange: model.onMacronutritionChange,
          initProtein: model.macronutrition.proteinPercent,
          initFat: model.macronutrition.fatPercent,
          initCarbohydrates: model.macronutrition.carbohydratePercent,
        ),
        MealsCountCard(
          onTap: model.onMealsCountChange,
          selectedCount: model.macronutrition.mealsCount,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
