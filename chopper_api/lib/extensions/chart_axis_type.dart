import 'package:chopper_api/api/swagger_api.swagger.dart';

extension ChartsAxisTypeExtension on ChartsAxisType {
  String get name {
    switch (this) {
      case ChartsAxisType.date:
        return "дата";
      case ChartsAxisType.kg:
        return "масса (кг)";
      case ChartsAxisType.number:
        return "просто число";
      case ChartsAxisType.percent:
        return "доля %";
      case ChartsAxisType.sm:
        return "размер (см)";
      default:
        return toString();
    }
  }
}
