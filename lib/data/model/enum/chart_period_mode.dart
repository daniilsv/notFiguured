import 'package:notfiguured/l10n/generated/l10n.dart';

enum ChartPeriodMode {
  month,
  week,
  all,
}

extension ChartPeriodModeExt on ChartPeriodMode {
  String get name {
    if (this == ChartPeriodMode.week)
      return Strings.current.chart_period_week;
    else if (this == ChartPeriodMode.month)
      return Strings.current.chart_period_month;
    else
      return Strings.current.chart_period_all;
  }
}
