import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.enums.swagger.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';

enum MeasurementType {
  ///вес
  weightMass,

  ///процент жира
  fatPercent,

  ///обхват шеи
  neckGirth,

  ///обхват груди
  chestGirth,

  ///обхват под грудью
  underChestGirth,

  ///обхват талии
  waistGirth,

  ///обхват живота
  stomachGirth,

  ///обхват бицепса
  bicepsGirth,

  ///обхват предплечья
  forearmGirth,

  ///обхват запястья
  wristGirth,

  ///обхват бёдер
  hipsGirth,

  ///обхват бедра
  thighGirth,

  ///обхват над коленом
  kneeGirth,

  ///обхват голени
  calfGirth,

  ///обхват щиколотки
  ankleGirth,
}

extension MeasurementTypeExtension on MeasurementType {
  String get name {
    switch (this) {
      case MeasurementType.weightMass:
        return Strings.current.weight;
      case MeasurementType.fatPercent:
        return Strings.current.fat_percent;
      case MeasurementType.neckGirth:
        return Strings.current.girth_neck;
      case MeasurementType.chestGirth:
        return Strings.current.girth_chest;
      case MeasurementType.underChestGirth:
        return Strings.current.girth_under_chest;
      case MeasurementType.waistGirth:
        return Strings.current.girth_waist;
      case MeasurementType.stomachGirth:
        return Strings.current.girth_stomach;
      case MeasurementType.bicepsGirth:
        return Strings.current.girth_biceps;
      case MeasurementType.forearmGirth:
        return Strings.current.girth_forearm;
      case MeasurementType.wristGirth:
        return Strings.current.girth_wrist;
      case MeasurementType.hipsGirth:
        return Strings.current.girth_hips;
      case MeasurementType.thighGirth:
        return Strings.current.girth_thigh;
      case MeasurementType.kneeGirth:
        return Strings.current.girth_upper_knee;
      case MeasurementType.calfGirth:
        return Strings.current.girth_calf;
      case MeasurementType.ankleGirth:
        return Strings.current.girth_ankle;
      default:
        return toString();
    }
  }

  ChartsType get toChartType {
    switch (this) {
      case MeasurementType.weightMass:
        return ChartsType.weight;
      case MeasurementType.fatPercent:
        return ChartsType.fatmeasure;
      case MeasurementType.neckGirth:
        return ChartsType.neck;
      case MeasurementType.chestGirth:
        return ChartsType.chest;
      case MeasurementType.underChestGirth:
        return ChartsType.underchest;
      case MeasurementType.waistGirth:
        return ChartsType.waist;
      case MeasurementType.stomachGirth:
        return ChartsType.stomach;
      case MeasurementType.bicepsGirth:
        return ChartsType.biceps;
      case MeasurementType.forearmGirth:
        return ChartsType.arm;
      case MeasurementType.wristGirth:
        return ChartsType.wrist;
      case MeasurementType.hipsGirth:
        return ChartsType.hips;
      case MeasurementType.thighGirth:
        return ChartsType.thigh;
      case MeasurementType.kneeGirth:
        return ChartsType.knee;
      case MeasurementType.calfGirth:
        return ChartsType.calf;
      case MeasurementType.ankleGirth:
        return ChartsType.ankle;
      default:
        return ChartsType.swaggerGeneratedUnknown;
    }
  }

  double getValue(MeasureModel model) {
    if (model == null) return 0;
    switch (this) {
      case MeasurementType.weightMass:
        return model.weight;
      case MeasurementType.fatPercent:
        return model.fatPercent;
      case MeasurementType.neckGirth:
        return model.neck;
      case MeasurementType.chestGirth:
        return model.chest;
      case MeasurementType.underChestGirth:
        return model.underChest;
      case MeasurementType.waistGirth:
        return model.waist;
      case MeasurementType.stomachGirth:
        return model.stomach;
      case MeasurementType.bicepsGirth:
        return model.biceps;
      case MeasurementType.forearmGirth:
        return model.forearm;
      case MeasurementType.wristGirth:
        return model.wrist;
      case MeasurementType.hipsGirth:
        return model.hips;
      case MeasurementType.thighGirth:
        return model.thigh;
      case MeasurementType.kneeGirth:
        return model.knee;
      case MeasurementType.calfGirth:
        return model.calf;
      case MeasurementType.ankleGirth:
        return model.ankle;
      default:
        return .0;
    }
  }

