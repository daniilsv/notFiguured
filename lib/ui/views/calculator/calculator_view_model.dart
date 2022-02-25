import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:flutter/widgets.dart';

import 'calories_calculator/calories_calculator_view.dart';
import 'macronutrition_calculator/macronutrition_calculator_view.dart';
import 'micronutrition_calculator/micronutrition_calculator_view.dart';
import 'water_calculator/water_calculator_view.dart';
import 'weight_calculator/weight_calculator_view.dart';

class CalculatorViewModel extends AppViewModel {
  CalculatorViewModel([BuildContext context]) : super(context);

  Future<void> onWeightTap() async {
    navigator.push(CalculateWeightRoute());
  }

  Future<void> onWaterTap() async {
    navigator.push(CalculateWaterRoute());
  }

  Future<void> onCaloriesTap() async {
    navigator.push(CalculateCaloriesRoute());
  }

  Future<void> onMacronutritionTap() async {
    navigator.push(CalculateMacronutritionRoute());
  }

  Future<void> onMicronutritionTap() async {
    navigator.push(CalculateMicronutritionRoute());
  }

  @override
  void errorRequest([int errorStatus]) {}
}
