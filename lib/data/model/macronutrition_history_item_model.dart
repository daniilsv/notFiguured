import 'package:flutter/foundation.dart';

import 'custom_spot_model.dart';

class MacronutritionHistoryItemModel {
  DateTime date;
  CustomSpot protein;
  CustomSpot fat;
  CustomSpot carbon;

  MacronutritionHistoryItemModel({
    @required this.date,
    this.protein,
    this.fat,
    this.carbon,
  }) {
    protein ??= CustomSpot();
    fat ??= CustomSpot();
    carbon ??= CustomSpot();
  }

  void addValue(int index, {double data, double normal}) {
    switch (index) {
      case 0:
        protein.data = data ?? protein.data;
        protein.normal = normal ?? protein.normal;
        break;
      case 1:
        fat.data = data ?? fat.data;
        fat.normal = normal ?? fat.normal;
        break;
      case 2:
        carbon.data = data ?? carbon.data;
        carbon.normal = normal ?? carbon.normal;
        break;
      default:
    }
  }
}
