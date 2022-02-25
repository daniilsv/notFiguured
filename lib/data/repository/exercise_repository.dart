import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';

class ExerciseRepository {
  ExerciseRepository() {
    box = GetStorage('exercises');
  }
  GetStorage box;
  final _filledDates = <DateTime>{};

  void clean() {
    box.erase();
    _filledDates.clear();
    print('ExerciseRepository clean');
  }

  List<DiaryDayExercises> trainingsByDay(DateTime date) {
    date = Jiffy(date).startOf(Units.DAY);
    return box.read<List<DiaryDayExercises>>(date.toString(), (t) {
          return (t as List)?.map((train) => DiaryDayExercises.fromJson(train))?.toList();
        }) ??
        [];
  }

  void saveTraining(DiaryDayExercises training) {
    final trainings = trainingsByDay(training.date);
    final date = Jiffy.unix(training.unixDate).startOf(Units.DAY);
    trainings.removeWhere((element) => element.diaryId == training.diaryId);
    if (training.exercises?.isNotEmpty ?? false) trainings.add(training);
    if (trainings.isEmpty) {
      box.remove(date.toString());
      _filledDates.remove(date);
      return;
    }
    _filledDates.add(date);
    box.write(date.toString(), trainings, (List<DiaryDayExercises> t) {
      return t.map((train) => train.toJson()).toList();
    });
  }

  List<DateTime> filledDates() {
    if (_filledDates.isNotEmpty) return _filledDates.toList();
    _filledDates
      ..clear()
      ..addAll([...box.getKeys()].map((d) => Jiffy(d).dateTime));
    return _filledDates.toList();
  }
}
