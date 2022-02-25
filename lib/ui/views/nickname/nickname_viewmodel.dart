import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/ui/views/politics/politics_view.dart';
import 'package:notfiguured/ui/views/root/root_view.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_field_validator/flutter_form_field_validator.dart';
import 'package:provider/provider.dart';

import 'nickname_view.dart';

class NicknameViewModel extends AppViewModel {
  // String email;
  // String password;
  // Response authResponse;

  NicknameViewModel([BuildContext context]) : super(context) {
    // final dep = context.read<NicknameRouteDependency>();
    // email = dep?.email;
    // password = dep?.password;
    // authResponse = dep?.authResponse;
    if (kDebugMode) {
      nicknameController.text = "Меганагибатор228";
    }
  }

  final GlobalKey<FormState> nicknameFormKey = GlobalKey<FormState>();
  final FocusNode nicknameFocusNode = FocusNode();
  final TextEditingController nicknameController = TextEditingController();

  // ignore: prefer_function_declarations_over_variables
  String Function(String value) nickValidator =
      (value) => value.isNotEmpty ? FieldValidator(value).validate() : null;

  bool get isNextButtonEnabled =>
      iAgree && (nicknameController?.text?.trim()?.isNotEmpty ?? false);
  bool iAgree = false;

  void onReady() {
    nicknameController.addListener(notifyListeners);
  }

  // ignore: avoid_positional_boolean_parameters
  void iAgreeChange([bool value]) {
    iAgree = !iAgree;
    notifyListeners();
  }

  void toRoot() => navigator.pushAndRemoveUntil(RootViewRoute(), (route) => false);

  Future toPolitics() async {
    final res = await navigator.push(PoliticsRoute(PoliticsRouteDependency()));
    if (res == null) return;
    iAgree = res;
    notifyListeners();
  }

  // Future registerByEmail() async {
  //   if (!nicknameFormKey.currentState.validate()) return;
  //   setBusy(true);
  //   Response res;
  //   try {
  //     res = await api.api.v1AccountRegisterPost(
  //         body: RegisterModel(
  //       userName: nicknameController.text,
  //       email: email,
  //       password: password,
  //     ));
  //     if (res.isSuccessful) {
  //       authService.saveAuthCred(res, isSignUp: true);
  //       toRoot();
  //     } else {
  //       if (res.statusCode == 422)
  //         showErrorMessage(ExceptionsType.emailAlreadyRegistered.message);
  //       else
  //         throw BadRequestException(res);
  //     }
  //   } on BadRequestException catch (ex) {
  //     errorHandle(ex?.response?.statusCode);
  //   } on dynamic {
  //     errorHandle();
  //   }
  //   setBusy(false);
  // }

  Future setNickname() async {
    setBusy(true);
    // authService.saveAuthCred(authResponse);
    // final UserAccountData user = (authResponse.body.userData as UserAccountData).copyWith(
    //   nickName: nicknameController.text,
    // );
    Response res;
    try {
      res = await api.api.v1AccountUpdateUserPost(
          body: UserAccountData(nickName: nicknameController.text));
    } on Exception catch (e) {
      logger.e(e);
    }
    if (res.isSuccessful) {
      authService.saveAuthCred(res, isSignUp: true);
      toRoot();
    } else {
      authService.logout();
    }
    setBusy(false);
  }

  Future done() async {
    await setNickname();
  }

  @override
  void errorRequest([int errorStatus]) {}
}
