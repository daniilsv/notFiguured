import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/animated_linear_progress_indicator.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pages/activity_level.dart';
import 'pages/parameters.dart';
import 'pages/personal_info.dart';
import 'personalization_viewmodel.dart';

class PersonalizationRoute extends MaterialPageRoute {
  PersonalizationRoute()
      : super(
          builder: (context) => PersonalizationView(),
          settings: const RouteSettings(name: 'personalization'),
        );
}

class PersonalizationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalizationViewModel>.reactive(
      onModelReady: (model) => model.onReady(),
      viewModelBuilder: () => PersonalizationViewModel(context),
      builder: (context, model, child) {
        return AppScaffold(
          waiting: model.isBusy,
          onWillPop: model.previousStep,
          onBackButton: model.previousStep,
          contentPadding: EdgeInsets.zero,
          expandedAppBarHeight: 70,
          title: '',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedLinearProgressIndicator(value: model.stepValue),
              IndexedStack(
                index: model.step,
                children: const [
                  PersonalInfo(),
                  ParamatersInfo(),
                  ActivityLevelInfo(),
                ],
              ),
            ],
          ),
          footer: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: [
                  AppPaddings.h25,
                  AppPaddings.h30,
                ].byHeight,
                child: AppButton(
                  onPressed: model.isNextButtonActive() ? model.nextStep : null,
                  text: model.step == model.steps - 1
                      ? Strings.current.save
                      : Strings.current.personalization_next,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
