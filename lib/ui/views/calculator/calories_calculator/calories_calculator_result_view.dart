import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../widgets/calculator_result_scaffold.dart';
import '../widgets/calories_goal_card.dart';
import 'calories_calculator_viewmodel.dart';

class CalculateCaloriesResultRoute extends MaterialPageRoute {
  CalculateCaloriesResultRoute(CaloriesCalculatorViewModel model)
      : super(
          builder: (context) => ChangeNotifierProvider.value(
            value: model,
            child: _CaloriesCalculatorResultView(),
          ),
          settings: const RouteSettings(name: 'calculate_calories_result'),
        );
}

class _CaloriesCalculatorResultView extends ViewModelWidget<CaloriesCalculatorViewModel> {
  final Color mainColor = AppColors.green;

  @override
  Widget build(BuildContext context, CaloriesCalculatorViewModel model) {
    return CalculatorResultScaffold(
      mainColor: mainColor,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                Strings.current.norma_calories,
                textAlign: TextAlign.start,
                style: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.black),
              ),
            ),
            AppCarouselView(
              pageHeight: model.canAddGoal ? 300 : 220,
              onPageChanged: model.onResultPageChanged,
              children: List.generate(
                model.goals?.length ?? 0,
                (index) => CaloriesGoalCardView(
                  data: model.goals[index],
                  weightGoal: model.goal,
                  variantIndex: index + 1,
                  addToGoal: model.canAddGoal ? model.addToGoal : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
