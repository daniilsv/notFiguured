import 'dart:async';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/restore_password/enter_password/enter_password_view.dart';
import 'package:notfiguured/ui/views/restore_password/report_problem/report_problem_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'enter_code_view.dart';

class EnterCodeViewModel extends AppViewModel {
  EnterCodeViewModel([BuildContext context]) : super(context) {
    final dep = context.read<EnterCodeRouteDependency>();
    email = dep.email;
    time = dep.time;
    unfocus = () => FocusScope.of(context).unfocus();
  }

  String email;
  DateTime time;
  bool resent = false;

  TextEditingController textEditingController = TextEditingController();

  final maxCountdown = 30;
  int _countdown;
  StreamSubscription _countdownSub;
  StreamController<int> onCountdownUpd;
  Function unfocus;

  void onReady() {
    startCountdown();
  }

  void startCountdown() {
    onCountdownUpd = StreamController<int>();
    onCountdownUpd.add(maxCountdown);
    _countdown = maxCountdown;
    _countdownSub?.cancel();
    _countdownSub = Stream.periodic(1.seconds).listen((e) {
      onCountdownUpd.add(--_countdown);
      if (_countdown <= 0) {
        _countdownSub.cancel();
        onCountdownUpd.close();
      }
    });
  }

  @override
  void dispose() {
    onCountdownUpd?.close();
    _countdownSub?.cancel();
    super.dispose();
  }

  void onPinChange(String newPin) {
    clearErrors();
    notifyListeners();
  }

  Future<void> resendCode() async {
    unfocus();
    setBusy(true);
    await api.api
        .v1AccountForgotPasswordSimplePost(body: PasswordResetModel(email: email));
    time = DateTime.now();
    resent = true;
    onCountdownUpd?.close();
    _countdownSub?.cancel();
    setBusy(false);
    notifyListeners();
  }

  Future<void> onPinComplete(String newPin) async {
    setBusy(true);
    try {
      final res = await api.api.v1AccountCheckResetPasswordSimpleCodePost(
        body: CheckResetPasswordSimpleModel(
          email: email,
          token: newPin,
        ),
      );
      if (!res.body) throw 0;
      navigator.push(EnterPasswordRoute(
        EnterPasswordRouteDependency()
          ..email = email
          ..token = newPin
          ..time = time,
      ));
    } on dynamic {
      setError(Strings.current.restore_password_wrong_code);
    }
    setBusy(false);
  }

  void didntGetCode() {
    navigator.push(ReportProblemRoute());
  }

  @override
  void errorRequest([int errorStatus]) {}
}
