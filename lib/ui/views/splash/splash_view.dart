import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';

import 'splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding: [AppPaddings.h25, AppPaddings.h30].byHeight,
              child: Column(
                mainAxisAlignment: model.isBusy
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedCrossFade(
                        firstChild: const SizedBox(height: 120),
                        secondChild: SizedBox(
                          height: [100.0, 110.0].byHeight,
                          child: model.isNested
                              ? null
                              : CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  minSize: 0,
                                  onPressed: model.toRoot,
                                  child: Text(
                                    Strings.current.skip,
                                    style: [
                                      AppStylesSmall.body3Regular,
                                      AppStylesBig.body3Regular
                                    ].byHeight.copyWith(color: AppColors.primary),
                                  ),
                                ),
                        ),
                        crossFadeState: model.crossFadeState,
                        duration: 150.milliseconds,
                      ),
                    ],
                  ),
                  Image.asset(AppImages.logo, height: 110.0),
                  AnimatedCrossFade(
                    firstChild: const SizedBox(height: 100),
                    secondChild: Column(
                      children: [
                        Text(
                          Strings.current.app_title,
                          style: [
                            AppStylesSmall.headline1Bold,
                            AppStylesBig.headline1Bold
                          ].byHeight,
                        ),
                        SizedBox(height: [30.0, 35.0].byHeight),
                        Text(
                          Strings.current.splash_hint,
                          style: [
                            AppStylesSmall.body1Regular,
                            AppStylesBig.body1Regular,
                          ].byHeight.copyWith(color: AppColors.grey87),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    crossFadeState: model.crossFadeState,
                    duration: 150.milliseconds,
                  ),
                  AnimatedCrossFade(
                    firstChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [CupertinoActivityIndicator()],
                    ),
                    secondChild: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppButton(
                          onPressed: model.toSignUp,
                          text: Strings.current.registration,
                        ),
                        SizedBox(height: [20.0, 35.0].byHeight),
                        Center(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: model.toSignIn,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: Strings.current.has_account_already,
                                    style: [
                                      AppStylesSmall.body3Regular,
                                      AppStylesBig.body3Regular
                                    ].byHeight,
                                  ),
                                  TextSpan(
                                    text: ' ${Strings.current.login}',
                                    style: [
                                      AppStylesSmall.body3Regular,
                                      AppStylesBig.body3Regular
                                    ].byHeight.copyWith(color: AppColors.primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: [20.0, 35.0].byHeight),
                      ],
                    ),
                    crossFadeState: model.crossFadeState,
                    duration: 150.milliseconds,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
