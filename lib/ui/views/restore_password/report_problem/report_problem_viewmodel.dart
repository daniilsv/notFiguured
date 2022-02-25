import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/sign_in/sign_in_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_field_validator/flutter_form_field_validator.dart';
import 'package:supercharged/supercharged.dart';

class ReportProblemViewModel extends AppViewModel {
  ReportProblemViewModel([BuildContext context]) : super(context);

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
      await api.api.v1CommonReportProblemPost(
        body: ReportProblemModel(
          email: _email.toLowerCase(),
          message: 'Не пришло письмо для смены пароля',
        ),
      );
      navigator.pushAndRemoveUntil(
        SignInRoute(),
        (route) => false,
      );
      await Future.delayed(500.milliseconds);
      showDialog(
        context: navigator.context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(Strings.current.message_sended),
            content: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(Strings.current.we_are_already_working),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: navigator.pop,
                child: Text(Strings.current.close),
              )
            ],
          );
        },
      );
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
