import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/ui/views/goal_create/goal_create.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum WeekDays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension WeekDaysValue on WeekDays {
  String get value {
    switch (this) {
      case WeekDays.monday:
        return "Понедельник";
      case WeekDays.tuesday:
        return "Вторник";
      case WeekDays.wednesday:
        return "Среда";
      case WeekDays.thursday:
        return "Четверг";
      case WeekDays.friday:
        return "Пятница";
      case WeekDays.saturday:
        return "Суббота";
      case WeekDays.sunday:
        return "Воскресенье";
    }
    return null;
  }

  static List<String> get listWeekDays => WeekDays.values.map((day) => day.value);
}

class CaloriesGoalCreateViewModel extends AppViewModel {
  CaloriesGoalCreateViewModel([BuildContext context]) : super(context) {
    diaryService = context.read<DiaryService>();
    predefined = context.read<PredefinedGoalData>();
    if (predefined != null) {
      goal = predefined.calories.toString();
      popAfter = predefined.popAfter;
      if (predefined.fr == null) return;
      zigzagMap[WeekDays.friday] = predefined.fr?.toString();
      zigzagMap[WeekDays.monday] = predefined.mo?.toString();
      zigzagMap[WeekDays.thursday] = predefined.th?.toString();
      zigzagMap[WeekDays.tuesday] = predefined.tu?.toString();
      zigzagMap[WeekDays.wednesday] = predefined.we?.toString();
      zigzagMap[WeekDays.saturday] = predefined.sa?.toString();
      zigzagMap[WeekDays.sunday] = predefined.su?.toString();
      isZigzag = true;      
    }
  }
  PredefinedGoalData predefined;
  DiaryService diaryService;
  Map<WeekDays, String> zigzagMap = {};
  bool isZigzag = false;
  String goal = '1500';
  String goalError;
  bool popAfter = false;
  void setGoal(String text) {
    goal = text;
    notifyListeners();
  }

  void toggleZigzag() {
    isZigzag = !isZigzag;
    if (isZigzag && zigzagMap.isEmpty) {
      zigzagMap[WeekDays.friday] = goal;
      zigzagMap[WeekDays.monday] = goal;
      zigzagMap[WeekDays.thursday] = goal;
      zigzagMap[WeekDays.tuesday] = goal;
      zigzagMap[WeekDays.wednesday] = goal;
      zigzagMap[WeekDays.saturday] = goal;
      zigzagMap[WeekDays.sunday] = goal;
    }
    if (!isZigzag && zigzagMap.isNotEmpty) {
      zigzagMap[WeekDays.friday] = null;
      zigzagMap[WeekDays.monday] = null;
      zigzagMap[WeekDays.thursday] = null;
      zigzagMap[WeekDays.tuesday] = null;
      zigzagMap[WeekDays.wednesday] = null;
      zigzagMap[WeekDays.saturday] = null;
      zigzagMap[WeekDays.sunday] = null;
    }
    notifyListeners();
  }

  void setZigzagText(WeekDays day, String value) {
    zigzagMap[day] = value;
    notifyListeners();
  }

  TargetCalorieModel buildRequest() {
    return TargetCalorieModel(
      calories: int.tryParse(goal),
      isZigzag: isZigzag,
      fr: int.tryParse(zigzagMap[WeekDays.friday] ?? ''),
      mo: int.tryParse(zigzagMap[WeekDays.monday] ?? ''),
      th: int.tryParse(zigzagMap[WeekDays.thursday] ?? ''),
      tu: int.tryParse(zigzagMap[WeekDays.tuesday] ?? ''),
      we: int.tryParse(zigzagMap[WeekDays.wednesday] ?? ''),
      sa: int.tryParse(zigzagMap[WeekDays.saturday] ?? ''),
      su: int.tryParse(zigzagMap[WeekDays.sunday] ?? ''),
    );
  }

  bool validate() {
    goalError = isZigzag || ((int.tryParse(goal ?? '') ?? 0) >= 1)
        ? null
        : 'Должно быть больше 1';
    return goalError == null;
  }

  Future<void> create() async {
    if (!validate()) return;
    makeRequest(
      finalFunc: () => setBusy(false),
      makeRequest: () async {
        final res = await api.api.v1TargetSaveTargetCaloriePost(body: buildRequest());
        if (res.isSuccessful) {
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
          throw BadRequestException(res);
        }
      },
    );
  }

  @override
  void errorRequest([int errorStatus]) {}
}
