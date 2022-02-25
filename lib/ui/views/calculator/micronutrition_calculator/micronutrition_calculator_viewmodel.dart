import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/calculator_interface.dart';
import 'micronutrition_calculator_result_view.dart';

class MicronutritionCalculatorViewModel extends AppViewModel
    implements CalculatorInterface {
  // ignore: avoid_positional_boolean_parameters
  MicronutritionCalculatorViewModel([BuildContext context, this.isPicker])
      : super(context) {
    userRepository = context.read<UserRepository>();
    if (userRepository.userModel.val == null) return;
    sex = userRepository.userModel.val.userAccountData?.sex ?? Sex.no;
    dateOfBirth = userRepository.userModel.val.userAccountData?.birthday;
    final user = userRepository.userModel.val;
    activity =
        user?.activity != null && user?.activity != Activity.swaggerGeneratedUnknown
            ? Activity.values[user?.activity?.index]
            : null;
  }

  final bool isPicker;

  UserRepository userRepository;
  DiaryService diaryService;
  Sex sex = Sex.no;
  DateTime dateOfBirth;
  Activity activity;
  MicronutrientCountry country;

  Map<String, MicroModel> result = {};
  String selectedResultCategory;
  //  MicroModel(); //Макронутриенты
  //  MicroCategoryModel(); //жиры
  //  MicroDataModel(); //МНЖК
  //  SmallMicroModel(); //26,1г

  List<String> get resultCategories => result.keys.toList();

  Future selectSex() async {
    final sex = await AppChooser.sex(navigator.context);
    if (sex != null) {
      this.sex = sex;
      notifyListeners();
    }
  }

  Future selectDateOfBirth() async {
    final dateOfBirth = await AppChooser.dateOfBirth(navigator.context);
    if (dateOfBirth != null) {
      this.dateOfBirth = dateOfBirth;
      notifyListeners();
    }
  }

  Future selectActivity() async {
    final activity =
        await AppChooser.activity(navigator.context, mainColor: AppColors.violet);
    if (activity != null) {
      this.activity = activity;
      notifyListeners();
    }
  }

  Future selectCountry() async {
    final country = await AppChooser.country(navigator.context);
    if (country != null) {
      this.country = country;
      notifyListeners();
    }
  }

  Future selectResultCategory(String category) async {
    selectedResultCategory = category;
    notifyListeners();
  }

  bool isDeepNotrh = false;
  void onDeepNorth() {
    isDeepNotrh = !isDeepNotrh;
    notifyListeners();
  }

  bool isPregnant = false;
  void onPregnant() {
    isPregnant = !isPregnant;
    notifyListeners();
  }

  bool isLactFirst = false, isLactSecond = false;
  void onLactFirst() {
    isLactFirst = !isLactFirst;
    notifyListeners();
  }

  void onLactSecond() {
    isLactSecond = !isLactSecond;
    notifyListeners();
  }

  String errSex;
  String errDateOfBirth;
  String errActivity;
  String errCountry;
  @override
  bool validate() {
    errSex =
        sex == null || sex == Sex.no ? Strings.current.required_not_empty_field : null;
    errDateOfBirth =
        dateOfBirth == null ? Strings.current.required_not_empty_field : null;
    errActivity = activity == null ? Strings.current.required_not_empty_field : null;
    errCountry = country == null ? Strings.current.required_not_empty_field : null;
    notifyListeners();
    return errSex == null &&
        errActivity == null &&
        errDateOfBirth == null &&
        errCountry == null;
  }

  WomanState get womanState {
    if (sex != Sex.female) return null;
    if (isPregnant) return WomanState.pregnant;
    if (isLactFirst) return WomanState.lactationfirst;
    if (isLactSecond) return WomanState.lactationsecond;
    return null;
  }

  @override
  Future<void> calculate() async {
    if (!validate()) return;
    makeRequest(
        makeRequest: () async {
          final res = await api.api.v1CalculatorCalculateMicronutritionPost(
            body: MicronutrionInputModel(
              countryId: country,
              measure: MeasureModel(
                sex: sex,
                activity: activity,
                age: (dateOfBirth.difference(DateTime.now()).inDays ~/ 365).abs(),
                utcDate: DateTime.now()
              ),
              isClimateCold: isDeepNotrh,
              womanState: womanState,
            ),
          );
          if (res.isSuccessful) {
            selectedResultCategory = res.body.first.name;
            for (final model in res.body) {
              result[model.name] = model;
            }
            toResult();
          }
        },
        finalFunc: () => setBusy(false));
  }

  @override
  void errorRequest([int errorStatus]) {}

  @override
  void toResult() => navigator.push(CalculateVitaminsResultRoute(this));
}
