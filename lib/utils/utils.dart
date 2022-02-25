import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:package_info/package_info.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

/// - получение строковых размеров
///
///Все размерности в аргументах должны быть передаваться в
///международной системе СИ. В ином же случае рекомендуется в
///момент вызова функции аргумент привести в систему СИ.
///
///Например `Utils.getMassStr(kg58 * 1000)`
class Utils {
  static void showFunctionInDevelopSnack(BuildContext context) {
    showTopSnackBar(
      context,
      const CustomSnackBar.info(message: "Функция в разработке"),
    );
  }

  static String numberToString(num number, [int fractionDigits = 1]) {
    return number.toStringAsFixed(fractionDigits).replaceAll('.', ',');
  }

  ///объём
  static String getVolumeStr(num liters, [int fractionDigits = 1]) {
    if (liters.abs() < 0.5)
      return Strings.current.measure_milliliters_short((liters * 1000).round());
    else
      return Strings.current.measure_liters_short(numberToString(liters, fractionDigits));
  }

  ///масса
  // ignore: avoid_positional_boolean_parameters
  static String getMassStr(num grams, [int fractionKgDigits = 1, bool forceKg]) {
    if (grams.abs() < 500 && forceKg != true)
      return Strings.current.measure_gram_short(grams.round());
    else if (grams.abs() < 1000)
      return Strings.current.measure_kilogram_short(numberToString(grams / 1000));
    else
      return Strings.current
          .measure_kilogram_short(numberToString(grams / 1000, fractionKgDigits));
  }

  ///масса значения бжу
  static String getBjuStr(num grams) {
    if (grams.abs() < 1000)
      return Strings.current.measure_gram_short(numToFixStr(grams, 1));
    else
      return Strings.current.measure_kilogram_short(numToFixStr(grams / 1000, 1));
  }

  ///доля в процентах
  static String getPercentStr(num fraction, [int fractionDigits = 1]) {
    assert(fraction >= 0.0 && fraction <= 1.0);
    return "${numberToString(fraction * 100, fractionDigits)} %";
  }

  ///обхват в сантиметрах
  static String getGirthStr(num meters, [int fractionDigits = 1]) {
    return Strings.current.measure_girth(numberToString(meters * 100, fractionDigits));
  }

  ///энергия в килокалориях
  static String getKaloriesStr(num kalories, [int fractionDigits = 0]) {
    return "${numberToString(kalories, fractionDigits)} ${Strings.current.kK}";
  }

  static String numToFixStr(num number, [int maxFractionDigits = 2]) {
    if (number == null) return null;
    String str = '';
    if (number > 0 && number < 1) {
      str = number.toStringAsFixed(maxFractionDigits);
    } else {
      str = number
          .toStringAsFixed(maxFractionDigits)
          .replaceAll('0', ' ')
          .trim() //remove .X00
          .replaceAll(' ', '0')
          .replaceAll('.', ' ')
          .trim() //remove point in the end
          .replaceAll(' ', '.');
    }
    if (str.isEmpty) return '0';
    return str;
  }

  static String getDatePeriod(DateTime from, DateTime to) {
    final _from = from.isBefore(to) ? from : to;
    final _to = to.isAfter(from) ? to : from;

    if (_from.year != _to.year)
      return "${Jiffy(_from).format('yyyy')} - ${Jiffy(_to).format('yyyy')}";
    else if (_from.month != _to.month)
      return "${Jiffy(_from).MMMMd} - ${Jiffy(_to).MMMMd}";
    else
      return "${_from.day} - ${Jiffy(_to).MMMMd}";
  }

  static Future<String> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String version = packageInfo?.version ?? '';
    final String buildNumber = packageInfo?.buildNumber ?? '';
    return 'ver $version ($buildNumber)';
  }
}
