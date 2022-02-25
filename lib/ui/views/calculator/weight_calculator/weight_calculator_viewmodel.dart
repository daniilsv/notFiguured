import 'dart:io';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/pickers/decimal/decimal_view.dart';
import 'package:notfiguured/ui/pickers/sex/sex_android.dart';
import 'package:notfiguured/ui/pickers/sex/sex_ios.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/ui/views/goal_create/weight_goal_create/weight_create_view.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../widgets/calculator_interface.dart';
import 'weigth_calculator_result_view.dart';

class WeightCalculatorViewModel extends AppViewModel implements CalculatorInterface {
  // ignore: avoid_positional_boolean_parameters
  WeightCalculatorViewModel([BuildContext context, this.isPicker]) : super(context) {
    userRepository = context.read<UserRepository>();
    if (userRepository.userModel.val == null) return;
    sex = userRepository.userModel.val.userAccountData?.sex ?? Sex.no;
    weight = userRepository.userModel.val.weight;
    height = userRepository.userModel.val.height;
    final value = context.read<MeasurementsService>().repository.current.val;
    wrist = value?.wrist ?? 0;
    chest = value?.chest ?? 0;
  }
  bool get canAddGoal => userRepository.userModel.val != null;
  final bool isPicker;

  UserRepository userRepository;
  DiaryService diaryService;
  double idealWeight;
  Sex sex = Sex.no;
  double weight;
  double height;
  double chest;
  double wrist;

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
      errSex = null;
      notifyListeners();
    }
  }

  Future<void> onWeightTap() async {
    final ret = await AppChooser.weight(
      navigator.context,
      initial: weight,
      sex: sex,
    );
    if (ret == null) return;
    weight = ret;
    errWeight = null;
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
    errHeight = null;
    notifyListeners();
  }

  Future<void> onWristTap() async {
    final double initValue = wrist ?? 17;
    final ret = await showDecimalPicker(
      navigator.context,
      title: Strings.current.wrist,
      suffixText: Strings.current.sm,
      minValue: 5,
      maxValue: 30,
      initialValue: initValue,
    );
    if (ret == null) return;
    wrist = ret;
    notifyListeners();
  }

  Future<void> onChestTap() async {
    final double initValue = chest ?? 90;
    final ret = await showDecimalPicker(
      navigator.context,
      title: Strings.current.chest,
      suffixText: Strings.current.sm,
      minValue: 50,
      maxValue: 140,
      initialValue: initValue,
    );
    if (ret == null) return;
    chest = ret;
    notifyListeners();
  }

  String errSex;
  String errWeight;
  String errHeight;
  @override
  bool validate() {
    errSex =
        sex == null || sex == Sex.no ? Strings.current.required_not_empty_field : null;
    errWeight = weight == null ? Strings.current.required_not_empty_field : null;
    errHeight = height == null ? Strings.current.required_not_empty_field : null;
    notifyListeners();
    return errSex == null && errWeight == null && errHeight == null;
  }

  @override
  Future<void> calculate() async {
    if (!validate()) return;
    makeRequest(
        makeRequest: () async {
          final res = await api.api.v1CalculatorCalculateIdealWeightPost(
            body: IdealWeightInputModel(
              measure: MeasureModel(
                sex: sex,
                weight: weight,
                height: height,
                chest: chest,
                wrist: wrist,
              ),
            ),
          );
          idealWeight = double.tryParse(res.body.average.replaceAll(',', '.'));
          if (idealWeight == null) errorHandle();
          toResult();
        },
        finalFunc: () => setBusy(false));
  }

  @override
  void errorRequest([int errorStatus]) {}

  @override
  void toResult() => navigator.push(CalculateWeightResultRoute(this));

  void addToGoal() {
    if (isPicker ?? false) {
      navigator.pop();
      navigator.pop(idealWeight);
    } else {
      navigator.push(
        WeightGoalCreateRoute(
          PredefinedGoalData(
            weight: weight,
            height: height,
            goal: idealWeight,
          ),
        ),
      );
    }
  }
}
