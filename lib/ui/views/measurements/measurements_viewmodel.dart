import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:notfiguured/ui/views/measurements/detail/detail_measurement_view.dart';
import 'package:notfiguured/ui/views/measurements/settings/settings_measurements_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class MeasurementsViewModel extends AppViewModel {
  MeasurementsService measurementsService;

  MeasurementsViewModel(BuildContext context) : super(context) {
    measurementsService = context.read<MeasurementsService>();
    measurementsService.repository.viewedMeasurements.listen((_) => notifyListeners());
  }

  bool get hasChoosenMeasurements =>
      measurementsService.repository.viewedMeasurements.val.isNotEmpty;
  bool get hasNoChoosenMeasurements =>
      measurementsService.repository.viewedMeasurements.val.length <
      MeasurementType.values.length;
  Set<MeasurementType> get viewedMeasurements =>
      measurementsService.repository.viewedMeasurements.val;
  DateTime historyStartDate = DateTime.now().subtract(const Duration(days: 60));
  DateTime get minRollingDate =>
      historyStartDate.compareTo(DateTime.now().subtract(const Duration(days: 60))) < 0
          ? historyStartDate
          : DateTime.now().subtract(const Duration(days: 60));
  DateTime maxRollingDate = DateTime.now();

  MeasureModel _currentMeasurements;
  DateTime currentRollingDate = DateTime.now();
  List<DateTime> markedDates = <DateTime>[];

  MeasureModel get currentMeasurements =>
      _currentMeasurements ?? measurementsService.repository.current.val;

  void changeDate(DateTime date) {
    currentRollingDate = date;
    loadMeasure();
  }

  Future onReady() => makeRequest(makeRequest: () async {
        markedDates = await measurementsService.whenMeasuresWhereTaken(
            minRollingDate, maxRollingDate);
        historyStartDate = markedDates.last;
      });

  Future loadMeasure() => makeRequest(makeRequest: () async {
        _currentMeasurements = await measurementsService.getByDate(currentRollingDate);
      });

  Future<void> toDetailMeasurement(MeasurementType measurementType) async {
    await navigator.push(DetailMeasurementRoute(measurementType, currentRollingDate));
    await loadMeasure();
  }

  void toSettingsMeasurement() => navigator.push(SettingsMeasurementsRoute());

  @override
  void errorRequest([int errorStatus]) {
    // TODO: implement errorRequest
  }
}
