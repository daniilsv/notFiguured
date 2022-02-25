import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/components/macronutrition_input/macronutrition_input_component.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary/widgets/want_ideal_card.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../goal_create.dart';
import 'macronutrition_create_viewmodel.dart';

class MacronutritionGoalCreateRoute extends MaterialPageRoute {
  MacronutritionGoalCreateRoute([PredefinedGoalData predefined])
      : super(
          builder: (context) => Provider<PredefinedGoalData>.value(
            value: predefined,
            child: MacronutritionGoalCreateView(),
          ),
        );
}

class MacronutritionGoalCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MacronutritionGoalCreateViewModel>.reactive(
      builder: (BuildContext context, MacronutritionGoalCreateViewModel model, _) {
        return AppScaffold(
          waiting: model.isBusy,
          expandedAppBarHeight: 110,
          backgroundColor: AppColors.bg,
          title: Strings.current.control_macronutrition,
          appBarAction: SvgPicture.asset(Assets.macronutrion, height: 24, width: 24),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: [15.0, 30.0].byHeight),
                  Text(
                    'Введите количество БЖУ, которое \nВы хотите употреблять за сутки.',
                    style: [AppStylesSmall.body1Regular, AppStylesBig.body1Regular]
                        .byWidth
                        .copyWith(color: AppColors.grey87),
                  ),
                  SizedBox(height: [15.0, 30.0].byHeight),
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'В сумме должно быть ',
                              style: [
                                AppStylesSmall.body1Regular,
                                AppStylesBig.body1Regular
                              ].byWidth.copyWith(color: AppColors.grey87)),
                          const TextSpan(
                            text: 'ровно 100%',
                          ),
                        ],
                        style: [AppStylesSmall.body1Regular, AppStylesBig.body1Regular]
                            .byWidth),
                  ),
                  SizedBox(height: [15.0, 30.0].byHeight),
                  MacronutritionInputComponent(
                    initProtein: model.goalB,
                    initFat: model.goalJ,
                    initCarbohydrates: model.goalU,
                    onChange: model.setGoals,
                  ),
                  SizedBox(height: [30.0, 35.0].byHeight),
                  WantIdealCard(
                    title: Strings.current.want_to_know_your_ideal_macronutrition,
                    text: Strings.current.calculate_ideal_macronutrition,
                    buttonText: Strings.current.calculate_rate,
                    onPressed: model.calculate,
                  ),
                  SizedBox(height: [30.0, 35.0].byHeight),
                ],
              ),
            ],
          ),
          footer: SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  onPressed: model.create,
                  text: 'Сохранить цель',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => MacronutritionGoalCreateViewModel(context),
    );
  }
}
