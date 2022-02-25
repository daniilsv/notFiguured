import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculator_view_model.dart';
import 'widgets/calculator_card.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorViewModel>.nonReactive(
      builder: (context, model, child) {
        return AppScaffold(
          title: 'Калькуляторы',
          body: Column(
            children: [
              const SizedBox(height: 40),
              CalculatorCard(
                title: 'Узнать свой\nидеальный вес',
                assetIcon: Assets.kg,
                color: AppColors.pink,
                onPressed: model.onWeightTap,
              ),
              const SizedBox(height: 10),
              CalculatorCard(
                title: 'Оптимальное\nколичество калорий',
                assetIcon: Assets.calories,
                color: AppColors.green,
                onPressed: model.onCaloriesTap,
              ),
              const SizedBox(height: 10),
              CalculatorCard(
                title: 'Оптимальное\nколичество БЖУ',
                assetIcon: Assets.macronutrion,
                color: AppColors.primary,
                onPressed: model.onMacronutritionTap,
              ),
              const SizedBox(height: 10),
              CalculatorCard(
                title: 'Сколько нужно\nпить воды в сутки',
                assetIcon: Assets.water,
                color: AppColors.lightBlue,
                onPressed: model.onWaterTap,
              ),
              const SizedBox(height: 10),
              CalculatorCard(
                title: 'Узнать свою\nнорму витаминов',
                assetIcon: Assets.vitamins,
                color: AppColors.violet,
                onPressed: model.onMicronutritionTap,
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
      viewModelBuilder: () => CalculatorViewModel(context),
    );
  }
}
