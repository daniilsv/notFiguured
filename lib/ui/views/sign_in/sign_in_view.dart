import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/components/social_auth/social_auth_component.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/sign_in/sign_in_viewmodel.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/labeled_divider.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_field_validator/flutter_form_field_validator.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';

class SignInRoute extends MaterialPageRoute {
  SignInRoute()
      : super(
          builder: (context) => SignInView(),
          settings: const RouteSettings(name: 'signIn'),
        );
}

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: Strings.current.sign_in,
          waiting: model.isBusy,
          automaticallyImplyLeading: false,
          appBarAction: CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: model.skip,
            child: Text(
              Strings.current.skip,
              style: [
                AppStylesSmall.body3Regular,
                AppStylesBig.body3Regular,
              ].byHeight.copyWith(color: AppColors.primary),
            ),
          ),
          contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 43),
              AppTextFormField(
                title: Strings.current.your_email,
                key: model.emailKey,
                hintText: 'youremail@mail.com',
                scrollPadding: const EdgeInsets.only(top: 20, bottom: 235),
                padding: const EdgeInsets.only(bottom: 38),
                controller: model.emailController,
                onEditingComplete: () {
                  model.passwordFocusNode.requestFocus();
                },
                textInputAction: TextInputAction.next,
                focusNode: model.emailFocusNode,
                validator: (value) => (model.emailController?.text?.isEmpty ?? true)
                    ? null
                    : FieldValidator(value)
                        .email(Strings.current.wrong_data_format)
                        .validate(),
                keyboardType: TextInputType.emailAddress,
                showErrorText: false,
                inputFormatters: [FilteringTextInputFormatter.deny(" ")],
              ),
              Stack(
                children: [
                  AppTextFormField(
                    title: Strings.current.password,
                    scrollPadding: const EdgeInsets.only(bottom: 150),
                    padding: EdgeInsets.zero,
                    controller: model.passwordController,
                    suffixAction: model.onPasswordSuffixTap,
                    obscureText: !model.passwordVisible,
                    focusNode: model.passwordFocusNode,
                    suffixEnabled: !model.showEyeSuffix,
                    suffixIcon: model.getPasswordSuffix(),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 0,
                    child: AnimatedOpacity(
                      duration: 200.milliseconds,
                      opacity: model.showForgotPassword ? 1 : 0,
                      child: IgnorePointer(
                        ignoring: !model.showForgotPassword,
                        child: CupertinoButton(
                          onPressed: model.restorePassword,
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          child: Text(
                            Strings.current.forgot_password,
                            style: AppStylesSmall.inputs1Regular
                                .copyWith(color: AppColors.primary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (model.signInError) ...[
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
                      Strings.current.email_or_password_not_valid,
                      style: [AppStylesSmall.body3Regular, AppStylesBig.body3Regular]
                          .byHeight
                          .copyWith(color: AppColors.error),
                    )
                  ],
                ),
                SizedBox(height: [15.0, 60.0].byHeight),
              ] else
                SizedBox(height: [15.0, 95.0].byHeight),
              AppButton(
                  onPressed: model.allowSignIn ? model.signIn : null,
                  text: Strings.current.login),
              const SizedBox(height: 35),
              LabeledDivider(
                Strings.current.or_login_with,
              ),
              const SizedBox(height: 30),
              SocialAuthComponent(
                dependency: SocialAuthDependency(
                  onDone: model.onOAuthSignIn,
                  setViewModelBusy: model.setBusy,
                ),
              ),
              const SizedBox(height: 54),
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  onPressed: model.toSignUp,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: Strings.current.dont_have_account,
                            style: [
                              AppStylesSmall.body3Regular,
                              AppStylesBig.body3Regular
                            ].byHeight),
                        TextSpan(
                          text: ' ${Strings.current.join}',
                          style: [AppStylesSmall.body3Regular, AppStylesBig.body3Regular]
                              .byHeight
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
