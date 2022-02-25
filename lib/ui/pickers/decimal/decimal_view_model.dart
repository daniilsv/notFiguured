import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class DecimalPickerViewModel extends BaseViewModel {
  DecimalPickerViewModel(
    BuildContext context, {
    double initialValue,
    this.minValue,
    this.addMinValue,
  }) {
    navigator = Navigator.of(context);
    result = addMinValue ? initialValue - minValue : initialValue;
    numberController =
        FixedExtentScrollController(initialItem: (initialValue - minValue).truncate());
    decimalController = FixedExtentScrollController(
      initialItem:
          (((initialValue - minValue) - (initialValue - minValue).truncate()) * 10)
              .round(),
    );
  }
  NavigatorState navigator;
  double result;
  double minValue;
  bool addMinValue;
  FixedExtentScrollController numberController;
  FixedExtentScrollController decimalController;

  void onSelectedNumber(num value) {
    result = value + result - result.truncate();
    notifyListeners();
  }

  void onSelectedDecimal(num value) {
    result = value * 0.1 + result.truncate();
    notifyListeners();
  }

  void onSelected(num value) {
    result = value;
    notifyListeners();
  }

  void cancel() => navigator.pop();
  void done() => navigator.pop((addMinValue ? minValue : 0) + result);
}
