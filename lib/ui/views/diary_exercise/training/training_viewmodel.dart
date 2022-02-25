import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/exercise_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/diary_exercise/fill_exercise/fill_exercise_view.dart';
import 'package:notfiguured/ui/views/diary_exercise/pick_exercise/pick_exercise_view.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class TrainingViewModel extends AppViewModel {
  TrainingViewModel(BuildContext context, {this.date}) : super(context) {
    date ??= DateTime.now();

    userRepository = context.read<UserRepository>();
    service = context.read<ExerciseService>();
    service.addListener(loadDiary);
  }

  @override
  void dispose() {
    super.dispose();
    service.removeListener(loadDiary);
  }

  ExerciseService service;
  UserRepository userRepository;

  DiaryDayExercises training;
  double totalBurn;

  double get _userWeight => userRepository.userModel.val?.weight;
  double get userWeight => _userWeight ?? 70;

  DateTime date;
  String get dateString => Jiffy(date).format('dd.MM.yyyy');

  Future onDateTap() async {
    final _date = await AppChooser.date(navigator.context, initial: date);
    if (_date == null) return;
    date = _date;
    loadDiary();
    notifyListeners();
  }

  void addProducts() {
    navigator.push(PickExerciseRoute(training: DiaryDayExercises(date: date)));
  }

  @override
  void errorRequest([int errorStatus]) {}

  Future<void> onReady() async {
    loadDiary();
  }

  Future<void> loadDiary() async {
    setBusy(true);
    final currentDayTrainings = await service.getDiary(date: date);
    training = currentDayTrainings.isEmpty ? null : currentDayTrainings.first;

    totalBurn = training?.exercises
        ?.sumByDouble((ex) => ex.amount / 60 * ex.calories * userWeight);
    setBusy(false);
  }

  Future<void> cancel() async {
    final res = await showDialog(
      context: navigator.context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text('Удалить тренировку?'),
          content: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text('Тренировка будет удалена безвозвратно.'),
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
    setBusy(true);
    await service.deleteTraining(training);
    navigator.pop();
  }

  void save() {
    navigator.pop();
  }

  void onExerciseTap(DiaryDayExercise exercise) {
    navigator.push(FillExerciseRoute(FillExerciseDependency(
      training: training,
      exerciseEdit: exercise,
      dateTime: date
    )));
  }

  Future<void> onExerciseDelete(DiaryDayExercise exercise) async {
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
    service.deleteExercise(training, exercise.id);
  }
}
