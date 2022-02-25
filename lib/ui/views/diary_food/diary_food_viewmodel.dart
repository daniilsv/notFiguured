import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/services/food_service.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import 'fill_product/fill_product_view.dart';
import 'meal/meal_view.dart';

class DiaryFoodViewModel extends AppViewModel {
  DiaryFoodViewModel(BuildContext context) : super(context) {
    service = context.read<FoodService>();
    service.addListener(loadDiary);
  }

  FoodService service;

  DateTime historyStartDate = DateTime.now().subtract(const Duration(days: 60));
  DateTime get minRollingDate =>
      historyStartDate.compareTo(DateTime.now().subtract(const Duration(days: 60))) < 0
          ? historyStartDate
          : DateTime.now().subtract(const Duration(days: 60));
  DateTime maxRollingDate = DateTime.now();
  DateTime selectedDate = Jiffy().startOf(Units.DAY);

  List<DateTime> markedDates = <DateTime>[];

  DiaryDayModel currentDayDiary;

  bool get productsIsEmpty =>
      currentDayDiary?.foodContainers?.expand((e) => e.products)?.isEmpty ?? true;

  void changeDate(DateTime datetime) {
    selectedDate = datetime;
    loadDiary();
  }

  Future loadDiary({bool force = false}) async {
    setBusy(true);
    currentDayDiary = await service.getDiary(date: selectedDate, force: force);
    setBusy(false);
  }

  Future loadHistory() async {
    setBusy(true);
    markedDates = await service.whenRecordsWhereTaken(minRollingDate, maxRollingDate);
    historyStartDate = markedDates.last;
    setBusy(false);
  }

  void onProductTap(DiaryProduct product) {
    navigator.push(FillProductRoute(FillProductDependency(
      day: currentDayDiary,
      productEdit: product,
    )));
  }

  void onReady() {
    loadDiary();
    loadHistory();
  }

  void addRecord() => navigator.push(MealRoute(date: selectedDate));

  @override
  void errorRequest([int errorStatus]) {}
}
