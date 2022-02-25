import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../widgets/calculator_result_scaffold.dart';
import 'weight_calculator_viewmodel.dart';

class CalculateWeightResultRoute extends MaterialPageRoute {
  CalculateWeightResultRoute(WeightCalculatorViewModel model)
      : super(
          builder: (context) => ChangeNotifierProvider.value(
            value: model,
            child: _WeightCalculatorResultView(),
          ),
          settings: const RouteSettings(name: 'calculate_weight_result'),
        );
}

class _WeightCalculatorResultView extends ViewModelWidget<WeightCalculatorViewModel> {
  final Color mainColor = AppColors.pink;

  @override
  Widget build(BuildContext context, WeightCalculatorViewModel model) {
    return CalculatorResultScaffold(
      mainColor: mainColor,
      addGoal: model.canAddGoal ? model.addToGoal : null,
      body: Center(
        heightFactor: 2.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Strings.current.your_ideal_weight,
              textAlign: TextAlign.center,
              style: [
                AppStylesSmall.headline1Bold,
                AppStylesBig.headline1Bold,
              ].byHeight.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 25),
            Text(
              "${Utils.numberToString(model.idealWeight)} кг",
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.w800,
                fontSize: 72.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
