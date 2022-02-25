import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/services/auth_service.dart';
import 'package:notfiguured/ui/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

enum Gender { male, female, other }

extension GenderExt on Gender {
  String nameRU() {
    if (this == Gender.male)
      return "Мужик";
    else if (this == Gender.female)
      return "Не Мужик";
    else
      return "я запутался...";
  }
}

class TestUIViewModel extends BaseViewModel {
  TestUIViewModel(BuildContext context) {
    userService = context.read<AuthService>();
    api = context.read<Api>();
    navigator = Navigator.of(context);
  }
  NavigatorState navigator;
  AuthService userService;
  Api api;
  void onReady() {
    //
  }

  bool switchValue = false;
  // ignore: avoid_positional_boolean_parameters
  void toggleSwitch(bool value) {
    switchValue = value;
    notifyListeners();
  }

  Gender selectedGender = Gender.male;
  void selectGender(Gender value) {
    selectedGender = value;
    notifyListeners();
  }

  int searchTab = 0;

  void changeTab(int index) {
    searchTab = index;
    notifyListeners();
  }

  void logout() {
    userService.logout();
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SplashScreen()),
      (route) => false,
    );
  }

  void checkApi() {
    api.api.v1UserProfileGetUserProfilePost(body: null);
  }
}
