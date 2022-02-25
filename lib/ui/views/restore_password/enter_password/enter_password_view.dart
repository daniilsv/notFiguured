import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/loading.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';

import 'enter_password_viewmodel.dart';

class EnterPasswordRouteDependency {
  String email;
  String token;
  DateTime time;
}

class EnterPasswordRoute extends MaterialPageRoute {
  EnterPasswordRoute(EnterPasswordRouteDependency dependency)
      : super(
          builder: (context) => Provider.value(
            value: dependency,
            child: _EnterPasswordView(),
          ),
          settings: const RouteSettings(name: 'restoreEnterPassword'),
        );
}

class _EnterPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EnterPasswordViewModel>.reactive(
      viewModelBuilder: () => EnterPasswordViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AppScaffold(
                title: Strings.current.new_password,
                contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
                expandedAppBarHeight: 96,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedCrossFade(
                      duration: 150.milliseconds,
                      crossFadeState:
                          MediaQuery.of(context).viewInsets.bottom < 50
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                      firstChild: Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 53),
                        child: Text(Strings.current.new_password_hint,
                            style: [
                              AppStylesSmall.body1Regular,
                              AppStylesBig.body1Regular
                            ].byHeight.copyWith(color: AppColors.grey87)),
                      ),
                      secondChild: const SizedBox(height: 25),
                    ),
                    AppTextFormField(
                      title: Strings.current.password,
                      controller: model.passwordController,
                      validator: model.passwordValidator,
                      onEditingComplete: model.nextPassword,
                      textInputAction: TextInputAction.next,
                      showErrorText: false,
                      enabled: !model.isBlocked,
                      suffixAction: model.togglePasswordVisible,
                      obscureText: !model.passwordVisible,
                      suffixIcon:
                          model.passwordVisible ? AppIcons.eye_1 : AppIcons.eye,
                      progressCounter: 6,
                    ),
                    if ((model.passwordController.text?.length ?? 0) < 6)
                      Text(
                        Strings.current.require_8_not_less_symbols,
                        style: [
                          AppStylesSmall.body3Regular,
                          AppStylesBig.body3Regular
                        ].byHeight.copyWith(color: AppColors.greyB8),
                      ),
                    const SizedBox(height: 30),
                    AppTextFormField(
                      title: Strings.current.password_repeat,
                      controller: model.passwordRepeatController,
                      focusNode: model.passwordRepeatFocusNode,
                      validator: model.passwordValidator,
                      onEditingComplete: model.save,
                      textInputAction: TextInputAction.done,
                      showErrorText: false,
                      enabled: !model.isBlocked,
                      suffixAction: model.togglePasswordRepeatVisible,
                      obscureText: !model.passwordRepeatVisible,
                      suffixIcon: model.passwordRepeatVisible
                          ? AppIcons.eye_1
                          : AppIcons.eye,
                      progressCounter: 6,
                    ),
                    if (model.hasError) ...[
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
                    AppButton(
                      onPressed: model.allowSave ? model.save : null,
                      text: model.isBlocked
                          ? Strings.current.back
                          : Strings.current.save_and_signin,
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
