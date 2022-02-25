import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:notfiguured/utils/chooser.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddMeasurementViewModel extends AppViewModel {
  final MeasurementType measurementType;
  DateTime date;
  MeasurementsService measurementsService;

  AddMeasurementViewModel(BuildContext context, this.measurementType, this.date)
      : super(context) {
    measurementsService = context.read<MeasurementsService>();
    service = context.read<DiaryService>();
  }

  DateTime selectedDate;
  double newValue = 0.0;
  DiaryService service;

  void onReady() {
    selectedDate = date;
  }

  double get currentValue =>
      measurementType.getValue(measurementsService.repository.current.val);
  String get currentValueInUnits =>
      measurementType.getValueInUnits(measurementsService.repository.current.val);

  Future selectDate() async {
    final res = await AppChooser.date(
      navigator.context,
      initial: selectedDate,
      lastDay: DateTime.now(),
    );
    if (res != null) {
      selectedDate = res;
      notifyListeners();
    }
  }

  void onValueChanged(String value) {
    newValue = double.tryParse(value) ?? newValue;
  }

  void save() {
    makeRequest(
      makeRequest: () async {
        await measurementsService.save(
          measurementType,
          newValue,
          date: selectedDate,
        );
        await measurementsService.fetch();
      },
      finalFunc: () {
        navigator.pop(true);
      },
    );
    service.fetch();
  }

  @override
  void errorRequest([int errorStatus]) {
    // TODO: implement errorRequest
  }
}
