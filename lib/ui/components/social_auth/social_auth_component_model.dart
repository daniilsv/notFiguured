import 'dart:io';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/api/oauth.dart';
import 'package:notfiguured/data/model/enum/social_networks.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'social_auth_component.dart';

class SocialAuthComponentModel extends AppViewModel {
  SocialAuthComponentModel(
    BuildContext context,
    SocialAuthDependency dependency,
  ) : super(context) {
    onDone = dependency?.onDone;
    setViewModelBusy = dependency?.setViewModelBusy;
    checkIos();
  }

  void Function(Response<AuthorizationTokens> response) onDone;
  void Function(bool isBusy) setViewModelBusy;
  bool needAppleSingIn = false;

  Future<void> onReady() async {
    await checkIos();
    notifyListeners();
  }

  @override
  void setBusy(bool value) {
    if (setViewModelBusy != null) {
      setViewModelBusy(value);
    }
  }

  Future<void> onOAuthTap(SocialNetworks socialNetwork) async {
    setBusy(true);
    Response response;
    switch (socialNetwork) {
      case SocialNetworks.facebook:
        final facebookToken = await OAuth.signInFacebook();
        if (facebookToken != null) {
          response = await api.api.v1AccountFacebookLoginPost(
            body: FacebookLogin(
              facebookToken: facebookToken,
            ),
          );
        }
        break;
      case SocialNetworks.google:
        final googleToken = await OAuth.signInGoogle();
        if (googleToken != null) {
          response = await api.api.v1AccountGoogleLoginPost(
            body: GoogleLogin(
              googleToken: googleToken,
            ),
          );
        }
        break;
      case SocialNetworks.vk:
        final vkToken = await OAuth.signInVk();
        if (vkToken != null) {
          response = await api.api.v1AccountVkontakteLoginPost(
            body: VkLogin(
              email: vkToken.email,
              uId: vkToken.userId,
              token: vkToken.token,
            ),
          );
        }
        break;
      case SocialNetworks.ok:
        final okToken = await OAuth.signInOk();
        if (okToken != null) {
          response = await api.api.v1AccountOdnoklassnikiLoginPost(
            body: OkLogin(
              sessionSecretKey: okToken.secret,
              token: okToken.token,
            ),
          );
        }
        break;
    }
    setBusy(false);
    onDone(response);
  }

  Future<void> onAppleTap() async {
    setBusy(true);
    final User appleAuthData = await OAuth.signInApple();
    if (appleAuthData != null) {
      final response = await api.api.v1AccountAppleLoginPost(
        body: AppleModel(
          displayName: appleAuthData.displayName,
          email: appleAuthData.email,
          phoneNumber: appleAuthData.phoneNumber,
          photoUrl: appleAuthData.photoURL,
          uid: appleAuthData.uid,
        ),
      );
      if (response.isSuccessful) {
        onDone(response);
      } else {
        errorHandle(response.statusCode);
      }
    }
    setBusy(false);
  }

  Future checkIos() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      final iosVersion = int.tryParse(iosInfo.systemVersion.split('.')?.first) ?? 0;
      needAppleSingIn = iosVersion >= 13;
      notifyListeners();
    }
  }

  @override
  void errorRequest([int errorStatus]) {}
}
