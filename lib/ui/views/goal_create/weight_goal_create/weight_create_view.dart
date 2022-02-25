import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary/widgets/want_ideal_card.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/data_picker_button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../goal_create.dart';
import 'weight_create_viewmodel.dart';

class WeightGoalCreateRoute extends MaterialPageRoute {
  WeightGoalCreateRoute([
    PredefinedGoalData predefined,
  ]) : super(
          builder: (context) => Provider<PredefinedGoalData>.value(
            value: predefined,
            child: WeightCreateView(),
          ),
        );
}

class WeightCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeightGoalCreateViewModel>.reactive(
      viewModelBuilder: () => WeightGoalCreateViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          waiting: model.isBusy,
          expandedAppBarHeight: 110,
          backgroundColor: AppColors.bg,
          title: Strings.current.control_weight,
          appBarAction: SvgPicture.asset(
            Assets.kg,
            height: 24,
            width: 24,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: [15.0, 30.0].byHeight),
                  DataPickerButton(
                    type: 'кг',
                    text: '${Strings.current.weight_now}:',
                    value: model.now,
                    onPressed: model.onNowTap,
                  ),
                  const SizedBox(height: 10),
                  DataPickerButton(
                    type: 'кг',
                    text: '${Strings.current.goal_weight}:',
                    color: AppColors.pink,
                    value: model.goal,
                    onPressed: model.onGoalTap,
                  ),
                  SizedBox(height: [30.0, 35.0].byHeight),
                  WantIdealCard(
                    title: Strings.current.want_to_know_your_ideal_weight,
                    text: Strings.current.calculate_ideal_weight,
                    buttonText: Strings.current.calculate_weight,
                    onPressed: model.calculate,
                  ),
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
                  color: AppColors.pink,
                  colorDark: AppColors.pinkDark,
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
