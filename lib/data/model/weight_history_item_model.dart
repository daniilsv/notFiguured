import 'package:flutter/foundation.dart';

import 'custom_spot_model.dart';

class WeightHistoryItemModel {
  DateTime date;
  CustomSpot spot;

  WeightHistoryItemModel({
    @required this.date,
    this.spot,
  }) {
    spot ??= CustomSpot();
  }

  void addValue({double data, double normal}) {
    spot.data = data ?? spot.data;
    spot.normal = normal ?? spot.normal;
  }
}
