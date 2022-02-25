import 'package:chopper_api/api/swagger_api.swagger.dart';

extension ChartsTypeExtension on ChartsType {
  String get name {
    switch (this) {
      case ChartsType.weight:
        return "Фактический вес";
      case ChartsType.plan:
        return "Вес по плану";
      case ChartsType.ideal:
        return "Идеальный вес";
      case ChartsType.chest:
        return "Обхват груди";
      case ChartsType.underchest:
        return "Обхват под грудью";
      case ChartsType.waist:
        return "Обхват талии";
      case ChartsType.stomach:
        return "Обхват живота";
      case ChartsType.hips:
        return "Обхват бедер";
      case ChartsType.biceps:
        return "Обхват бицепса";
      case ChartsType.arm:
        return "Обхват предплечья";
      case ChartsType.wrist:
        return "Обхват запястья";
      case ChartsType.thigh:
        return "Обхват бедра";
      case ChartsType.knee:
        return "Обхват над коленом";
      case ChartsType.calf:
        return "Обхват голени";
      case ChartsType.ankle:
        return "Обхват щиколотки";
      case ChartsType.neck:
        return "Обхват шеи";
      case ChartsType.clothes:
        return "Размер одежды";
      case ChartsType.jeans:
        return "Размер джинсов";
      case ChartsType.bmi:
        return "Индекс массы тела";
      case ChartsType.mr:
        return "Обмен веществ";
      case ChartsType.fatcalc:
        return "% жира (расчеты)";
      case ChartsType.fatmeasure:
        return "% жира (замеры)";
      case ChartsType.age:
        return "Метабол. возраст";
      default:
        return toString();
    }
  }
}
