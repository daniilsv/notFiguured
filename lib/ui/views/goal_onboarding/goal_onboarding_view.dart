import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'goal_onboarding_viewmodel.dart';

class GoalOnboardingRoute extends MaterialPageRoute {
  GoalOnboardingRoute()
      : super(
          builder: (context) => GoalOnboardingView(),
          settings: const RouteSettings(name: 'goal_onboarding'),
        );
}

class GoalOnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GoalOnboardingViewModel>.nonReactive(
      viewModelBuilder: () => GoalOnboardingViewModel(context),
      builder: (context, model, child) {
        return Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                AppImages.goalOnboarding,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.black.withOpacity(0.7),
            ),
            Padding(
              padding: [AppPaddings.h25, AppPaddings.h30].byHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.current.goal_onboarding_title,
                          style: [
                            AppStylesSmall.headline1Bold,
                            AppStylesBig.headline1Bold,
                          ].byHeight.copyWith(color: AppColors.white),
                        ),
                        TextSpan(
                          text: model.nickname,
                          style: [
                            AppStylesSmall.headline1Bold,
                            AppStylesBig.headline1Bold,
                          ].byHeight.copyWith(color: AppColors.accent),
                        ),
                        TextSpan(
                          text: Strings.current.goal_onboarding_say_about_you,
                          style: [
                            AppStylesSmall.body2Regular,
                            AppStylesBig.body2Regular,
                          ].byHeight.copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: [AppPaddings.v30h20, AppPaddings.all30].byHeight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      onPressed: model.toPersonalize,
                      text: Strings.current.goal_onboarding_fill_now,
                    ),
                    const SizedBox(height: 30),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: model.fillLater,
                      child: Text(
                        Strings.current.goal_onboarding_fill_later,
                        style: [AppStylesSmall.body3Regular, AppStylesBig.body3Regular]
                            .byHeight
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
