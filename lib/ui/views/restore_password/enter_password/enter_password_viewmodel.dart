import 'dart:async';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/restore_password/enter_email/enter_email_view.dart';
import 'package:notfiguured/ui/views/root/root_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_field_validator/flutter_form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'enter_password_view.dart';

class EnterPasswordViewModel extends AppViewModel {
  EnterPasswordViewModel([BuildContext context]) : super(context) {
    final dep = context.read<EnterPasswordRouteDependency>();
    email = dep.email;
    token = dep.token;
    time = dep.time;
  }
  String email;
  String token;
  DateTime time;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController = TextEditingController();
  final FocusNode passwordRepeatFocusNode = FocusNode();
  String passwordValidator(String value) => FieldValidator(value)
      .required(Strings.current.password_required)
      .minLength(6, Strings.current.require_8_not_less_symbols)
      .validate();
  bool passwordVisible = false, passwordRepeatVisible = false;
  bool allowSave = false;

  bool isBlocked = false;
  String _pass, _passAgain;

  void onReady() {
    passwordController.addListener(() {
      if (_pass == passwordController.text) return;
      _pass = passwordController.text;
      if (passwordRepeatController.text.isNotEmpty &&
          passwordController.text != passwordRepeatController.text) {
        setError(Strings.current.not_same_passwords);
        allowSave = false;
      } else {
        clearErrors();
        allowSave = passwordRepeatController.text.isNotEmpty;
      }
      notifyListeners();
    });
    passwordRepeatController.addListener(() {
      if (_passAgain == passwordRepeatController.text) return;
      _passAgain = passwordRepeatController.text;
      if (passwordRepeatController.text.isNotEmpty &&
          passwordController.text != passwordRepeatController.text) {
        setError(Strings.current.not_same_passwords);
        allowSave = false;
      } else {
        clearErrors();
        allowSave = passwordController.text.isNotEmpty;
      }
      notifyListeners();
    });
  }

  void togglePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void togglePasswordRepeatVisible() {
    passwordRepeatVisible = !passwordRepeatVisible;
    notifyListeners();
  }

  Future<void> save() async {
    if (isBlocked) {
      navigator.popUntil((route) => route is EnterEmailRoute);
      return;
    }
    if (DateTime.now().difference(time) > 15.minutes) {
      setError(Strings.current.restore_password_token_expired);
      isBlocked = true;
      notifyListeners();
      return;
    }
    setBusy(true);
    try {
      final resReset = await api.api.v1AccountResetPasswordSimplePost(
          body: ResetPasswordSimpleConfirmModel(
        email: email,
        token: token,
        confirmPassword: passwordRepeatController.text,
        newPassword: passwordController.text,
      ));
      if (!resReset.isSuccessful) requestErrorHandel(resReset.statusCode);
      final login = await api.api.v1AccountLoginPost(
          body: LoginModel(
        email: email,
        password: passwordController.text,
      ));
      if (!login.isSuccessful) requestErrorHandel(resReset.statusCode);

      navigator.pushAndRemoveUntil(RootViewRoute(), (route) => false);
    } on Object {
      showErrorMessage(Strings.current.unknown_error);
    }
    setBusy(false);
  }

  void requestErrorHandel(int statusCode) {
    switch (statusCode) {
      case 422:
        showErrorMessage(Strings.current.not_enough_rights);
        break;
      case 403:
        showErrorMessage(Strings.current.auth_error);
        break;
      case 404:
        showErrorMessage(Strings.current.auth_error);
        break;
      default:
        showErrorMessage(Strings.current.auth_error);
        break;
    }
  }

  void nextPassword() {
    passwordRepeatFocusNode.requestFocus();
  }

  @override
  void errorRequest([int errorStatus]) {}
}
