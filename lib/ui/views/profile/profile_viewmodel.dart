import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/datezone/datezone_view.dart';
import 'package:notfiguured/ui/views/politics/politics_view.dart';
import 'package:notfiguured/ui/views/profile/underscreen/get_nick_screen.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/activity.dart';
import 'package:chopper_api/extensions/sex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

const String emptyString = '';

enum Fields {
  dateOfBirs,
  sex,
  growth,
  weight,
  timeLine,
  nickName,
  activity,
  exit,
  politics,
  about,
}

extension FieldsValue on Fields {
  String get value {
    switch (this) {
      case Fields.dateOfBirs:
        return Strings.current.dateOfBirs;
      case Fields.sex:
        return Strings.current.sex;
      case Fields.growth:
        return Strings.current.growth;
      case Fields.weight:
        return Strings.current.weight;
      case Fields.timeLine:
        return Strings.current.timeLine;
      case Fields.nickName:
        return Strings.current.nickname;
      case Fields.activity:
        return Strings.current.activity;
      case Fields.exit:
        return Strings.current.accountExit;
      case Fields.politics:
        return Strings.current.politics_short_title;
      case Fields.about:
        return Strings.current.about_app;
    }
    return null;
  }
}

class ProfileViewModel extends AppViewModel {
  List<Fields> blocked = [];
  UserRepository _userRepository;
  String appVersion = '';

  ProfileViewModel([BuildContext context]) : super(context) {
    _userRepository = context.read<UserRepository>();
    updateAppVersion();
  }

  Future<void> updateAppVersion() async {
    try {
      appVersion = await GetVersion.projectVersion;
    } on PlatformException {}
    notifyListeners();
  }

  @override
  void errorRequest([int errorStatus]) {
    if (errorStatus == 401) showErrorMessage(Strings.current.auth_error);
  }

  String get dateCopyright => '2013-${DateTime.now().year}';

  Map<Fields, VoidCallback> get callbacks => Map.fromIterable(Fields.values,
      key: (type) => type,
      value: (type) {
        switch (type) {
          case Fields.dateOfBirs:
            return () async {
              final birthday = await AppChooser.dateOfBirth(navigator.context);
              if (birthday != null)
                makeRequest(makeRequest: () async {
                  final response = await api.api.v1AccountUpdateUserPost(
                    body: UserAccountData(
                      birthday: birthday,
                    ),
                  );
                  if (!response.isSuccessful) throw BadRequestException(response);
                  _userRepository.updateUserAccountDataField(
                    birthday: birthday,
                  );
                  notifyListeners();
                });
            };
          case Fields.sex:
            return () async {
              final sex = await AppChooser.sex(navigator.context);
              if (sex != null)
                makeRequest(makeRequest: () async {
                  final response = await api.api.v1AccountUpdateUserPost(
                    body: UserAccountData(sex: sex),
                  );
                  if (!response.isSuccessful) throw BadRequestException(response);
                  _userRepository.updateUserAccountDataField(sex: sex);
                  notifyListeners();
                });
            };
          case Fields.weight:
            return () async {
              final weight = await AppChooser.weight(navigator.context,
                  initial: _userRepository.userModel.val.weight);
              if (weight != null)
                makeRequest(makeRequest: () async {
                  final response = await api.api.v1UserProfileSaveUserProfilePost(
                    body: UserProfileModel(
                      weight: weight,
                    ),
                  );
                  if (!response.isSuccessful) throw BadRequestException(response);
                  _userRepository.userModel.val =
                      _userRepository.userModel.val.copyWith(weight: weight);
                  notifyListeners();
                });
            };
          case Fields.growth:
            return () async {
              final growth = await AppChooser.growth(navigator.context,
                  initial: _userRepository.userModel.val.height);
              makeRequest(makeRequest: () async {
                final response = await api.api.v1UserProfileSaveUserProfilePost(
                  body: UserProfileModel(
                    height: growth,
                  ),
                );
                if (!response.isSuccessful) throw BadRequestException(response);
                _userRepository.userModel.val =
                    _userRepository.userModel.val.copyWith(height: growth);
                notifyListeners();
              });
            };
          case Fields.timeLine:
            return () async {
              final MapEntry<String, String> result =
                  await navigator.push<MapEntry<String, String>>(DatezoneRoute());
              makeRequest(makeRequest: () async {
                final response = await api.api.v1AccountUpdateUserPost(
                  body: UserAccountData(
                    timezone: result.value,
                  ),
                );
                if (!response.isSuccessful) throw BadRequestException(response);
                _userRepository.updateUserAccountDataField(
                  timezone: result.value,
                );
                notifyListeners();
              });
            };
          case Fields.nickName:
            return () async {
              final result = await navigator.push(MaterialPageRoute(
                builder: (context) => ChangeNickName(
                    nickName: _userRepository.userModel.val?.userAccountData?.nickName ??
                        emptyString),
              ));
              makeRequest(makeRequest: () async {
                final response = await api.api.v1AccountUpdateUserPost(
                  body: UserAccountData(
                    nickName: result,
                  ),
                );
                if (!response.isSuccessful) throw BadRequestException(response);
                _userRepository.updateUserAccountDataField(nickName: result);
                notifyListeners();
              });
            };
          case Fields.activity:
            return () async {
              final activity = await AppChooser.activity(navigator.context);
              if (activity != null)
                makeRequest(makeRequest: () async {
                  final response = await api.api.v1UserProfileSaveUserProfilePost(
                    body: UserProfileModel(
                      activity: Activity.values[activity.index],
                    ),
                  );
                  if (!response.isSuccessful) throw BadRequestException(response);
                  _userRepository.userModel.val = _userRepository.userModel.val
                      .copyWith(activity: Activity.values[activity.index]);
                  notifyListeners();
                });
            };
          case Fields.politics:
            return () async {
              await navigator.push(
                PoliticsRoute(
                  PoliticsRouteDependency(
                    withAccept: false,
                  ),
                ),
              );
            };
        }
        return () {};
      });

  String operator [](Fields type) {
    // определить занчение для кажддого поля
    switch (type) {
      case Fields.dateOfBirs:
        return _userRepository.userModel.val?.userAccountData?.birthday != null
            ? DateFormat('dd.MM.yyyy')
                .format(_userRepository.userModel.val?.userAccountData?.birthday)
            : emptyString;
      case Fields.sex:
        return _userRepository.userModel.val?.userAccountData?.sex?.localize ??
            emptyString;
      case Fields.growth:
        return _userRepository.userModel.val?.height?.toString() ?? emptyString;
      case Fields.weight:
        return _userRepository.userModel.val?.weight?.toString() ?? emptyString;
      case Fields.timeLine:
        return _userRepository.userModel.val?.userAccountData?.timezone ?? emptyString;
      case Fields.nickName:
        return _userRepository.userModel.val?.userAccountData?.nickName ?? emptyString;
      case Fields.activity:
        return _userRepository.userModel.val?.activity?.title ?? emptyString;
      case Fields.exit:
        return emptyString;
      case Fields.politics:
        return emptyString;
      case Fields.about:
        return appVersion;
    }
    return null;
  }

  void logout() {
    _userRepository.userModel.val = null;
    authService.logout();
    notifyListeners();
  }
}
