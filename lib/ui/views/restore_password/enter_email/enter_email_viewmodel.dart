import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/restore_password/enter_code/enter_code_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_field_validator/flutter_form_field_validator.dart';

class EnterEmailViewModel extends AppViewModel {
  EnterEmailViewModel([BuildContext context]) : super(context);

  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  TextEditingController emailController = TextEditingController();

  bool get allowSignIn => isEmailValid;

  bool autoValidateEmail = false;
  bool isEmailValid = false;
  String _email;

  void onChanged(String email) {
    if (_email == email) return;
    _email = email;
    clearErrors();
    isEmailValid = validateEmail(_email ?? '') == null;
    notifyListeners();
  }

  Future<void> send() async {
    autoValidateEmail = true;
    if (!isEmailValid) {
      notifyListeners();
      return;
    }
    clearErrors();
    setBusy(true);
    try {
      await api.api.v1AccountForgotPasswordSimplePost(
          body: PasswordResetModel(email: _email.toLowerCase()));
      navigator.push(EnterCodeRoute(
        EnterCodeRouteDependency()
          ..email = _email.toLowerCase()
          ..time = DateTime.now(),
      ));
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        setError(Strings.current.such_user_not_found);
      }
    }
    setBusy(false);
  }

  String validateEmail(String value) =>
      FieldValidator(value).email('E-mail введён неверно').validate();

  @override
  void errorRequest([int errorStatus]) {}
}
