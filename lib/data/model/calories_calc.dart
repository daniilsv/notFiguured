import 'package:notfiguured/l10n/generated/l10n.dart';

class CaloriesCalc {
  int calories;
  bool isBelowMinimum;
  CaloriesCalcLevel safeCalories;
  CaloriesCalcLevel desiredCalories;
  CaloriesCalcLevel extremeCalories;
  CaloriesCalc.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    isBelowMinimum = json['dailyCalLoss'];
    safeCalories = json['safeCalories'] == null
        ? null
        : CaloriesCalcLevel.fromJson(json['safeCalories']);
    desiredCalories = json['desiredCalories'] == null
        ? null
        : CaloriesCalcLevel.fromJson(json['desiredCalories']);
    extremeCalories = json['extremeCalories'] == null
        ? null
        : CaloriesCalcLevel.fromJson(json['extremeCalories']);
  }
}

enum GoalHardLevel { safe, desired, extreme }

extension GoalHardLevelExt on GoalHardLevel {
  String get name {
    switch (this) {
      case GoalHardLevel.safe:
        return Strings.current.goal_hardlevel_safety;
      case GoalHardLevel.desired:
        return Strings.current.goal_hardlevel_optionality;
      case GoalHardLevel.extreme:
        return Strings.current.goal_hardlevel_extream;
      default:
        return "none";
    }
  }

  int get level {
    switch (this) {
      case GoalHardLevel.safe:
        return 1;
      case GoalHardLevel.desired:
        return 2;
      case GoalHardLevel.extreme:
        return 3;
      default:
        return 0;
    }
  }
}

class CaloriesCalcLevel {
  int calories;
  int dailyCalLoss;
  int weeklyCalLoss;
  int monthlyCalLoss;
  double dailyKgLoss;
  double weeklyKgLoss;
  double monthlyKgLoss;
  int daysCount;
  DateTime beginDate;
  DateTime finishDate;
  ZigzagModel zigzag;
  GoalHardLevel scenarioId;
  CaloriesCalcLevel.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    dailyCalLoss = json['dailyCalLoss'];
    weeklyCalLoss = json['weeklyCalLoss'];
    monthlyCalLoss = json['monthlyCalLoss'];
    dailyKgLoss = double.parse(json['dailyKgLoss'].toString());
    weeklyKgLoss = double.parse(json['weeklyKgLoss'].toString());
    monthlyKgLoss = double.parse(json['monthlyKgLoss'].toString());
    daysCount = json['daysCount'];
    beginDate = DateTime.parse(json['beginDate']);
    finishDate = DateTime.parse(json['finishDate']);
    zigzag = ZigzagModel.fromJson(json['zigzag']);
    scenarioId = GoalHardLevel.values.firstWhere((element) =>
        element.toString().contains(json['scenarioId'].toString().toLowerCase()));
  }
}

class ZigzagModel {
  int mo;
  int tu;
  int we;
  int th;
  int fr;
  int sa;
  int su;
  ZigzagModel.fromJson(Map<String, dynamic> json) {
    mo = json["понедельник"];
    tu = json["вторник"];
    we = json["среда"];
    th = json["четверг"];
    fr = json["пятница"];
    sa = json["суббота"];
    su = json["воскресенье"];
  }
}
