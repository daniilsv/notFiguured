import 'dart:convert';
import 'dart:io';

import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/repository/static_repository.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/auth_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/pickers/date/date_ios.dart';
import 'package:notfiguured/ui/pickers/decimal/decimal_view.dart';
import 'package:notfiguured/ui/pickers/sex/sex_android.dart';
import 'package:notfiguured/ui/pickers/sex/sex_ios.dart';
import 'package:notfiguured/ui/views/datezone/datezone_view.dart';
import 'package:notfiguured/ui/views/root/root_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PersonalizationViewModel extends BaseViewModel {
  PersonalizationViewModel(BuildContext context) {
    navigator = Navigator.of(context);
    userRepository = context.read<UserRepository>();
    staticRepository = context.read<StaticRepository>();
    authService = context.read<AuthService>();
    api = context.read<Api>();

    activities = Activity.values.toList();
    activities.remove(Activity.swaggerGeneratedUnknown);
  }
  NavigatorState navigator;
  UserRepository userRepository;
  StaticRepository staticRepository;
  AuthService authService;
  Api api;

  final int steps = 3;
  int step = 0;
  double get stepValue => (step + 1) / steps;

  List<Activity> activities;

  Activity activityType = Activity.moderatelyactive;
  double get currentIndex =>
      activities.indexWhere((element) => element == activityType).toDouble();

  Sex sex;
  DateTime birthday;
  MapEntry<String, String> dateZone; //markNaZone
  double weight;
  double height;

  bool isNextButtonActive() {
    if (step == 0) {
      return sex != null && birthday != null && dateZone != null;
    } else if (step == 1) {
      return weight != null && height != null;
    } else {
      return true;
    }
  }

  String get birthdayString =>
      birthday == null ? 'Не выбрано' : Jiffy(birthday).format('dd.MM.yyyy');

  Future onReady() async {
    setDefaultTimezone();
  }

  Future<void> setDefaultTimezone() async {
    String currentTimeZone;
    Map<String, dynamic> iana;
    await Future.wait([
      FlutterNativeTimezone.getLocalTimezone().then(
        (timeZone) => currentTimeZone = timeZone,
      ),
      DefaultAssetBundle.of(navigator.context).loadString("assets/jsons/iana.json").then(
            (data) => iana = json.decode(data),
          ),
    ]);
    if (iana.containsKey(currentTimeZone)) {
      final winTimezone = iana[currentTimeZone];
      if (staticRepository.timezones.val.containsKey(winTimezone)) {
        dateZone = MapEntry(
          winTimezone,
          staticRepository.timezones.val[winTimezone],
        );
        notifyListeners();
      }
    }
  }

  void nextStep() {
    if (step + 1 == steps) {
      send();
      return;
    }
    step++;
    notifyListeners();
  }

  Future<void> send() async {
    UserProfileModel newUser;
    setBusy(true);
    try {
      final res = await api.api.v1UserProfileSaveUserProfilePost(
        body: UserProfileModel(
          userAccountData: UserAccountData(
            birthday: birthday,
            sex: sex ?? Sex.no,
            timezone: dateZone?.key,
          ),
          activity: activityType,
          height: height,
          weight: weight,
        ),
      );
      newUser = res?.body;
    } on Exception catch (e) {
      logger.e(e);
    }
    if (newUser != null) {
      final userData = userRepository.userModel.val.userAccountData.copyWith(
        birthday: newUser.userAccountData.birthday,
        sex: sex,
        timezone: newUser.userAccountData.timezone,
      );
      userRepository.userModel.val = userRepository.userModel.val.copyWith(
        userAccountData: userData,
        height: height,
        activity: activityType,
        weight: weight,
      );
      authService.hideGoalOnboarding();
    }
    setBusy(false);
    userRepository.showGoalOnboarding.val = false;
    navigator.pushAndRemoveUntil(
      RootViewRoute(),
      (route) => false,
    );
  }

  Future<bool> previousStep() async {
    if (step == 0) {
      navigator.pop();
    } else {
      step--;
      notifyListeners();
    }
    return false;
  }

  Future onSexTap() async {
    Sex _sex;
    if (Platform.isIOS) {
      _sex = await showCupertinoModalPopup<Sex>(
        context: navigator.context,
        builder: (context) => const SexCupertinoActionSheet(),
      );
    } else {
      _sex = await showModalBottomSheet<Sex>(
        context: navigator.context,
        builder: (context) => const SexBottomSheetPicker(),
      );
    }
    if (_sex != null) {
      sex = _sex;
      notifyListeners();
    }
  }

  Future onBirthdayTap() async {
    DateTime _birthday;
    if (Platform.isIOS) {
      _birthday = await showModalBottomSheet(
        context: navigator.context,
        builder: (context) => IosDatePicker(
          currentDate: birthday,
        ),
      );
    } else {
      _birthday = await showDatePicker(
        context: navigator.context,
        firstDate: DateTime(1920),
        initialDate: DateTime(1990),
        lastDate: DateTime.now(),
        cancelText: Strings.current.cancel,
        confirmText: Strings.current.done,
        currentDate: birthday,
        initialDatePickerMode: DatePickerMode.year,
      );
    }
    if (_birthday != null) {
      birthday = _birthday;
      notifyListeners();
    }
  }

  Future onDateZoneTap() async {
    final MapEntry<String, String> _dateZone =
        await navigator.push<MapEntry<String, String>>(DatezoneRoute());
    if (_dateZone != null) {
      dateZone = _dateZone;
      notifyListeners();
    }
  }

  Future<void> onWeightTap() async {
    double initValue;
    if (weight == null) {
      switch (sex) {
        case Sex.male:
          initValue = 89;
          break;
        case Sex.female:
          initValue = 75;
          break;
        default:
          initValue = 78;
      }
    } else {
      initValue = weight;
    }
    final ret = await showDecimalPicker(
      navigator.context,
      title: Strings.current.weight,
      suffixText: Strings.current.kg,
      minValue: 20,
      maxValue: 220,
      initialValue: initValue,
    );
    if (ret == null) return;
    weight = ret;
    notifyListeners();
  }

  Future<void> onHeightTap() async {
    double initValue;
    if (height == null) {
      switch (sex) {
        case Sex.male:
          initValue = 177;
          break;
        case Sex.female:
          initValue = 166;
          break;
        default:
          initValue = 168;
      }
    } else {
      initValue = height;
    }
    final ret = await showDecimalPicker(
      navigator.context,
      title: Strings.current.growth,
      suffixText: Strings.current.sm,
      minValue: 120,
      maxValue: 220,
      initialValue: initValue,
    );
    if (ret == null) return;
    height = ret;
    notifyListeners();
  }

  void onActivityChange(_, dynamic low, dynamic high) {
    if (low is! double) return;
    final value = low.round().clamp(0, activities.length - 1);
    activityType = activities[value];
    notifyListeners();
  }
}
