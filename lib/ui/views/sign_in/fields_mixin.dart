import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin SignInFieldMixin on AppViewModel {
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get showEyeSuffix => passwordController.text?.isNotEmpty ?? false;
  bool get allowSignIn =>
      (passwordController.text?.isNotEmpty ?? false) &&
      (emailController.text?.isNotEmpty ?? false) &&
      isEmailValid;
  bool get autoValidateEmail => !isEmailValid && emailFocusNode.hasFocus;
  bool get showSkip => !emailFocusNode.hasFocus && !passwordFocusNode.hasFocus;
  bool get showForgotPassword =>
      !passwordFocusNode.hasFocus && (passwordController.text?.isEmpty ?? true);
  bool get showEmailComplete =>
      isEmailValid &&
      (emailController?.text?.isNotEmpty ?? false) &&
      !emailFocusNode.hasFocus;
  bool get showEmailError =>
      !isEmailValid &&
      (emailController?.text?.isNotEmpty ?? false) &&
      !emailFocusNode.hasFocus;
  bool signInError = false;
  bool isEmailValid = true;
  bool passwordVisible = false;

  IconData getPasswordSuffix() {
    if (showEyeSuffix) {
      if (passwordVisible) {
        return Icons.visibility_off;
      } else {
        return Icons.visibility;
      }
    } else {
      return AppIcons.cancel;
    }
  }

  void unfocus() {
    if (emailFocusNode.hasFocus) {
      emailFocusNode.unfocus();
    }
    if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }
  }
}
