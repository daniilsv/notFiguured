import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/exercise_service.dart';
import 'package:notfiguured/data/services/food_service.dart';
import 'package:notfiguured/ui/views/diary_exercise/fill_exercise/fill_exercise_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'training/training_view.dart';

class DiaryExerciseViewModel extends AppViewModel {
  DiaryExerciseViewModel(BuildContext context) : super(context) {
    diaryService = context.read<FoodService>();
    userRepository = context.read<UserRepository>();
    exerciseService = context.read<ExerciseService>();
    exerciseService.addListener(onReady);
  }
  @override
  void dispose() {
    super.dispose();
    exerciseService.removeListener(onReady);
  }

  FoodService diaryService;
  ExerciseService exerciseService;
  UserRepository userRepository;

  DateTime historyStartDate = DateTime.now().subtract(const Duration(days: 60));
  DateTime get minRollingDate => historyStartDate.compareTo(DateTime.now().subtract(const Duration(days: 60))) < 0 ? historyStartDate : DateTime.now().subtract(const Duration(days: 60));
  DateTime maxRollingDate = DateTime.now();
  DateTime selectedDate = Jiffy().startOf(Units.DAY);


  DiaryDayExercises currentDayDiary;
  List<DiaryDayExercises> currentDayTrainings;
  bool get exercisesIsEmpty => currentDayDiary?.exercises?.isEmpty ?? true;

  List<DateTime> markedDates = <DateTime>[];

  double currentDayBurn = 0;
  double currentDayEat = 0;
  double currentDaySum = 0;

  double get _userWeight => userRepository.userModel.val?.weight;
  double get userWeight => _userWeight ?? 70;

  void changeDate(DateTime datetime) {
    selectedDate = datetime;
    loadDiary();
  }

  Future loadDiary({bool force = false}) async {
    setBusy(true);
    currentDayTrainings =
        await exerciseService.getDiary(date: selectedDate, force: force);
    currentDayDiary = currentDayTrainings.isEmpty ? null : currentDayTrainings.first;

    final currentDayDiaryFood =
        await diaryService.getDiary(date: selectedDate, force: force);
    currentDayBurn = currentDayDiary?.exercises
            ?.sumByDouble((ex) => ex.amount / 60 * ex.calories * userWeight) ??
        0.0;
    currentDayEat = currentDayDiaryFood?.summary?.foodCalorie?.toDouble() ?? 0.0;
    currentDaySum = currentDayEat - currentDayBurn;
    setBusy(false);
  }

  Future loadHistory() async {
    setBusy(true);
    markedDates = await exerciseService.whenRecordsWhereTaken(
        DateTime.fromMillisecondsSinceEpoch(0), maxRollingDate, force: true);
    historyStartDate = markedDates.last;
    setBusy(false);
  }

  void onReady() {
    loadDiary();
    loadHistory();
  }

  void addRecord() => navigator.push(TrainingRoute(date: selectedDate));

  @override
  void errorRequest([int errorStatus]) {}

  void onExerciseTap(DiaryDayExercise exercise) {
    navigator.push(FillExerciseRoute(FillExerciseDependency(
        training: currentDayDiary, exerciseEdit: exercise, dateTime: selectedDate)));
  }
}
