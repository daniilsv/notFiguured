import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/static_service.dart';
import 'package:notfiguured/ui/views/root/root_view.dart';
import 'package:notfiguured/ui/views/root/root_viewmodel.dart';
import 'package:notfiguured/ui/views/sign_in/sign_in_view.dart';
import 'package:notfiguured/ui/views/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class SplashViewModel extends AppBaseViewModel {
  SplashViewModel(BuildContext context) {
    final userRepository = context.read<UserRepository>();
    userModel = userRepository.userModel;
    staticService = context.read<StaticService>();
    navigator = Navigator.of(context);
    try {
      context.read<RootViewModel>();
      isNested = true;
    } on dynamic {
      setBusy(true);
    }
  }
  ReadWriteValue userModel;
  StaticService staticService;
  bool isNested = false;

  CrossFadeState get crossFadeState =>
      isBusy ? CrossFadeState.showFirst : CrossFadeState.showSecond;

  Future<void> onReady() async {
    if (!isBusy) return;
    await staticService.init();
    await Future<void>.delayed(2.seconds);
    if (userModel.val == null) {
      setBusy(false);
      return;
    }
    toRoot();
  }

  void navigate(Route route) {
    if (isNested)
      navigator.push(route);
    else
      navigator.pushAndRemoveUntil(route, (route) => false);
  }

  void toSignIn() => navigate(SignInRoute());
  void toSignUp() => navigate(SignUpRoute());
  void toRoot() => navigate(RootViewRoute());
}
