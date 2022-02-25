import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/ui/views/personalization/personalization_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

class GoalOnboardingViewModel extends BaseViewModel {
  NavigatorState navigator;
  UserRepository userRepository;

  String get nickname => userRepository.userModel.val.userAccountData.nickName;

  GoalOnboardingViewModel(BuildContext context) {
    navigator = Navigator.of(context);
    userRepository = context.read<UserRepository>();
  }

  void toPersonalize() => navigator.push(PersonalizationRoute());
  void fillLater() {
    userRepository.showGoalOnboarding.val = false;
    navigator.pop();
  }
}
