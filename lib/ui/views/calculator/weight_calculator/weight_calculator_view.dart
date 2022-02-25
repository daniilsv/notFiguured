import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/calculator/widgets/calculator_scaffold.dart';
import 'package:notfiguured/ui/widgets/input_card.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:chopper_api/extensions/sex.dart';

import 'weight_calculator_viewmodel.dart';

class CalculateWeightRoute extends MaterialPageRoute {
  CalculateWeightRoute([bool isPicker])
      : super(
          builder: (context) => ChangeNotifierProvider(
            create: (ctx) => WeightCalculatorViewModel(ctx, isPicker),
            child: _WeightCalculatorView(),
          ),
          settings: const RouteSettings(name: 'calculate_weight'),
        );
}

class _WeightCalculatorView extends ViewModelWidget<WeightCalculatorViewModel> {
  @override
  Widget build(BuildContext context, WeightCalculatorViewModel model) {
    return CalculatorScaffold(
      title: 'Калькулятор\nидеального веса',
      assetIcon: Assets.kg,
      isBusy: model.isBusy,
      buttonText: 'Рассчитать вес',
      mainColor: AppColors.pink,
      darkolor: AppColors.pinkDark,
      onDone: model.calculate,
      children: [
        const SizedBox(height: 30),
        PickerCard(
          title: 'Ваш пол:',
          value: model.sex.localize,
          onPressed: model.onSexTap,
          error: model.errSex,
        ),
        InputCard(
          title: 'Вес сейчас:',
          value: model.weight?.toString() ?? '0',
          units: Strings.current.kg,
          onPressed: model.onWeightTap,
          error: model.errWeight,
        ),
        InputCard(
          title: 'Рост:',
          value: model.height?.toString() ?? '0',
          units: Strings.current.sm,
          onPressed: model.onHeightTap,
          error: model.errHeight,
        ),
        const SizedBox(height: 30),
        Text(
          'Необязательно',
          style: [
            AppStylesSmall.headline2Bold,
            AppStylesBig.headline2Bold,
          ].byHeight.copyWith(color: AppColors.greyB8),
        ),
        const SizedBox(height: 15),
        InputCard(
          title: 'Обхват груди:',
          value: model.chest?.toString() ?? '0',
          units: Strings.current.sm,
          onPressed: model.onChestTap,
        ),
        InputCard(
          title: 'Обхват запястья:',
          value: model.wrist?.toString() ?? '0',
          units: Strings.current.sm,
          onPressed: model.onWristTap,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
