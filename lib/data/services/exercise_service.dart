import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/repository/exercise_repository.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/foundation.dart';
import 'package:jiffy/jiffy.dart';

import 'auth_service.dart';

class ExerciseService extends ChangeNotifier implements OnAuthListener {
  ExerciseService(this.repository, this._authService, this._api) {
    _authService.addAuthListener(this);
  }

  final ExerciseRepository repository;
  final AuthService _authService;
  final Api _api;

  Future<void> fetch() async {
    await getDiary(force: true);
    notifyListeners();
  }

  ///получение рациона за день
  ///если `date == null`, то берется текущий день
  Future<List<DiaryDayExercises>> getDiary({DateTime date, bool force = false}) async {
    date = date ?? DateTime.now();
    final _trainings = force ? null : repository.trainingsByDay(date);
    if (_trainings?.isNotEmpty == true) return _trainings;
    final res = await _api.api.v1DiaryGetActivityDiaryPost(
      body: RequestByDatesModel(
        fromDate: Jiffy(date).startOf(Units.DAY),
        toDate: Jiffy(date).endOf(Units.DAY),
      ),
    );
    for (final training in res.body ?? []) repository.saveTraining(training);
    return repository.trainingsByDay(date);
  }

  ///в какие дни замеры были сделаны
  Future<List<DateTime>> whenRecordsWhereTaken(
    DateTime from,
    DateTime to, {
    bool force = false,
  }) async {
    final _trainings = force ? [] : repository.filledDates();
    if (_trainings.isNotEmpty) return _trainings;
    final res = await _api.api.v1DiaryGetActivityDiaryPost(
      body: RequestByDatesModel(
        fromDate: Jiffy(from).startOf(Units.DAY),
        toDate: Jiffy(to).endOf(Units.DAY),
      ),
    );
    for (final training in res.body ?? []) repository.saveTraining(training);
    return repository.filledDates();
  }

  Future<void> deleteTraining(DiaryDayExercises training) async {
    await _api.api.v1DiaryRemoveExerciseEventsPost(
        body: training.exercises.map((ex) => ex.id).toList());
    await getDiary(date: training.date, force: true);
    notifyListeners();
  }

  Future<void> deleteExercise(DiaryDayExercises training, int exerciseId) async {
    await _api.api.v1DiaryRemoveExerciseEventsPost(body: [exerciseId]);
    await getDiary(date: training.date, force: true);
    notifyListeners();
  }

  Future<void> updateExercise(
    DiaryDayExercises training,
    int exerciseId,
    DiaryDayExercise exercise,
    DateTime dateTime
  ) async {
    await _api.api.v1DiaryRemoveExerciseEventsPost(body: [exerciseId]);
    await _api.api.v1DiaryAddExerciseEventPost(
        body: ExerciseEventModel(
      diaryId: training.diaryId,
      date: dateTime,
      amount: exercise.amount,
      exerciseId: exercise.exerciseId,
    ));
    await getDiary(date: training.date, force: true);
    notifyListeners();
  }

  Future<void> createExercise(
    DiaryDayExercise exercise, {
    DiaryDayExercises training,
  }) async {
    await _api.api.v1DiaryAddExerciseEventPost(
        body: ExerciseEventModel(
      diaryId: training?.diaryId,
      date: training?.date ?? DateTime.now(),
      amount: exercise.amount,
      exerciseId: exercise.exerciseId,
    ));
    await getDiary(date: training?.date, force: true);
    notifyListeners();
  }

  @override
  void onExit() {
    repository.clean();
  }

  @override
  void onUser(UserProfileModel user) {
    fetch();
  }
}
