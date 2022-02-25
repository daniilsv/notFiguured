import 'dart:async';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/services/food_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fill_product_view.dart';

class FillProductViewModel extends AppViewModel {
  FillProductViewModel(BuildContext context) : super(context) {
    final dependency = context.read<FillProductDependency>();
    product = dependency.productEdit ??
        DiaryProduct(
          foodType: dependency.foodType,
          productId: dependency.product?.id,
          calorie: dependency.product?.calorie,
          protein: dependency.product?.protein,
          fat: dependency.product?.fat,
          carb: dependency.product?.carbon,
          name: dependency.product?.name,
          portionSizeId: dependency.product?.portionSizeId,
        );

    day = dependency.day ?? DiaryDayModel(date: dependency.date);
    controller = TextEditingController(text: product.amount?.toInt()?.toString() ?? '100');
    controller.addListener(notifyListeners);
    service = context.read<FoodService>();
  }

  DiaryDayModel day;
  FoodService service;

  DiaryDayModel foodEventModel;
  DiaryProduct product;
  TextEditingController controller;
  bool get isEdit => product.id != null;

  Future<void> onReady() async {}

  Future<void> onDeleteTap() async {
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
    await service.deleteProduct(day, product.id);
    navigator.pop();
  }

  Future<void> onSaveTap() async {
    product = product.copyWith(amount: double.tryParse(controller.text) ?? 0.0);
    if (isEdit)
      await service.updateProduct(day, product);
    else
      await service.createProduct(product, day: day);
    navigator.pop(product);
  }

  @override
  void errorRequest([int errorStatus]) {}
}
