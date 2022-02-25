import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/abs/navigator_mixin.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/nickname/nickname_view.dart';
import 'package:notfiguured/ui/views/root/root_view.dart';
import 'package:notfiguured/ui/views/sign_in/fields_mixin.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInViewModel extends AppViewModel with SignInFieldMixin, NavigatorMixin {
  SignInViewModel([BuildContext context]) : super(context) {
    if (kDebugMode) {
      emailController.text = "sajehe4253@jentrix.com";
      passwordController.text = "StrongPassword1";
    }
  }

  void togglePassword() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void onPasswordSuffixTap() {
    if (showEyeSuffix) {
      togglePassword();
    } else {
      passwordController.clear();
      passwordFocusNode.unfocus();
    }
  }

  // ignore: avoid_positional_boolean_parameters
  void setSignInError(bool error) {
    signInError = error;
    notifyListeners();
  }

  @override
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

  @override
  void unfocus() {
    if (emailFocusNode.hasFocus) {
      emailFocusNode.unfocus();
    }
    if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }
  }

  Future<void> onOAuthSignIn(Response<AuthorizationTokens> authResponse) async {
    if (authResponse == null) return;
    await authService.saveAuthCred(authResponse);
    if (authResponse.body?.userData?.nickName == null) {
      navigator.push(
        NicknameRoute(
          dependency: NicknameRouteDependency(
            authResponse: authResponse,
          ),
        ),
      );
    } else {
      toRoot();
    }
  }

  Future<void> signIn() async {
    unfocus();
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      showErrorMessage('Интернет недоступен.\nПроверьте подключение к сети.');
      return;
    }
    setBusy(true);

    try {
      final res = await api.api.v1AccountLoginPost(
          body: LoginModel(
        password: passwordController.text,
        email: emailController.text,
      ));
      if (res.isSuccessful) {
        await authService.saveAuthCred(res);
        navigator.pushAndRemoveUntil(RootViewRoute(), (route) => false);
        return;
      }
      if (res.statusCode == 401) {
        setSignInError(true);
      } else if (res.statusCode == 403) {
        showErrorMessage(Strings.current.not_enough_rights);
      } else if (res.statusCode == 404) {
        showErrorMessage(Strings.current.auth_error);
      } else if (res.statusCode == 422) {
        showErrorMessage(Strings.current.email_or_password_not_valid);
      } else {
        showErrorMessage(Strings.current.auth_error);
      }
    } on dynamic {
      showErrorMessage(Strings.current.unknown_error);
    }

    setBusy(false);
  }

  // void showErrorMessage(String message) {
  //   showDialog(
  //     context: navigator.context,
  //     builder: (_) {
  //       return CupertinoAlertDialog(
  //         title: Text(Strings.current.auth_error),
  //         content: Padding(
  //           padding: const EdgeInsets.only(top: 12),
  //           child: Text(message),
  //         ),
  //         actions: [
  //           CupertinoDialogAction(
  //             onPressed: navigator.pop,
  //             child: Text(Strings.current.close),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  void onReady() {
    emailController.addListener(() {
      isEmailValid = emailKey.currentState.validate();
      setSignInError(false);
      notifyListeners();
    });
    passwordFocusNode.addListener(() {
      setSignInError(false);
    });
    passwordController.addListener(notifyListeners);
  }

  @override
  void errorRequest([int errorStatus]) {
    if (errorStatus == 401) setSignInError(true);
  }
}
