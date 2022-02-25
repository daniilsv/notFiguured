import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/checkbox_card.dart';
import 'package:notfiguured/ui/widgets/input_card.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../goal_create.dart';
import 'calories_goal_create_viewmodel.dart';

class CaloriesGoalCreateRoute extends MaterialPageRoute {
  CaloriesGoalCreateRoute([PredefinedGoalData predefined])
      : super(
          builder: (context) => Provider<PredefinedGoalData>.value(
            value: predefined,
            child: CaloriesGoalCreateView(),
          ),
        );
}

class CaloriesGoalCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CaloriesGoalCreateViewModel>.reactive(
      viewModelBuilder: () => CaloriesGoalCreateViewModel(context),
      builder: (BuildContext context, CaloriesGoalCreateViewModel model, _) {
        return AppScaffold(
          waiting: model.isBusy,
          expandedAppBarHeight: 110,
          backgroundColor: AppColors.bg,
          title: Strings.current.control_calories,
          appBarAction: SvgPicture.asset(
            Assets.calories,
            height: 24,
            width: 24,
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              AnimatedCrossFade(
                crossFadeState:
                    model.isZigzag ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
                firstChild: InputCard(
                  title: 'Хочу в день:',
                  units: Strings.current.kkal,
                  value: model.goal,
                  onTextChange: model.setGoal,
                  editable: true,
                  error: model.goalError,
                ),
                secondChild: const SizedBox(
                  width: double.infinity,
                ),
              ),
              CheckboxCard(
                title: 'Программа зигзаг',
                value: model.isZigzag,
                onPressed: model.toggleZigzag,
              ),
              if (model.isZigzag) ...[
                AnimatedCrossFade(
                  crossFadeState: model.isZigzag
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                  secondChild: Column(
                    children: [
                      const SizedBox(height: 50),
                      for (WeekDays day in WeekDays.values)
                        InputCard(
                          title: day.value,
                          units: Strings.current.kkal,
                          value: model.zigzagMap[day] ?? '',
                          onTextChange: (string) => model.setZigzagText(day, string),
                          editable: true,
                        ),
                    ],
                  ),
                  firstChild: const SizedBox(
                    width: double.infinity,
                  ),
                ),
              ],
            ],
          ),
          footer: SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 24),
                AppButton(
                  onPressed: model.create,
                  text: 'Сохранить цель',
                  color: AppColors.green,
                  colorDark: AppColors.green,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
