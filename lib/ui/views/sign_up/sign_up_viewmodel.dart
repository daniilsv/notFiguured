import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/abs/navigator_mixin.dart';
import 'package:notfiguured/data/model/enum/message_status.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/nickname/nickname_view.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_field_validator/flutter_form_field_validator.dart';

class SignUpViewModel extends AppViewModel with NavigatorMixin {
  SignUpViewModel([BuildContext context]) : super(context) {
    if (kDebugMode) {
      // emailController.text = "some@mail.com";
      // passwordController.text = "StrongPassword1";
    }
  }

  final PageController pageController = PageController();

  final GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;
  bool passwordError = true;
  bool emailError = true;
  MapEntry<MessageStatus, String> curAccountFormMessage = MapEntry<MessageStatus, String>(
      MessageStatus.neutral, Strings.current.require_8_not_less_symbols);

  String emailValidator(String value) => autovalidating || value.isNotEmpty
      ? FieldValidator(value)
          .required(Strings.current.email_required)
          .email(Strings.current.email_error)
          .validate()
      : null;

  String passwordValidator(String value) => autovalidating || value.isNotEmpty
      ? FieldValidator(value)
          .required(Strings.current.password_required)
          .minLength(8, Strings.current.require_8_not_less_symbols)
          .validate()
      : null;

  bool get allowSignUp => (!emailError) && (!passwordError);
  bool autovalidating = false;
  void togglePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  Future<void> next() async {
    autovalidating = true;
    accountFormChanged();
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      showErrorMessage('Интернет недоступен.\nПроверьте подключение к сети.');
      return;
    }
    passwordError = curAccountFormMessage?.key == MessageStatus.error;
    notifyListeners();
    if (allowSignUp) {
      Response res;
      try {
        //TODO: REGISTER
        res = await api.api.v1AccountRegisterPost(
            body: RegisterModel(
          userName: emailController.text,
          email: emailController.text,
          password: passwordController.text,
        ));
        if (res.isSuccessful) {
          authService.saveAuthCred(res, isSignUp: true);
          toNickname();
        } else {
          if (res.statusCode == 422)
            showErrorMessage(ExceptionsType.emailAlreadyRegistered.message);
          else
            throw BadRequestException(res);
        }
      } on BadRequestException catch (ex) {
        errorHandle(ex?.response?.statusCode);
      } on dynamic {
        errorHandle();
      }
    }
  }

  Future<void> toNickname() async {
    navigator.push(NicknameRoute());
  }

  void accountFormChanged() {
    final passwordValidatorText = passwordValidator(passwordController.text);
    if (passwordController.text.isEmpty) return;
    if (passwordValidatorText == null) {
      curAccountFormMessage = MapEntry<MessageStatus, String>(
        MessageStatus.success,
        Strings.current.good_password,
      );
      passwordError = false;
    } else
      curAccountFormMessage = MapEntry<MessageStatus, String>(
        autovalidating ? MessageStatus.error : MessageStatus.neutral,
        Strings.current.require_8_not_less_symbols,
      );
    notifyListeners();
  }

  Future<void> onOAuthSignIn(Response authResponse) async {
    if (authResponse != null) {
      if (authResponse.body.userData?.nickName == null) {
        authService.saveAuthCred(authResponse, isSignUp: true);
        navigator.push(
          NicknameRoute(
            dependency: NicknameRouteDependency(
              authResponse: authResponse,
            ),
          ),
        );
      } else {
        authService.saveAuthCred(authResponse);
        toRoot();
      }
    }
  }

  @override
  void errorRequest([int errorStatus]) {}
}
