import 'dart:async';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/exercise_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fill_exercise_view.dart';

class FillExerciseViewModel extends AppViewModel {
  FillExerciseViewModel(BuildContext context) : super(context) {
    userRepository = context.read<UserRepository>();
    final dependency = context.read<FillExerciseDependency>();
    exercise = dependency.exerciseEdit ??
        DiaryDayExercise(
          exerciseId: dependency.exercise?.id,
          calories: dependency.exercise?.caloriesPerKg,
          name: dependency.exercise?.name,
        );
    training = dependency.training;
    dateTime = dependency.dateTime;
    controller =
        TextEditingController(text: exercise.amount?.toInt()?.toString() ?? '60');
    controller.addListener(notifyListeners);
    originalId = dependency.exerciseEdit?.id;
    service = context.read<ExerciseService>();
  }
  DiaryDayExercises training;
  ExerciseService service;
  UserRepository userRepository;
  double get _userWeight => userRepository.userModel.val?.weight;
  double get userWeight => _userWeight ?? 70;
  DateTime dateTime;

  DiaryDayExercise exercise;
  TextEditingController controller;
  int originalId;
  bool get isEdit => originalId != null;

  Future<void> onReady() async {}

  Future<void> onDeleteTap() async {
    final res = await showDialog(
      context: navigator.context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text('Удалить упражнение?'),
          content: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text('Упражнение «${exercise.name}» будет удалено безвозвратно.'),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: navigator.pop,
              child: Text(Strings.current.cancel),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => navigator.pop(true),
              child: const Text('Удалить'),
            ),
          ],
        );
      },
    );
    if (res != true) return;
    await service.deleteExercise(training, exercise.id);
    navigator.pop();
  }

  Future<void> onSaveTap() async {
    if ((double.tryParse(controller.text) ?? 0.0) == 0.0) return;
    exercise = exercise.copyWith(amount: double.tryParse(controller.text) ?? 0.0);
    if (isEdit)
      await service.updateExercise(training, originalId, exercise, dateTime);
    else
      await service.createExercise(exercise, training: training);
    navigator.pop(exercise);
  }

  @override
  void errorRequest([int errorStatus]) {}
}
