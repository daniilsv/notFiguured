import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/repository/food_repository.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/foundation.dart';
import 'package:jiffy/jiffy.dart';

import 'auth_service.dart';

class FoodService extends ChangeNotifier implements OnAuthListener {
  FoodService(this.repository, this._authService, this._api) {
    _authService.addAuthListener(this);
  }

  final FoodRepository repository;
  final AuthService _authService;
  final Api _api;

  Future<void> fetch() async {
    await getDiary(force: true);
    notifyListeners();
  }

  void saveDays(List<DiaryDayModel> data) {
    final days = <DateTime, List<DiaryDayModel>>{};
    for (final record in data ?? <DiaryDayModel>[]) {
      if (days[record.date] == null) days[record.date] = [];
      days[record.date].add(record);
    }
    for (final day in days.keys) {
      final containers = <String, List<dynamic>>{};
      for (final record in days[day]) {
        for (final cont in record.foodContainers) {
          if (cont.products?.isEmpty ?? true) continue;
          if (containers[cont.name] == null)
            containers[cont.name] = [cont.copyWith(products: []), []];
          containers[cont.name][1].addAll(cont.products);
        }
      }
      repository.saveDay(
        days[day].first.copyWith(
              foodContainers: containers.keys
                  .map(
                    (cont) => (containers[cont][0] as FoodContainer).copyWith(
                      products: (containers[cont][1] as List).cast<DiaryProduct>(),
                    ),
                  )
                  .toList(),
            ),
      );
    }
  }

  ///получение рациона за день
  ///если `date == null`, то берется текущий день
  Future<DiaryDayModel> getDiary({DateTime date, bool force = false}) async {
    date = date ?? DateTime.now();
    final _trainings = force ? null : repository.diaryByDay(date);
    if (_trainings != null) return _trainings;
    final res = await _api.api.v1DiaryGetDiaryPost(
      body: RequestByDatesModel(
        fromDate: Jiffy(date).startOf(Units.DAY),
        toDate: Jiffy(date).endOf(Units.DAY),
      ),
    );

    saveDays(res.body);
    return repository.diaryByDay(date);
  }

  ///в какие дни замеры были сделаны
  Future<List<DateTime>> whenRecordsWhereTaken(
    DateTime from,
    DateTime to, {
    bool force = false,
  }) async {
    final _trainings = force ? [] : repository.filledDates();
    if (_trainings.isNotEmpty) return _trainings;
    final res = await _api.api.v1DiaryGetDiaryPost(
      body: RequestByDatesModel(
        fromDate: Jiffy(from).startOf(Units.DAY),
        toDate: Jiffy(to).endOf(Units.DAY),
      ),
    );
    saveDays(res.body);
    return repository.filledDates();
  }

  Future<void> deleteContainer(DiaryDayModel day, FoodContainer container) async {
    await _api.api.v1DiaryRemoveFoodEventsPost(
        body: container.products.map((ex) => ex.id).toList());
    await getDiary(date: day.date, force: true);
    notifyListeners();
  }

  Future<void> deleteProduct(DiaryDayModel day, int productId) async {
    await _api.api.v1DiaryRemoveFoodEventsPost(body: [productId]);
    await getDiary(date: day.date, force: true);
    notifyListeners();
  }

  Future<void> updateProduct(DiaryDayModel day, DiaryProduct product) async {
    await Future.wait([
      _api.api.v1DiaryRemoveFoodEventsPost(body: [product.id]),
      _api.api.v1DiaryAddFoodEventPost(
          body: FoodEventModel(
        diaryId: product.diaryDayId,
        amount: product.amount,
        foodType: product.foodType,
        productId: product.productId,
        portionSizeId: product.portionSizeId,
        date: day.date,
      ))
    ]);
    await getDiary(date: day.date, force: true);
    notifyListeners();
  }

  Future<void> createProduct(
    DiaryProduct product, {
    DiaryDayModel day,
  }) async {
    final res = await _api.api.v1DiaryAddFoodEventPost(
      body: FoodEventModel(
        diaryId: product.diaryDayId,
        amount: product.amount,
        foodType: product.foodType,
        productId: product.productId,
        portionSizeId: product.portionSizeId,
        date: day?.date ?? DateTime.now(),
      ),
    );
    if (res.isSuccessful) {
      await getDiary(date: day?.date, force: true);
      notifyListeners();
    }
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
