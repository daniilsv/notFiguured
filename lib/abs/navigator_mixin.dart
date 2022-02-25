import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/ui/views/restore_password/enter_email/enter_email_view.dart';
import 'package:notfiguured/ui/views/root/root_view.dart';
import 'package:notfiguured/ui/views/sign_in/sign_in_view.dart';
import 'package:notfiguured/ui/views/sign_up/sign_up_view.dart';

mixin NavigatorMixin on AppBaseViewModel {
  void skip() => navigator.pushAndRemoveUntil(RootViewRoute(), (route) => false);

  void toSignUp() {
    navigator.pushReplacement(SignUpRoute());
  }

  void restorePassword() {
    navigator.push(EnterEmailRoute());
  }

  void toRoot() => navigator.pushAndRemoveUntil(RootViewRoute(), (route) => false);
  void toSignIn() => navigator.pushReplacement(SignInRoute());
}
