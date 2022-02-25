import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/loading.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';
import 'enter_code_viewmodel.dart';

class EnterCodeRouteDependency {
  String email;
  DateTime time;
}

class EnterCodeRoute extends MaterialPageRoute {
  EnterCodeRoute(EnterCodeRouteDependency dependency)
      : super(
          builder: (context) => Provider.value(
            value: dependency,
            child: _EnterCodeView(),
          ),
          settings: const RouteSettings(name: 'restoreEnterCode'),
        );
}

class _EnterCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EnterCodeViewModel>.reactive(
      viewModelBuilder: () => EnterCodeViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AppScaffold(
                title: Strings.current.enter_code,
                contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
                expandedAppBarHeight: 96,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedCrossFade(
                      duration: 150.milliseconds,
                      crossFadeState: MediaQuery.of(context).viewInsets.bottom < 50
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 53),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              if (model.resent) ...[
                                TextSpan(
                                    text: Strings.current.restore_password_resent_start,
                                    style: [
                                      AppStylesSmall.body1Regular,
                                      AppStylesBig.body1Regular
                                    ].byHeight.copyWith(color: AppColors.grey87)),
                                TextSpan(
                                  text: model.email,
                                  style: [
                                    AppStylesSmall.body1Regular,
                                    AppStylesBig.body1Regular
                                  ].byHeight,
                                ),
                                TextSpan(
                                    text: Strings.current.restore_password_resent_end,
                                    style: [
                                      AppStylesSmall.body1Regular,
                                      AppStylesBig.body1Regular
                                    ].byHeight.copyWith(color: AppColors.grey87)),
                                TextSpan(
                                  text: Strings.current.spam.toUpperCase(),
                                  style: [
                                    AppStylesSmall.body1Regular,
                                    AppStylesBig.body1Regular
                                  ].byHeight,
                                ),
                                TextSpan(
                                    text: '.',
                                    style: [
                                      AppStylesSmall.body1Regular,
                                      AppStylesBig.body1Regular
                                    ].byHeight.copyWith(color: AppColors.grey87)),
                              ] else ...[
                                TextSpan(
                                    text:
                                        Strings.current.restore_password_code_sent_start,
                                    style: [
                                      AppStylesSmall.body1Regular,
                                      AppStylesBig.body1Regular
                                    ].byHeight.copyWith(color: AppColors.grey87)),
                                TextSpan(
                                  text: model.email,
                                  style: [
                                    AppStylesSmall.body1Regular,
                                    AppStylesBig.body1Regular
                                  ].byHeight,
                                ),
                                TextSpan(
                                    text: Strings.current.restore_password_code_sent_end,
                                    style: [
                                      AppStylesSmall.body1Regular,
                                      AppStylesBig.body1Regular
                                    ].byHeight.copyWith(color: AppColors.grey87)),
                              ]
                            ],
                          ),
                        ),
                      ),
                      secondChild: const SizedBox(height: 25),
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 5,
                      animationType: AnimationType.fade,
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 200),
                      textStyle: [
                        AppStylesSmall.inputs1Regular,
                        AppStylesBig.inputs1Regular
                      ].byHeight.copyWith(color: model.hasError ? AppColors.error : null),
                      pinTheme: PinTheme.defaults(
                        activeColor: model.hasError ? AppColors.error : AppColors.greyB8,
                        inactiveColor:
                            model.hasError ? AppColors.error : AppColors.greyB8,
                      ),
                      controller: model.textEditingController,
                      keyboardType: TextInputType.number,
                      enablePinAutofill: false,
                      enabled: !model.isBusy,
                      onCompleted: model.onPinComplete,
                      onChanged: model.onPinChange,
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                    if (model.hasError) ...[
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            AppIcons.error,
                            size: 12,
                            color: AppColors.error,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            model.modelError,
                            style: [
                              AppStylesSmall.body3Regular,
                              AppStylesBig.body3Regular
                            ].byHeight.copyWith(color: AppColors.error),
                          )
                        ],
                      ),
                    ],
                  ],
                ),
                footer: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (model.resent == true)
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        onPressed: model.didntGetCode,
                        child: Text(
                          Strings.current.restore_password_still_no_code,
                          style: [AppStylesSmall.body3Medium, AppStylesBig.body3Medium]
                              .byHeight
                              .copyWith(color: AppColors.primary),
                        ),
                      )
                    else
                      StreamBuilder<int>(
                        stream: model.onCountdownUpd.stream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              onPressed: model.resendCode,
                              child: Text(
                                Strings.current.send_again,
                                style: [
                                  AppStylesSmall.body3Medium,
                                  AppStylesBig.body3Medium
                                ].byHeight.copyWith(color: AppColors.primary),
                              ),
                            );
                          final time = snapshot.data ?? model.maxCountdown;
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: Strings.current.send_again,
                                    style: [
                                      AppStylesSmall.body3Regular,
                                      AppStylesBig.body3Regular
                                    ].byHeight.copyWith(color: AppColors.grey87)),
                                TextSpan(
                                    text: Strings.current.restore_password_resend_end(
                                        '00:${time >= 10 ? time : '0$time'}'),
                                    style: [
                                      AppStylesSmall.body3Regular,
                                      AppStylesBig.body3Regular
                                    ].byHeight),
                              ],
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            LoadingOverlay(isBusy: model.isBusy),
          ],
        );
      },
    );
  }
}
