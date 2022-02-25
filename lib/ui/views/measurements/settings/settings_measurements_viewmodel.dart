import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

class SettingsMeasurementsViewModel extends BaseViewModel {
  MeasurementsService measurementsService;
  NavigatorState navigator;
  Set<MeasurementType> selectedMeasurements = <MeasurementType>{};

  SettingsMeasurementsViewModel(BuildContext context) {
    measurementsService = context.read<MeasurementsService>();
    navigator = Navigator.of(context);

    selectedMeasurements = measurementsService.repository.viewedMeasurements.val;
  }

  bool hasMeasurement(MeasurementType measure) =>
      selectedMeasurements.any((el) => el == measure);

  void changeSet(MeasurementType measure, {bool value = false}) {
    if (value)
      selectedMeasurements.add(measure);
    else
      selectedMeasurements.remove(measure);
    notifyListeners();
  }

  void save() {
    measurementsService.repository.viewedMeasurements.val = selectedMeasurements;
    navigator.pop();
  }
}
