import 'package:notfiguured/l10n/generated/l10n.dart';

enum ConsumeMode { byDay, byMeal }

extension ConsumeModeExt on ConsumeMode {
  String get name {
    if (this == ConsumeMode.byDay)
      return Strings.current.consume_mode_by_day;
    else
      return Strings.current.consume_mode_by_meal;
  }
}
