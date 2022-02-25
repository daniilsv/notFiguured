import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/data/model/enum/message_status.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/components/social_auth/social_auth_component.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/labeled_divider.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'sign_up_viewmodel.dart';

class SignUpRoute extends MaterialPageRoute {
  SignUpRoute()
      : super(
          builder: (context) => SignUpView(),
          settings: const RouteSettings(name: 'signUp'),
        );
}

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(context),
      builder: (context, model, child) {
        return AppScaffold(
          title: Strings.current.registration,
          automaticallyImplyLeading: false,
          appBarAction: CupertinoButton(
            padding: const EdgeInsets.only(bottom: 6),
            minSize: 0,
            onPressed: model.toRoot,
            child: Text(
              Strings.current.skip,
              style: [AppStylesSmall.body3Regular, AppStylesBig.body3Regular]
                  .byHeight
                  .copyWith(color: AppColors.primary),
            ),
          ),
          waiting: model.isBusy,
          contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Form(
                key: model.accountFormKey,
                onChanged: model.accountFormChanged,
                child: Column(
                  children: [
                    AppTextFormField(
                      title: Strings.current.your_email,
                      controller: model.emailController,
                      focusNode: model.emailFocusNode,
                      hintText: Strings.current.your_email_hint,
                      validator: (value) {
                        final res = model.emailValidator(value);
                        if (res != null) {
                          model.emailError = true;
                        } else {
                          model.emailError = false;
                        }
                        return res;
                      },
                      showErrorText: false,
                      autovalidate: model.autovalidating,
                      onEditingComplete: model.passwordFocusNode.requestFocus,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                    ),
                    AppTextFormField(
                      title: Strings.current.password,
                      controller: model.passwordController,
                      focusNode: model.passwordFocusNode,
                      validator: (value) {
                        final res = model.passwordValidator(value);
                        if (res != null) {
                          model.passwordError = true;
                        } else {
                          model.passwordError = false;
                        }
                        return res;
                      },
                      onEditingComplete: model.next,
                      textInputAction: TextInputAction.done,
                      showErrorText: false,
                      suffixAction: model.togglePasswordVisible,
                      autovalidate: model.autovalidating,
                      obscureText: !model.passwordVisible,
                      suffixIcon: model.passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          if (model.curAccountFormMessage.key.icon != null)
                            Icon(
                              model.curAccountFormMessage.key.icon,
                              color: model.curAccountFormMessage.key.color,
                              size: 12,
                            ),
                          const SizedBox(width: 12),
                          Text(
                            model.curAccountFormMessage.value,
                            style: [
                              AppStylesSmall.body3Regular,
                              AppStylesBig.body3Regular
                            ].byHeight.copyWith(
                                color: model.curAccountFormMessage.key.color),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          footer: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  onPressed: model.next,
                  text: Strings.current.next_step,
                ),
                if (MediaQuery.of(context).viewInsets.bottom == 0) ...[
                  const SizedBox(height: 20),
                  LabeledDivider(Strings.current.or_sign_up_from),
                  const SizedBox(height: 20),
                  SocialAuthComponent(
                    dependency: SocialAuthDependency(
                      onDone: model.onOAuthSignIn,
                      setViewModelBusy: model.setBusy,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 18),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
