import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/ui/views/calculator/macronutrition_calculator/macronutrition_calculator_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../goal_create.dart';

class MacronutritionGoalCreateViewModel extends AppViewModel {
  MacronutritionGoalCreateViewModel([BuildContext context]) : super(context) {
    predefined = context.read<PredefinedGoalData>();
    if (predefined != null) {
      goalB = predefined.protein;
      goalJ = predefined.fat;
      goalU = predefined.carbon;
      popAfter = predefined.popAfter;
    }
    diaryService = context.read<DiaryService>();
  }
  PredefinedGoalData predefined;
  DiaryService diaryService;

  double goalB = 20;
  double goalJ = 30;
  double goalU = 50;
  bool popAfter = false;

  bool validate() =>
      goalU != null &&
      goalJ != null &&
      goalB != null &&
      (goalB + goalJ + goalU) == 100 &&
      goalB >= 0 &&
      goalJ >= 0 &&
      goalU >= 0;

  Future<void> create() async {
    if (!validate()) {
      return showErrorMessage('Укажите правильные данные БЖУ');
    }
    makeRequest(
      makeRequest: () async {
        final resp = await api.api.v1TargetSaveTargetMacroPost(
          body: TargetMacroModel(
            protein: goalB,
            fat: goalJ,
            carbon: goalU,
          ),
        );
        if (resp.isSuccessful) {
          diaryService.saveWeightHeight(predefined?.weight, predefined?.height);
          diaryService.fetch();
          if (popAfter) {
            navigator.pop();
          } else {
            navigator.popUntil((route) {
              return route.settings?.name?.toLowerCase()?.contains('root') ?? false;
            });
          }
        } else {
          throw BadRequestException(resp);
        }
      },
      finalFunc: () => setBusy(false),
    );
  }

  Future<void> calculate() => navigator.push(CalculateMacronutritionRoute());

  @override
  void errorRequest([int errorStatus]) {}

  void setGoals(double protein, double fat, double carbohydrates) {
    goalB = protein;
    goalJ = fat;
    goalU = carbohydrates;
  }
}