  String getValueInUnits(MeasureModel model) {
    switch (this) {
      case MeasurementType.weightMass:
        return Utils.getMassStr(model?.weight == null ? 0 : model.weight * 1000, 1, true);
      case MeasurementType.fatPercent:
        return Utils.getPercentStr(
            model?.fatPercent == null ? 0 : model.fatPercent / 100);
      case MeasurementType.neckGirth:
        return Utils.getGirthStr(model?.neck == null ? 0 : model.neck / 100);
      case MeasurementType.chestGirth:
        return Utils.getGirthStr(model?.chest == null ? 0 : model.chest / 100);
      case MeasurementType.underChestGirth:
        return Utils.getGirthStr(model?.underChest == null ? 0 : model.underChest / 100);
      case MeasurementType.waistGirth:
        return Utils.getGirthStr(model?.waist == null ? 0 : model.waist / 100);
      case MeasurementType.stomachGirth:
        return Utils.getGirthStr(model?.stomach == null ? 0 : model.stomach / 100);
      case MeasurementType.bicepsGirth:
        return Utils.getGirthStr(model?.biceps == null ? 0 : model.biceps / 100);
      case MeasurementType.forearmGirth:
        return Utils.getGirthStr(model?.forearm == null ? 0 : model.forearm / 100);
      case MeasurementType.wristGirth:
        return Utils.getGirthStr(model?.wrist == null ? 0 : model.wrist / 100);
      case MeasurementType.hipsGirth:
        return Utils.getGirthStr(model?.hips == null ? 0 : model.hips / 100);
      case MeasurementType.thighGirth:
        return Utils.getGirthStr(model?.thigh == null ? 0 : model.thigh / 100);
      case MeasurementType.kneeGirth:
        return Utils.getGirthStr(model?.knee == null ? 0 : model.knee / 100);
      case MeasurementType.calfGirth:
        return Utils.getGirthStr(model?.calf == null ? 0 : model.calf / 100);
      case MeasurementType.ankleGirth:
        return Utils.getGirthStr(model?.ankle == null ? 0 : model.ankle / 100);
      default:
        return "--";
    }
  }

  MeasureModel toMeasureModel(double value) {
    switch (this) {
      case MeasurementType.weightMass:
        return MeasureModel(weight: value);
      case MeasurementType.fatPercent:
        return MeasureModel(fatPercent: value);
      case MeasurementType.neckGirth:
        return MeasureModel(neck: value);
      case MeasurementType.chestGirth:
        return MeasureModel(chest: value);
      case MeasurementType.underChestGirth:
        return MeasureModel(underChest: value);
      case MeasurementType.waistGirth:
        return MeasureModel(waist: value);
      case MeasurementType.stomachGirth:
        return MeasureModel(stomach: value);
      case MeasurementType.bicepsGirth:
        return MeasureModel(biceps: value);
      case MeasurementType.forearmGirth:
        return MeasureModel(forearm: value);
      case MeasurementType.wristGirth:
        return MeasureModel(wrist: value);
      case MeasurementType.hipsGirth:
        return MeasureModel(hips: value);
      case MeasurementType.thighGirth:
        return MeasureModel(thigh: value);
      case MeasurementType.kneeGirth:
        return MeasureModel(knee: value);
      case MeasurementType.calfGirth:
        return MeasureModel(calf: value);
      case MeasurementType.ankleGirth:
        return MeasureModel(ankle: value);
      default:
        return MeasureModel();
    }
  }

  String get units {
    switch (this) {
      case MeasurementType.weightMass:
        return Strings.current.kg;
      case MeasurementType.fatPercent:
        return "%";
      default:
        return Strings.current.sm;
    }
  }

  ChartsAxisType get valueAxisType {
    switch (this) {
      case MeasurementType.weightMass:
        return ChartsAxisType.kg;
      case MeasurementType.fatPercent:
        return ChartsAxisType.percent;
      default:
        return ChartsAxisType.sm;
    }
  }
}
