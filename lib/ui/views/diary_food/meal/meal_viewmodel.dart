import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/extensions/date.dart';
import 'package:notfiguured/data/model/enum/meal_type.dart';
import 'package:notfiguured/data/services/food_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/views/diary_food/fill_product/fill_product_view.dart';
import 'package:notfiguured/ui/views/diary_food/pick_product/pick_product_view.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class MealViewModel extends AppViewModel {
  MealViewModel(BuildContext context, {this.date}) : super(context) {
    final now = DateTime.now();
    if (date == null || date.inSameDay(now))
      date = now;
    else
      date = Jiffy(date)
          .startOf(Units.DAY)
          .add(Duration(hours: now.hour, minutes: now.minute));
    foodType = mealFromDateTime(date).toFoodType;
    service = context.read<FoodService>();
    service.addListener(loadDiary);
    diaryService = context.read<DiaryService>();
  }

  DiaryDayModel day;
  FoodContainer container;
  FoodType foodType = FoodType.breakfast;

  FoodService service;
  DiaryService diaryService;
  double calorieTotal = 0;
  double proteinTotal = 0;
  double fatTotal = 0;
  double carbTotal = 0;
  DateTime date;
  String get dateString => Jiffy(date).format('dd.MM.yyyy');
  String get timeString => Jiffy(date).format('HH:mm');
  String get foodTypeString => mealFromFoodType(foodType).title;

  Future onDateTap() async {
    final _date = await AppChooser.date(
      navigator.context,
      initial: date,
    );
    if (_date == null) return;
    date = _date;
    loadDiary();
    notifyListeners();
  }

  Future onTimeTap() async {
    final time = await AppChooser.time(
      navigator.context,
      initial: TimeOfDay.fromDateTime(date),
    );
    if (time == null) return;
    date = Jiffy(date)
        .startOf(Units.DAY)
        .add(Duration(hours: time.hour, minutes: time.minute));
    notifyListeners();
  }

  Future onFoodTypeTap() async {
    final meal = await AppChooser.meal(
      navigator.context,
      initial: mealFromFoodType(foodType),
    );
    if (meal == null) return;
    foodType = meal.toFoodType;
    loadContainer();
    notifyListeners();
  }

  Future<void> loadDiary() async {
    container = null;
    setBusy(true);
    day = await service.getDiary(date: date);
    if (day == null) {
      setBusy(false);
      return;
    }
    loadContainer();
    setBusy(false);
  }

  void loadContainer() {
    if (day == null) return;
    container = day.foodContainers?.isEmpty ?? true
        ? null
        : day.foodContainers.firstWhere(
            (element) => element.name.toLowerCase() == foodTypeString.toLowerCase(),
            orElse: () => null,
          );
    if (container == null) return;
    for (final product in container.products) {
      calorieTotal += product.calorie * product.amount;
      proteinTotal += product.protein * product.amount;
      fatTotal += product.fat * product.amount;
      carbTotal += product.carb * product.amount;
    }
    notifyListeners();
  }

  Future<void> addProducts() async {
    await navigator.push(PickProductRoute(FillProductDependency(
      day: day,
      foodType: foodType,
      date: date,
    )));
    diaryService.fetch();
  }

  @override
  void errorRequest([int errorStatus]) {}

  Future<void> onReady() async {
    loadDiary();
  }

  Future<void> cancel() async {
    final res = await showDialog(
      context: navigator.context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text('Удалить запись?'),
          content: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Запись «$foodTypeString, $dateString $timeString» будет удалена безвозвратно.',
            ),
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
    await service.deleteContainer(day, container);
    navigator.pop();
    diaryService.fetch();
  }

  void save() {
    navigator.pop();
  }

  Future<void> onProductTap(DiaryProduct product) async {
    await navigator.push(FillProductRoute(FillProductDependency(
      day: day,
      productEdit: product,
    )));
    diaryService.fetch();
    loadDiary();
  }

  Future<void> onProductDelete(DiaryProduct product) async {
    final res = await showDialog(
      context: navigator.context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text('Удалить продукт?'),
          content: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text('Продукт «${product.name}» будет удален безвозвратно.'),
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
    service.deleteProduct(day, product.id);
    diaryService.fetch();
  }
}
