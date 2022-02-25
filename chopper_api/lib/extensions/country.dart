import 'package:chopper_api/api/swagger_api.swagger.dart';

extension CountryExtension on MicronutrientCountry {
  String get localize => _localeCountryMap[this];
  String get toApiString => $CountryMap[this];
}

extension CountryStringExtension on String {
  String get localizeCountry => _sexStringLocalize[this];
}

const _localeCountryMap = {
  MicronutrientCountry.russia: 'Россия',
  MicronutrientCountry.canada: 'Канада',
  MicronutrientCountry.uk: 'Великобритания',
  MicronutrientCountry.usa: 'США',
  MicronutrientCountry.swaggerGeneratedUnknown: ''
};

const _sexStringLocalize = {
  'russia': 'Россия',
  'canada': 'Канада',
  'uk': 'Великобритания',
  'USA': 'США',
  'swaggerGeneratedUnknown': '',
};

const $CountryMap = {
  MicronutrientCountry.russia: 'Russia',
  MicronutrientCountry.canada: 'Canada',
  MicronutrientCountry.uk: 'UK',
  MicronutrientCountry.usa: 'USA',
  MicronutrientCountry.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};
