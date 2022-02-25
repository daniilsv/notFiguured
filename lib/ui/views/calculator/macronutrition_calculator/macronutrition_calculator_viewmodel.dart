import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/data/model/enum/consume_mode.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:notfiguured/ui/views/goal_create/macronutrition_goal_create/macronutrition_create_view.dart';
import 'package:notfiguured/ui/views/macro_proportions/macro_proportions_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/calculator_interface.dart';
import 'macronutrition_calculator_result_view.dart';

class MacronutritionModel {
  int calories;
  double carbohydratePercent;
  double proteinPercent;
  double fatPercent;
  int mealsCount;

  MacronutritionModel({
    this.calories,
    this.carbohydratePercent,
    this.proteinPercent,
    this.fatPercent,
    this.mealsCount,
  });
}

class MacronutritionCalculatorViewModel extends AppViewModel
    implements CalculatorInterface {
  MacronutritionCalculatorViewModel([BuildContext context]) : super(context) {
    canAddGoal = context.read<UserRepository>().userModel.val != null;
  }

  bool canAddGoal = false;

  final MacronutritionModel macronutrition = MacronutritionModel(
    calories: 2000,
    carbohydratePercent: 50.0,
    proteinPercent: 30.0,
    fatPercent: 20.0,
    mealsCount: 3,
  );
  String selectedMacroProportions = 'Стандартное';
  String get currentcalories => macronutrition.calories?.toString() ?? 0;

  ///result
  ConsumeMode _consumeMode = ConsumeMode.byDay;
  int get currentResultConsumeModeTabIndex => _consumeMode.index;

  Macronutrition resultDayGm;
  Macronutrition resultDayKcal;
  Macronutrition resultMealGm;
  Macronutrition resultMealKcal;

  Macronutrition get resultGm =>
      _consumeMode == ConsumeMode.byDay ? resultDayGm : resultMealGm;
  Macronutrition get resultKcal =>
      _consumeMode == ConsumeMode.byDay ? resultDayKcal : resultMealKcal;

  void onResultTabBarTap(int index) {
    _consumeMode = ConsumeMode.values.elementAt(index);
    notifyListeners();
  }

  void onCaloriesChange(String value) {
    macronutrition.calories = int.tryParse(value);
    notifyListeners();
  }

  Future<void> onMacroProportionsTap() async {
    final MacroProportionModel mp = await navigator.push(
      MacroProportionsRoute<MacroProportionModel>(
        dependency: MacroProportionsRouteDependency(
          initMacroProportion: selectedMacroProportions,
        ),
      ),
    );

    if (mp == null) return;
    macronutrition.proteinPercent = mp.proteinPercent;
    macronutrition.fatPercent = mp.fatPercent;
    macronutrition.carbohydratePercent = mp.carbohydratePercent;
    selectedMacroProportions = mp.name;
    notifyListeners();
  }

  void onMealsCountChange(int value) {
    macronutrition.mealsCount = value;
    notifyListeners();
  }

  void onMacronutritionChange(double protein, double fat, double carbohydrates) {
    macronutrition.proteinPercent = protein;
    macronutrition.fatPercent = fat;
    macronutrition.carbohydratePercent = carbohydrates;
    notifyListeners();
  }

  @override
  Future<void> calculate() async {
    if (!validate()) return;
    await makeRequest(
      makeRequest: () async {
        final res = await api.api.v1CalculatorCalculateMacronutritionPost(
          body: NutritionModel(
            calories: macronutrition.calories,
            carbohydratePercent: macronutrition.carbohydratePercent,
            fatPercent: macronutrition.fatPercent,
            proteinPercent: macronutrition.proteinPercent,
            mealsCount: macronutrition.mealsCount,
          ),
        );
        final List<Macronutrition> data = res.body;
        for (final Macronutrition macronutrition in data) {
          switch (macronutrition.description) {
            case "Cуточная норма белков, жиров, углеводов в день":
              resultDayGm = macronutrition;
              break;
            case "Количество белков, жиров и углеводов за один прием пищи":
              resultMealGm = macronutrition;
              break;
            case "Энергетическая ценность белков, жиров, углеводов за день":
              resultDayKcal = macronutrition;
              break;
            case "Калорийность белков, жиров, углеводов за один прием пищи":
              resultMealKcal = macronutrition;
              break;
          }
        }
        toResult();
      },
    );
  }

  @override
  void errorRequest([int errorStatus]) {}

  @override
  void toResult() {
    navigator.push(CalculateMacronutritionResultRoute(this));
  }

  @override
  bool validate() =>
      macronutrition.calories != null &&
      macronutrition.carbohydratePercent != null &&
      macronutrition.fatPercent != null &&
      macronutrition.mealsCount != null &&
      macronutrition.proteinPercent != null &&
      (macronutrition.proteinPercent +
              macronutrition.fatPercent +
              macronutrition.carbohydratePercent) ==
          100 &&
      macronutrition.proteinPercent >= 0 &&
      macronutrition.fatPercent >= 0 &&
      macronutrition.carbohydratePercent >= 0;

  void addToGoal() {
    navigator.push(
      MacronutritionGoalCreateRoute(
        PredefinedGoalData(
          protein: macronutrition.proteinPercent,
          fat: macronutrition.fatPercent,
          carbon: macronutrition.carbohydratePercent,
        ),
      ),
    );
  }
}
