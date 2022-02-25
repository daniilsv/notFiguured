import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/calculator_interface.dart';
import 'water_calculator_result_view.dart';

class WaterCalculatorViewModel extends AppViewModel implements CalculatorInterface {
  WaterCalculatorViewModel([BuildContext context]) : super(context) {
    _userRepository = context.read<UserRepository>();
    final user = _userRepository.userModel.val;
    measureInput = MeasureModel(
      sex: user?.userAccountData?.sex ?? Sex.no,
      utcDate: user?.userAccountData?.birthday,
      weight: user?.weight,
      activity:
          user?.activity != null && user?.activity != Activity.swaggerGeneratedUnknown
              ? Activity.values[user?.activity?.index]
              : null,
    );
  }

  UserRepository _userRepository;
  MeasureModel measureInput;
  int caloriesInput;
  CalculationAggregates result;

  double get volumeAverage =>
      double.parse(result?.average?.replaceAll(',', '.') ?? '0.0');
  double get volumeMaximum => double.parse(result?.max?.replaceAll(',', '.') ?? '0.0');
  double get glassVolume => 0.25;
  int get glassesCount => (volumeAverage / glassVolume).round();
  int get glassesMaximum => (volumeMaximum / glassVolume).round();

  double get bottleVolume => 0.5;
  int get bottlesCount => (volumeAverage / bottleVolume).round();

  Future selectSex() async {
    final sex = await AppChooser.sex(navigator.context);
    if (sex != null) {
      measureInput = measureInput.copyWith(sex: sex);
      notifyListeners();
    }
  }

  Future selectDateOfBirth() async {
    final dateOfBirth = await AppChooser.dateOfBirth(navigator.context);
    if (dateOfBirth != null) {
      measureInput = measureInput.copyWith(utcDate: dateOfBirth);
      notifyListeners();
    }
  }

  Future selectActivity() async {
    final activity = await AppChooser.activity(navigator.context);
    if (activity != null) {
      measureInput = measureInput.copyWith(activity: activity);
      notifyListeners();
    }
  }

  Future selectWeight() async {
    final weight = await AppChooser.weight(navigator.context);
    if (weight != null) {
      measureInput = measureInput.copyWith(weight: weight);
      notifyListeners();
    }
  }

  void selectCalories(String value) {
    caloriesInput = int.tryParse(value);
    validate();
  }

  String errSex;
  String errDateOfBirth;
  String errActivity;
  String errWeight;
  String errCalories;
  @override
  bool validate() {
    errSex = measureInput.sex == null || measureInput.sex == Sex.no
        ? Strings.current.required_not_empty_field
        : null;
    errDateOfBirth =
        measureInput.utcDate == null ? Strings.current.required_not_empty_field : null;
    errActivity =
        measureInput.activity == null ? Strings.current.required_not_empty_field : null;
    errWeight =
        measureInput.weight == null ? Strings.current.required_not_empty_field : null;
    errCalories = caloriesInput == null ? Strings.current.required_not_empty_field : null;
    notifyListeners();
    return errSex == null &&
        errDateOfBirth == null &&
        errActivity == null &&
        errWeight == null &&
        errCalories == null;
  }

  @override
  Future<void> calculate() async {
    if (!validate()) return;
    makeRequest(
      makeRequest: () async {
        final res = await api.api.v1CalculatorCalculateWaterPost(
          body: WaterInputModel(measure: measureInput, calories: caloriesInput),
        );
        result = res.body;
        if (result != null) toResult();
      },
    );
  }

  @override
  void errorRequest([int errorStatus]) {}

  @override
  void toResult() => navigator.push(CalculateWaterResultRoute(this));
}
