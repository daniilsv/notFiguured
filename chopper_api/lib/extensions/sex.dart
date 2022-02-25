import 'package:chopper_api/api/swagger_api.swagger.dart';

extension SexExtension on Sex {
  String get localize => _localeSexMap[this];
  String get toApiString => _sexMap[this];
}

extension SexStringExtension on String {
  String get localizeSex => _sexStringLocalize[this];
}

const _localeSexMap = {
  Sex.no: 'Не указано',
  Sex.female: 'Женский',
  Sex.male: 'Мужской',
  Sex.swaggerGeneratedUnknown: '',
};

const _sexMap = {
  Sex.no: 'No',
  Sex.female: 'Female',
  Sex.male: 'Male',
  Sex.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown',
};

const _sexStringLocalize = {
  'No': 'Не указано',
  'Female': 'Женский',
  'Male': 'Мужской',
  'swaggerGeneratedUnknown': '',
};
