import 'dart:async';

import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/ui/views/diary_food/fill_product/fill_product_view.dart';
import 'package:notfiguured/utils/debouncer.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class PickProductViewModel extends AppViewModel {
  PickProductViewModel(BuildContext context, this.dep) : super(context) {
    _keyboardSub = KeyboardVisibilityController().onChange.listen(
      (bool visible) {
        keyboardVisible = visible;
        notifyListeners();
      },
    );
  }

  final FillProductDependency dep;
  final TextEditingController searchController = TextEditingController();
  final List<ProductSimpleModel> lastProducts = <ProductSimpleModel>[];
  final List<ProductSimpleModel> foundProducts = <ProductSimpleModel>[];
  StreamSubscription _keyboardSub;
  bool keyboardVisible = false;

  bool get isEmptyList =>
      (keyboardVisible && foundProducts.isEmpty ||
          !keyboardVisible && lastProducts.isEmpty) &&
      searchController.text.isEmpty;
  bool get productsNotFound =>
      keyboardVisible && foundProducts.isEmpty && searchController.text.isNotEmpty;
  bool get showLastProducts =>
      !keyboardVisible && foundProducts.isEmpty && lastProducts.isNotEmpty;

  Future<void> onReady() async {
    final debouncer = Debouncer<String>(
      const Duration(milliseconds: 500),
      searchProducts,
    );
    searchController.addListener(() {
      debouncer.value = searchController.text.trim();
    });
    await runBusyFuture(
      loadLastProducts(),
    );
  }

  Future<void> loadLastProducts() async {
    final res = await api.api.v1DiaryGetDiaryPost(
      body: RequestByDatesModel(
        fromDate: DateTime.fromMillisecondsSinceEpoch(0),
        toDate: DateTime.now(),
      ),
    );
    if (res.isSuccessful) {
      final products = <ProductSimpleModel>{};

      bool filled = false;
      for (final day in res.body) {
        for (final container in day.foodContainers) {
          if (container.products.isNotEmpty) {
            products.addAll(container.products.map((e) => e.toSimple));
            if (products.length >= 4) {
              filled = true;
              break;
            }
          }
        }
        if (filled) break;
      }
      lastProducts.clear();
      lastProducts.addAll(products.take(4));
    }
  }

  Future<void> searchProducts(String name) async {
    if (name.isEmpty) {
      foundProducts.clear();
      return notifyListeners();
    }
    final res = await api.api.v1FoodFindProductPost(
      body: ProductSearchModel(
        name: name,
        currentPage: 1,
        pageSize: 100,
      ),
    );
    if (res.isSuccessful) {
      foundProducts.clear();
      foundProducts.addAll(
        res.body.where(
          (p) => p.portionSizeId != null && p.portionSizeId != 0,
        ),
      );
      notifyListeners();
    }
  }

  Future<void> onProductTap(ProductSimpleModel product) async {
    final result = await navigator.push(
      FillProductRoute(
        dep..product = product,
      ),
    );
    if (result == null) return;
    navigator.pop();
  }

  @override
  void dispose() {
    _keyboardSub?.cancel();
    super.dispose();
  }

  @override
  void errorRequest([int errorStatus]) {}
}
