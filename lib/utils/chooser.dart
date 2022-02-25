import 'dart:io';

import 'package:notfiguured/data/model/enum/meal_type.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/pickers/country/country_android.dart';
import 'package:notfiguured/ui/pickers/country/country_ios.dart';
import 'package:notfiguured/ui/pickers/date/date_ios.dart';
import 'package:notfiguured/ui/pickers/decimal/decimal_view.dart';
import 'package:notfiguured/ui/pickers/meal/meal_ios.dart';
import 'package:notfiguured/ui/pickers/sex/sex_android.dart';
import 'package:notfiguured/ui/pickers/sex/sex_ios.dart';
import 'package:notfiguured/ui/views/activity_level/activity_level_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

abstract class AppChooser {
  static Future<Sex> sex(BuildContext context) async {
    if (Platform.isIOS)
      return showCupertinoModalPopup<Sex>(
        context: context,
        builder: (context) => const SexCupertinoActionSheet(),
      );
    else
      return showModalBottomSheet<Sex>(
        context: context,
        builder: (context) => const SexBottomSheetPicker(),
      );
  }

  static Future<MicronutrientCountry> country(BuildContext context) async {
    if (Platform.isIOS)
      return showCupertinoModalPopup<MicronutrientCountry>(
        context: context,
        builder: (context) => CountryCupertinoActionSheet(),
      );
    else
      return showModalBottomSheet<MicronutrientCountry>(
        context: context,
        builder: (context) => CountryBottomSheetPicker(),
      );
  }

  static Future<DateTime> dateOfBirth(BuildContext context) async {
    if (Platform.isIOS)
      return showModalBottomSheet(
        context: context,
        builder: (context) => IosDatePicker(
          currentDate: DateTime.now(),
        ),
      );
    else
      return showDatePicker(
        context: context,
        firstDate: DateTime(1920),
        initialDate: DateTime(1990),
        lastDate: DateTime.now(),
        cancelText: Strings.current.cancel,
        confirmText: Strings.current.done,
        currentDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.year,
      );
  }

  static Future<DateTime> date(BuildContext context,
      {DateTime initial, DateTime lastDay}) async {
    if (Platform.isIOS)
      return showModalBottomSheet(
        context: context,
        builder: (context) => IosDatePicker(
          currentDate: initial ?? DateTime.now(),
        ),
      );
    else
      return showDatePicker(
        context: context,
        firstDate: DateTime(1920),
        initialDate: initial ?? DateTime.now(),
        lastDate: lastDay ?? 7.days.fromNow(),
        cancelText: Strings.current.cancel,
        confirmText: Strings.current.done,
      );
  }

  static Future<TimeOfDay> time(BuildContext context, {TimeOfDay initial}) async {
    //TODO: добавить iOS picker
    return showTimePicker(context: context, initialTime: initial);
  }

  static Future<MealType> meal(BuildContext context, {MealType initial}) async {
    //TODO: добавить Android picker
    return showCupertinoDialog<MealType>(
      context: context,
      barrierDismissible: true,
      builder: (context) => MealCupertinoPicker(initial: initial),
    );
  }

  static Future<Activity> activity(BuildContext context, {Color mainColor}) async =>
      Navigator.of(context).push<Activity>(ActivityLevelRoute(mainColor: mainColor));

  static Future<double> weight(BuildContext context, {double initial, Sex sex}) async {
    double initValue;
    if (initial == null)
      switch (sex) {
        case Sex.male:
          initValue = 89;
          break;
        case Sex.female:
          initValue = 75;
          break;
        default:
          initValue = 78;
      }
    else
      initValue = initial;

    return showDecimalPicker(
      context,
      title: Strings.current.weight,
      suffixText: Strings.current.kg,
      minValue: 20,
      maxValue: 220,
      initialValue: initValue ?? 60,
    );
  }

  static Future<double> growth(BuildContext context, {double initial}) async =>
      showDecimalPicker(
        context,
        title: Strings.current.growth,
        suffixText: Strings.current.sm,
        minValue: 120,
        maxValue: 220,
        initialValue: initial ?? 150,
      );
}
