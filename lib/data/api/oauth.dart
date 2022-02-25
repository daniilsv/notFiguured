import 'package:notfiguured/app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:flutter_ok_sdk/flutter_ok_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OAuth {
  static Future<String> signInGoogle() async {
    String token;
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.email',
      ],
    );
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await account?.authentication;
      token = googleAuth?.accessToken;
    } on Exception catch (e) {
      logger.e(e);
    }
    return token;
  }

  static Future<String> signInFacebook() async {
    String token;
    try {
      final accessToken = await FacebookAuth.instance.login();
      token = accessToken?.token;
    } on Exception catch (e) {
      logger.e(e);
    }
    return token;
  }

  static Future<User> signInApple() async {
    User user;
    try {
      user = await FirebaseAuthOAuth().openSignInFlow(
        "apple.com",
        ["email", "name"],
        {"locale": "ru"},
      );
    } on Exception catch (error) {
      logger.e(error);
    }
    logger.d(user.toString());
    return user;
  }

  static final VKLogin _vk = VKLogin();
  static Future<VKAccessToken> signInVk() async {
    if (!_vk.isInitialized) {
      await _vk.initSdk('7729328');
    }
    VKAccessToken vkToken;
    try {
      final res = await _vk.logIn(scope: [VKScope.email]);
      if (res != null && (res?.isValue ?? false)) {
        final VKLoginResult data = res.asValue.value;
        if (!data.isCanceled) {
          vkToken = data.accessToken;
        }
      }
    } on Exception catch (e) {
      logger.e(e);
    }
    return vkToken;
  }

  static Future<OkToken> signInOk() async {
    OkToken okToken;
    try {
      okToken = await FlutterOkSdk.login();
    } on Exception catch (e) {
      logger.e(e);
    }
    return okToken;
  }
}
