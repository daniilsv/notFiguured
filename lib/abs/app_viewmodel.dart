import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/services/auth_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

abstract class AppBaseViewModel extends BaseViewModel {
  NavigatorState navigator;
}

abstract class AppViewModel extends AppBaseViewModel {
  AppViewModel(BuildContext context) {
    if (context != null) {
      authService = context.read<AuthService>();
      api = context.read<Api>();
      navigator = Navigator.of(context);
    }
  }
  Api api;
  AuthService authService;

  Future<void> makeRequest(
      {Function setUp, Function makeRequest, Function finalFunc}) async {
    setBusy(true);
    setUp?.call();
    try {
      await makeRequest();
    } on BadRequestException catch (e) {
      errorHandle(e.response.statusCode);
      // TODO add logging
    } finally {
      setBusy(false);
      finalFunc?.call();
    }
  }

  void errorHandle([int errorStatus]) {
    if (errorStatus == null) throw const AppException(ExceptionsType.badRequest);
    if (errorStatus < 400) throw const AppException(ExceptionsType.badErrorStatus);
    switch (errorStatus) {
      case 401:
        errorRequest?.call(errorStatus);
        break;
      case 403:
        errorRequest?.call(errorStatus);
        showErrorMessage(Strings.current.auth_error);
        break;
      case 404:
        errorRequest?.call(errorStatus);
        showErrorMessage(Strings.current.auth_error);
        break;
      case 422:
        errorRequest?.call(errorStatus);
        showErrorMessage(Strings.current.auth_error);
        break;
      default:
        errorRequest?.call(errorStatus);
        showErrorMessage(Strings.current.auth_error);
        break;
    }
  }

  void errorRequest([int errorStatus]);

  void showErrorMessage(String message) {
    showDialog(
      context: navigator.context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text(Strings.current.error),
          content: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(message),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: navigator.pop,
              child: Text(Strings.current.close),
            ),
          ],
        );
      },
    );
  }
}
