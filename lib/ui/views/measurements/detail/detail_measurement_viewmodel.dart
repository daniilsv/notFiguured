import 'package:notfiguured/app/logger.dart';
import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:notfiguured/ui/views/goal_control/goal_control_viewmodel.dart';
import 'package:notfiguured/ui/views/measurements/add/add_measurement_view.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.enums.swagger.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DetailMeasurementViewModel extends GoalControlViewModel {
  final MeasurementType measurementType;
  DateTime date;
  MeasurementsService measurementsService;

  DetailMeasurementViewModel(BuildContext context, this.measurementType, this.date)
      : super(context,
            xAxis: ChartsAxisType.date,
            yAxis: measurementType.valueAxisType,
            plots: [measurementType.toChartType]) {
    measurementsService = context.read<MeasurementsService>();
    selectedDate = date;
  }

  MeasureModel currentMeasure;
  double newValue = 0.0;
  TextEditingController controller = TextEditingController();

  ChartPlot get mainPlot => chart?.plots?.firstWhere(
        (el) => el.name == measurementType.toChartType,
        orElse: () => null,
      );
  ChartAddition get planPlot => mainPlot.chartAdditions.firstWhere(
        (el) => el.name == ChartsAdditionType.prediction,
        orElse: () => null,
      );
  double get currentValue => measurementType
      .getValue(currentMeasure ?? measurementsService.repository.current.val);

  double get _lastValue =>
      (mainPlot?.spots?.isNotEmpty ?? false) ? mainPlot.spots[0].y : 0;
  String get lastValueString => unitString(_lastValue);

  void onValueChanged(String value) {
    newValue = double.tryParse(value) ?? newValue;
  }

  @override
  Future<void> addRecord() async {
    await navigator.push(AddMeasurementRoute(measurementType));
    await onReady();
  }

  @override
  void edit() {}

  @override
  Future loadMeasure() async {
    currentMeasure = await measurementsService.getByDate(selectedDate);
    controller.clear();
    controller.text = Utils.numToFixStr(currentValue, 1) ?? '';
  }

  void updateTextEditingController() {
    controller = TextEditingController(text: controller?.text ?? '');
  }

  @override
  DateTime get maxRollingDate => DateTime.now();

  @override
  DateTime get minRollingDate => historyStartDate.compareTo(DateTime.now().subtract(const Duration(days: 60))) < 0 ? historyStartDate : DateTime.now().subtract(const Duration(days: 60));

  @override
  Future<void> onReady() async {
    makeRequest(
      makeRequest: () => Future.wait(
        [
          measurementsService
              .whenMeasuresWhereTaken(
                minRollingDate,
                maxRollingDate,
              )
              .then((value) => markedDates = value),
          super.onReady(),
        ],
      ),
    );
    updateTextEditingController();
    newValue = currentValue;
    notifyListeners();
  }

  Future loadChart() async {
    chartIsBusy = true;
    notifyListeners();
    try {
      final response = await api.api.v1MeasureGetMeasuresChartDataPost(
        body: MeasureChartDataRequestModel(
          fromDate: fromDate,
          toDate: toDate,
          chartTypes: plots ?? [],
        ),
      );
      chart = response.body.firstWhere(
        (el) => el.xAxisType == xAxis && el.yAxisType == yAxis,
        orElse: () => null,
      );
      historyStartDate = DateTime.fromMillisecondsSinceEpoch(chart.plots.first.spots
              .reduce((curr, next) => curr.x < next.x ? curr : next)
              .x
              .toInt() *
          1000);
      notifyListeners();
    } on Exception catch (ex) {
      logger.e(ex.toString());
    } finally {
      chartIsBusy = false;
      notifyListeners();
    }
  }

  @override
  void saveMeasurement() => makeRequest(
        makeRequest: () async {
          FocusScope.of(context).unfocus();
          await measurementsService.save(
            measurementType,
            newValue,
            date: selectedDate,
          );
          await onReady();
        },
      );

  @override
  int get historyLength => mainPlot?.spots?.length ?? 0;

  // @override
  // DateTime get historyStartDate => mainPlot == null || (mainPlot?.spots?.isEmpty ?? true)
  //     ? DateTime.now()
  //     : DateTime.fromMillisecondsSinceEpoch(mainPlot.spots.last.x.toInt());

  String unitString(double value) {
    switch (measurementType) {
      case MeasurementType.weightMass:
        return Utils.getMassStr(value * 1000, 1, true);
      case MeasurementType.fatPercent:
        return Utils.getPercentStr(value / 100);
      case MeasurementType.neckGirth:
      case MeasurementType.chestGirth:
      case MeasurementType.underChestGirth:
      case MeasurementType.waistGirth:
      case MeasurementType.stomachGirth:
      case MeasurementType.bicepsGirth:
      case MeasurementType.forearmGirth:
      case MeasurementType.wristGirth:
      case MeasurementType.hipsGirth:
      case MeasurementType.thighGirth:
      case MeasurementType.kneeGirth:
      case MeasurementType.calfGirth:
      case MeasurementType.ankleGirth:
        return Utils.getGirthStr(value / 100);
      default:
        return '';
    }
  }
}
