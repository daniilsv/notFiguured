import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/calculator/widgets/calculator_scaffold.dart';
import 'package:notfiguured/ui/widgets/checkbox_card.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/activity.dart';
import 'package:chopper_api/extensions/country.dart';
import 'package:chopper_api/extensions/sex.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'micronutrition_calculator_viewmodel.dart';

class CalculateMicronutritionRoute extends MaterialPageRoute {
  CalculateMicronutritionRoute([bool isPicker])
      : super(
          builder: (context) => ChangeNotifierProvider(
            create: (ctx) => MicronutritionCalculatorViewModel(ctx, isPicker),
            child: _MicronutritionCalculatorView(),
          ),
          settings: const RouteSettings(name: 'calculate_vitamins'),
        );
}

class _MicronutritionCalculatorView
    extends ViewModelWidget<MicronutritionCalculatorViewModel> {
  @override
  Widget build(BuildContext context, MicronutritionCalculatorViewModel model) {
    return CalculatorScaffold(
      title: 'Калькулятор\nвитаминов',
      assetIcon: Assets.vitamins,
      isBusy: model.isBusy,
      buttonText: Strings.current.calculate_rate,
      mainColor: AppColors.violet,
      darkolor: AppColors.violetDark,
      onDone: model.calculate,
      children: [
        const SizedBox(height: 30),
        PickerCard(
          title: '${Strings.current.your_sex}:',
          value: model.sex.localize,
          onPressed: model.selectSex,
          error: model.errSex,
        ),
        PickerCard(
          title: '${Strings.current.dateOfBirs}:',
          value: model.dateOfBirth != null
              ? Jiffy(model.dateOfBirth).format("dd.MM.yyyy")
              : Strings.current.not_indicated,
          onPressed: model.selectDateOfBirth,
          error: model.errDateOfBirth,
        ),
        PickerCard(
          title: '${Strings.current.activity}:',
          value: model.activity?.title ?? Strings.current.not_indicated,
          onPressed: model.selectActivity,
          error: model.errActivity,
        ),
        PickerCard(
          title: 'Страна:',
          value: model.country.localize ?? Strings.current.not_indicated,
          onPressed: model.selectCountry,
          error: model.errCountry,
        ),
        const SizedBox(height: 30),
        Text(
          'Дополнительные условия',
          style: [
            AppStylesSmall.headline2Bold,
            AppStylesBig.headline2Bold,
          ].byHeight.copyWith(color: AppColors.greyB8),
        ),
        const SizedBox(height: 15),
        CheckboxCard(
          title: 'Условия крайнего севера',
          value: model.isDeepNotrh,
          onPressed: model.onDeepNorth,
          color: AppColors.violet,
        ),
        if (model.sex == Sex.female) ...[
          if (model.womanState == null || model.womanState == WomanState.pregnant)
            CheckboxCard(
              title: 'Беременность',
              value: model.isPregnant,
              onPressed: model.onPregnant,
              color: AppColors.violet,
            ),
          if (model.womanState == null || model.womanState == WomanState.lactationfirst)
            CheckboxCard(
              title: 'Грудное вскармливание 1 - 6 месяцев',
              value: model.isLactFirst,
              onPressed: model.onLactFirst,
              color: AppColors.violet,
            ),
          if (model.womanState == null || model.womanState == WomanState.lactationsecond)
            CheckboxCard(
              title: 'Грудное вскармливание 7 - 12 месяцев',
              value: model.isLactSecond,
              onPressed: model.onLactSecond,
              color: AppColors.violet,
            ),
        ],
        const SizedBox(height: 30),
      ],
    );
  }
}
