import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/repository/diary_repository.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/foundation.dart';
import 'package:jiffy/jiffy.dart';

import 'auth_service.dart';

class DiaryService extends ChangeNotifier implements OnAuthListener {
  DiaryService(this.repository, this._authService, this._api) {
    _authService.addAuthListener(this);
  }

  final DiaryRepository repository;
  final AuthService _authService;
  final Api _api;
  Future<void> fetch() async {
    final res = await _api.api.v1TargetGetCurrentTargetsPost(body: null);
    final target = res.body;
    if (target != null || target.id != 0) {
      repository.clean();
      //КОСТЫЛИ из-за бэка
      if ((target.targetCalorie?.id ?? 0) != 0)
        repository.calories.val = target.targetCalorie;
      if ((target.targetMacro?.id ?? 0) != 0) repository.macro.val = target.targetMacro;
      if ((target.targetWeight?.id ?? 0) != 0)
        repository.weight.val = target.targetWeight;
      repository.current.val = target.targetCurrentFact;
      notifyListeners();
    }
  }

  ///получение рациона за день
  ///если `date == null`, то берется текущий день
  Future<DiaryDayModel> getDiary({DateTime date}) async {
    date = date ?? DateTime.now();
    final res = await _api.api.v1DiaryGetDiaryPost(
        body: RequestByDatesModel(
            fromDate: Jiffy(date).startOf(Units.DAY),
            toDate: Jiffy(date).endOf(Units.DAY)));
    return res.body?.isNotEmpty ?? false ? res.body.first : DiaryDayModel();
  }

  ///в какие дни замеры были сделаны
  Future<List<DateTime>> whenRecordsWhereTaken(DateTime from, DateTime to) async {
    final res = await _api.api.v1DiaryGetDiaryPost(
        body: RequestByDatesModel(
            fromDate: Jiffy(from).startOf(Units.DAY),
            toDate: Jiffy(to).endOf(Units.DAY)));
    return res.body
        .where((day) => day.foodContainers.any((meal) => meal.products.isNotEmpty))
        .map((day) => Jiffy.unix(day.unixDate).dateTime)
        .toList();
  }

  @override
  void onExit() {
    repository.clean();
  }

  @override
  void onUser(UserProfileModel user) {
    fetch();
  }

  void saveWeightHeight(double weight, double height) {
    if (weight == 0) weight = null;
    if (height == 0) height = null;
    repository.current.val = repository.current.val.copyWith(weight: weight);
    _authService.userRepository.userModel.val = _authService.userRepository.userModel.val
        .copyWith(weight: weight, height: height);
  }
}
