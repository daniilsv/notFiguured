import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';

class FoodRepository {
  FoodRepository() {
    box = GetStorage('food');
  }
  GetStorage box;
  final _filledDates = <DateTime>{};

  void clean() {
    box.erase();
    _filledDates.clear();
    print('FoodRepository clean');
  }

  DiaryDayModel diaryByDay(DateTime date) {
    date = Jiffy(date).startOf(Units.DAY);
    return box.read<DiaryDayModel>(date.toString(), (t) {
      return t == null ? null : DiaryDayModel.fromJson(t);
    });
  }

  void saveDay(DiaryDayModel diary) {
    final date = Jiffy.unix(diary.unixDate).startOf(Units.DAY);
    final containers = <FoodContainer>[];
    for (final con in diary.foodContainers)
      if (con.products.isNotEmpty) containers.add(con);
    if (containers.isEmpty) {
      box.remove(date.toString());
      _filledDates.remove(date);
      return;
    }
    diary = diary.copyWith(foodContainers: containers);
    _filledDates.add(date);
    box.write(date.toString(), diary, (DiaryDayModel t) {
      return t.toJson();
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
