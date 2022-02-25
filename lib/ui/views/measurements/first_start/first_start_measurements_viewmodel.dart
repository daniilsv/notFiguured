import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

//TODO: смержить эту вью модель с родительской
class FirsStartMeasurementsViewModel extends BaseViewModel {
  MeasurementsService measurementsService;
  NavigatorState navigator;
  Set<MeasurementType> selectedMeasurements = <MeasurementType>{};

  FirsStartMeasurementsViewModel(BuildContext context) {
    measurementsService = context.read<MeasurementsService>();
    navigator = Navigator.of(context);
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
  }
}
