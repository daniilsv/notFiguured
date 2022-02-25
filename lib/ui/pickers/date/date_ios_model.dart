import 'package:stacked/stacked.dart';

class IosDatePickerModel extends BaseViewModel {
  DateTime selectedDate;

  void onDateChanged(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
