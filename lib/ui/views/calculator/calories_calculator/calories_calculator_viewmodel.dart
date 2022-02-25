import 'dart:convert';
import 'dart:io';

import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/model/calories_calc.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/pickers/date/date_ios.dart';
import 'package:notfiguured/ui/pickers/decimal/decimal_view.dart';
import 'package:notfiguured/ui/pickers/sex/sex_android.dart';
import 'package:notfiguured/ui/pickers/sex/sex_ios.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/goal_create/calories_goal_create/calories_goal_create_view.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../widgets/calculator_interface.dart';
import 'calories_calculator_result_view.dart';

class CaloriesCalculatorViewModel extends AppViewModel implements CalculatorInterface {
  CaloriesCalculatorViewModel([BuildContext context]) : super(context) {
    userRepository = context.read<UserRepository>();
    if (userRepository.userModel.val == null) return;
    sex = userRepository.userModel.val.userAccountData?.sex ?? Sex.no;
    weight = userRepository.userModel.val.weight;
    height = userRepository.userModel.val.height;
    birthday = userRepository.userModel.val.userAccountData?.birthday;
    final user = userRepository.userModel.val;
    activity =
        user?.activity != null && user?.activity != Activity.swaggerGeneratedUnknown
            ? Activity.values[user?.activity?.index]
            : null;
  }

  bool get canAddGoal => userRepository.userModel.val != null;
  final List<CaloriesCalcLevel> goals = [];
  UserRepository userRepository;
  int selectedGoalIndex = 0;
  DateTime birthday;
  Sex sex = Sex.no;
  double goal;
  double weight;
  double height;
  Activity activity;

  String errSex;
  String errBirthday;
  String errActivity;
  String errHeight;
  String errWeight;
  String errGoal;

  String get birthdayString =>
      birthday == null ? 'Не выбрано' : Jiffy(birthday).format('dd.MM.yyyy');

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

  Future onActivityTap() async {
    final result = await AppChooser.activity(
      navigator.context,
      mainColor: AppColors.green,
    );
    if (result != null) {
      activity = Activity.values[result.index];
      notifyListeners();
    }
  }

  Future<void> onWeightGoalTap() async {
    double initValue;
    if (goal == null) {
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
      initValue = goal;
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
    goal = ret;
    notifyListeners();
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

  @override
  Future<void> calculate() async {
    if (!validate()) return;
    makeRequest(
      makeRequest: () async {
        final res = await api.api.v1CalculatorCalculateCaloriesPost(
          body: CaloriesInputModel(
            measure: MeasureModel(
              sex: sex,
              weight: weight,
              height: height,
              activity: activity,
              age: (DateTime.now().difference(birthday).inDays / 365).floor(),
            ),
            desiredWeight: goal,
          ),
        );
        if (res.isSuccessful) {
          final result = CaloriesCalc.fromJson(jsonDecode(res.bodyString));
          goals
            ..clear()
            ..addAll([
              result.safeCalories,
              result.desiredCalories,
              result.extremeCalories,
            ].where((element) => element != null));
          toResult();
        } else {
          throw BadRequestException(res);
        }
      },
      finalFunc: () => setBusy(false),
    );
  }

  @override
  void errorRequest([int errorStatus]) {}

  @override
  void toResult() {
    navigator.push(CalculateCaloriesResultRoute(this));
  }

  @override
  bool validate() {
    errSex =
        sex == null || sex == Sex.no ? Strings.current.required_not_empty_field : null;
    errWeight = weight == null ? Strings.current.required_not_empty_field : null;
    errGoal = goal == null ? Strings.current.required_not_empty_field : null;
    errBirthday = birthday == null ? Strings.current.required_not_empty_field : null;
    errActivity = activity == null ? Strings.current.required_not_empty_field : null;
    errHeight = weight == null ? Strings.current.required_not_empty_field : null;
    notifyListeners();
    return errSex == null &&
        errWeight == null &&
        errHeight == null &&
        errGoal == null &&
        errBirthday == null &&
        errActivity == null;
  }

  // ignore: use_setters_to_change_properties
  void onResultPageChanged(int pageIndex) {
    selectedGoalIndex = pageIndex;
  }

  void addToGoal(CaloriesCalcLevel goal) {
    navigator.push(
      CaloriesGoalCreateRoute(
        PredefinedGoalData(
          calories: goal.calories,
          fr: goal.zigzag.fr,
          mo: goal.zigzag.mo,
          th: goal.zigzag.th,
          tu: goal.zigzag.tu,
          we: goal.zigzag.we,
          sa: goal.zigzag.sa,
          su: goal.zigzag.su,
          height: height,
          weight: weight,
        ),
      ),
    );
  }
}
