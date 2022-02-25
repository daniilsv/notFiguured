import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/data/repository/measurements_repository.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';

import 'auth_service.dart';

class MeasurementsService implements OnAuthListener {
  MeasurementsService(this.repository, this._authService, this._api) {
    _authService.addAuthListener(this);
  }

  final MeasurementsRepository repository;
  final AuthService _authService;
  final Api _api;

  Future<void> fetch() async {
    final res = await _api.api.v1MeasureGetMeasurePost(
      date: DateTime.now().toString(),
      body: null,
    );
    repository.current.val = res.body;
  }

  Future<MeasureModel> getByDate(DateTime date) async {
    final res = await _api.api.v1MeasureGetMeasurePost(date: date.toString(), body: null);
    return res.body;
  }

  Future<MeasureModel> save(
    MeasurementType measurementType,
    double value, {
    DateTime date,
  }) async {
    final res = await _api.api.v1MeasureSaveMeasurePost(
        body: measurementType
            .toMeasureModel(value)
            .copyWith(localDate: date, utcDate: date));
    return res.body;
  }

  ///в какие дни замеры были сделаны
  Future<List<DateTime>> whenMeasuresWhereTaken(DateTime from, DateTime to) async {
    final res = await _api.api
        .v1MeasureGetMeasuresPost(body: RequestByDatesModel(fromDate: from, toDate: to));
    return res.body.map((e) => e.localDate).toList();
  }

  @override
  void onExit() {
    repository.clean();
  }

  @override
  void onUser(UserProfileModel user) {
    fetch();
  }
}
