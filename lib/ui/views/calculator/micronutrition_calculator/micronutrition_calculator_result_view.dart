import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/calculator/widgets/micronutrition_card.dart';
import 'package:notfiguured/ui/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../widgets/calculator_result_scaffold.dart';
import 'micronutrition_calculator_viewmodel.dart';

class CalculateVitaminsResultRoute extends MaterialPageRoute {
  CalculateVitaminsResultRoute(MicronutritionCalculatorViewModel model)
      : super(
          builder: (context) => ChangeNotifierProvider.value(
            value: model,
            child: _VitaminsCalculatorResultView(),
          ),
          settings: const RouteSettings(name: 'calculate_vitamins_result'),
        );
}

class _VitaminsCalculatorResultView
    extends ViewModelWidget<MicronutritionCalculatorViewModel> {
  final Color mainColor = AppColors.violet;

  @override
  Widget build(BuildContext context, MicronutritionCalculatorViewModel model) {
    return CalculatorResultScaffold(
      mainColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: [
                AppPaddings.h25,
                AppPaddings.h30,
              ].byHeight,
              child: Text(
                'Норма употребления витаминов',
                style: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.black),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: [
                  AppPaddings.h25,
                  AppPaddings.h30,
                ].byHeight,
                itemBuilder: (context, index) {
                  final category = model.resultCategories[index];
                  return AppBadge(
                    text: category,
                    onTap: () => model.selectResultCategory(category),
                    color: mainColor,
                    selected: model.selectedResultCategory == category,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: model.resultCategories.length,
              ),
            ),
            const SizedBox(height: 35),
            ...List.generate(
              model.result[model.selectedResultCategory].categoryData.length,
              (index) => MicronutritionCard(
                category: model.selectedResultCategory,
                microCategoryModel:
                    model.result[model.selectedResultCategory].categoryData[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
