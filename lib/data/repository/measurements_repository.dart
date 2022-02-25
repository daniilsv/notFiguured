import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:get_storage/get_storage.dart';

class MeasurementsRepository {
  ///те замеры, которые отображаются на странице замеров
  final viewedMeasurements = ReadWriteValue<Set<MeasurementType>>(
    'viewedMeasurements',
    <MeasurementType>{},
    encoder: (model) => model?.toString(),
    decoder: (str) {
      if (str == null) return <MeasurementType>{};
      final Set<MeasurementType> res = <MeasurementType>{};
      for (final type in MeasurementType.values) {
        if ((str as String).contains(type.toString())) res.add(type);
      }
      return res;
    },
  );

  ///текущие замеры
  final current = ReadWriteValue<MeasureModel>(
    'currentMeasurements',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : MeasureModel.fromJson(json),
  );

  void clean() {
    viewedMeasurements.val = null;
    current.val = null;
    print('MeasurementsRepository clean');
  }
}
