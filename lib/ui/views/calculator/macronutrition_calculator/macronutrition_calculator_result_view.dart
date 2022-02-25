import 'package:notfiguured/data/model/enum/consume_mode.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/widgets/tab_bar.dart';
import 'package:notfiguured/ui/widgets/value_measure_text.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../widgets/calculator_result_scaffold.dart';
import '../widgets/macronutrion_view.dart';
import 'macronutrition_calculator_viewmodel.dart';

class CalculateMacronutritionResultRoute extends MaterialPageRoute {
  CalculateMacronutritionResultRoute(MacronutritionCalculatorViewModel model)
      : super(
          builder: (context) => ChangeNotifierProvider.value(
            value: model,
            child: _MacronutritionCalculatorResultView(),
          ),
          settings: const RouteSettings(name: 'calculate_macronutrition_result'),
        );
}

class _MacronutritionCalculatorResultView
    extends ViewModelWidget<MacronutritionCalculatorViewModel> {
  final Color mainColor = AppColors.primary;

  @override
  Widget build(BuildContext context, MacronutritionCalculatorViewModel model) {
    return CalculatorResultScaffold(
      mainColor: mainColor,
      addGoal: model.canAddGoal ? model.addToGoal : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          bottom: 200,
        ),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                Strings.current.your_norma_macronutrition,
                textAlign: TextAlign.start,
                style: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.black),
              ),
            ),
            AppTabBar(
              tabs: ConsumeMode.values.map((e) => e.name).toList(),
              currentIndex: model.currentResultConsumeModeTabIndex,
              onTabChange: model.onResultTabBarTap,
            ),
            const SizedBox(height: 10),
            MacronutrionView(model.resultGm),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(),
            ),
            Text(
              Strings.current.energy_value,
              style: [
                AppStylesSmall.body1SemiBold,
                AppStylesBig.body1SemiBold,
              ].byHeight.copyWith(color: AppColors.greyB8),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueMeasureText(
                  value: Utils.numToFixStr(model.resultKcal.protein),
                  label: Strings.current.kkal_protain,
                  withNewLine: true,
                  textAlign: TextAlign.start,
                ),
                ValueMeasureText(
                  value: Utils.numToFixStr(model.resultKcal.fat),
                  label: Strings.current.kkal_fat,
                  withNewLine: true,
                  textAlign: TextAlign.start,
                ),
                ValueMeasureText(
                  value: Utils.numToFixStr(model.resultKcal.carbohydrate),
                  label: Strings.current.kkal_carbohyd,
                  withNewLine: true,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
