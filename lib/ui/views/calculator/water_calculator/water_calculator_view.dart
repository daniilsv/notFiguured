import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/calculator/widgets/calculator_scaffold.dart';
import 'package:notfiguured/ui/widgets/input_card.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:chopper_api/extensions/activity.dart';
import 'package:chopper_api/extensions/sex.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'water_calculator_viewmodel.dart';

class CalculateWaterRoute extends MaterialPageRoute {
  CalculateWaterRoute()
      : super(
          builder: (context) => ChangeNotifierProvider(
            create: (ctx) => WaterCalculatorViewModel(ctx),
            child: _WaterCalculatorView(),
          ),
          settings: const RouteSettings(name: 'calculate_water'),
        );
}

class _WaterCalculatorView extends ViewModelWidget<WaterCalculatorViewModel> {
  @override
  Widget build(BuildContext context, WaterCalculatorViewModel model) {
    return CalculatorScaffold(
      title: Strings.current.calculator_water_consume,
      assetIcon: Assets.water,
      buttonText: Strings.current.calculate_rate,
      mainColor: AppColors.lightBlue,
      onDone: model.calculate,
      isBusy: model.isBusy,
      children: [
        const SizedBox(height: 30),
        PickerCard(
          title: '${Strings.current.your_sex}:',
          value: model.measureInput.sex.localize,
          onPressed: model.selectSex,
          error: model.errSex,
        ),
        PickerCard(
          title: '${Strings.current.dateOfBirs}:',
          value: model.measureInput.utcDate != null
              ? Jiffy(model.measureInput.utcDate).format("dd.MM.yyyy")
              : Strings.current.not_indicated,
          onPressed: model.selectDateOfBirth,
          error: model.errDateOfBirth,
        ),
        PickerCard(
          title: '${Strings.current.activity}:',
          value: model.measureInput.activity?.title ?? Strings.current.not_indicated,
          onPressed: model.selectActivity,
          error: model.errActivity,
        ),
        InputCard(
          title: '${Strings.current.weight_now}:',
          value: model.measureInput.weight?.toStringAsFixed(1) ?? '',
          units: Strings.current.kg,
          onPressed: model.selectWeight,
          error: model.errWeight,
        ),
        InputCard(
          title: '${Strings.current.eat_per_day}:',
          value: model.caloriesInput?.toString(),
          units: Strings.current.kkal,
          editable: true,
          onTextChange: model.selectCalories,
          error: model.errCalories,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
