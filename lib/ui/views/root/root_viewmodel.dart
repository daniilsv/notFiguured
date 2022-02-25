import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/auth_service.dart';
import 'package:notfiguured/ui/views/goal_onboarding/goal_onboarding_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class RootViewModel extends BaseViewModel implements OnAuthListener {
  RootViewModel(BuildContext context) {
    navigator = Navigator.of(context);
    context.read<AuthService>().addAuthListener(this);
    userRepository = context.read<UserRepository>();
  }
  NavigatorState navigator;
  UserRepository userRepository;
  UserProfileModel get userModel => userRepository.userModel.val;

  bool get isLoggedIn => userModel != null;

  Future<void> onReady() async {
    if (isLoggedIn && userRepository.showGoalOnboarding.val) {
      Future.delayed(Duration.zero, () async {
        await navigator.push(GoalOnboardingRoute());
      });
    }
  }

  int index = 0;

  void changePage(int index) {
    this.index = index;
    notifyListeners();
  }

  @override
  void onExit() {
    index = 1;
    notifyListeners();
  }

  @override
  void onUser(UserProfileModel user) {
    index = 0;
    notifyListeners();
  }
}
