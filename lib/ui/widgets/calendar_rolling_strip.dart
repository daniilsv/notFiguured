import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:supercharged/supercharged.dart';

class CalendarRollingStrip extends StatefulWidget {
  const CalendarRollingStrip({
    @required this.from,
    @required this.to,
    @required this.value,
    @required this.onChange,
    this.markedDates,
    this.markerRadius = 3.0,
    this.accentColor = AppColors.blue,
    this.height = 70.0,
    Key key,
  }) : super(key: key);

  final DateTime from;
  final DateTime to;
  final Color accentColor;
  final DateTime value;
  final Function(DateTime value) onChange;
  final List<DateTime> markedDates;
  final double markerRadius;
  final double height;

  @override
  _CalendarRollingStripState createState() => _CalendarRollingStripState();
}

class _CalendarRollingStripState extends State<CalendarRollingStrip> {
  DateTime from;
  DateTime value;
  DateTime to;
  List<DateTime> dates;
  bool hasMarkerStrip;
  double size;
  double markedStripHeight;

  TextStyle regAccent;
  TextStyle regGreyDC;
  TextStyle medAccent;
  TextStyle medGreyDC;

  final regText = [AppStylesSmall.inputs1Regular, AppStylesBig.inputs1Regular]
      .byWidth
      .copyWith(color: AppColors.text);
  final medText = [AppStylesSmall.body3Medium, AppStylesBig.body3Medium]
      .byWidth
      .copyWith(color: AppColors.text);

  @override
  void didUpdateWidget(CalendarRollingStrip oldWidget) {
    if (widget.from != oldWidget.from ||
        widget.to != oldWidget.to ||
        widget.accentColor != oldWidget.accentColor ||
        widget.value != oldWidget.value ||
        widget.onChange != oldWidget.onChange ||
        widget.markedDates != oldWidget.markedDates ||
        widget.markerRadius != oldWidget.markerRadius ||
        widget.height != oldWidget.height) {
      calculate();
    }
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  void calculate() {
    from = Jiffy(widget.from).startOf(Units.DAY);
    value = Jiffy(widget.value).startOf(Units.DAY);
    to = Jiffy(widget.to).endOf(Units.DAY);
    dates = from.rangeTo(to).toList();
    hasMarkerStrip = widget.markedDates?.isNotEmpty ?? false;
    size = hasMarkerStrip ? widget.height * 0.8 / 2 : widget.height / 2;
    markedStripHeight = widget.height * 0.2;
  }

  @override
  void initState() {
    calculate();
    regAccent = regText.copyWith(color: widget.accentColor);
    regGreyDC = regText.copyWith(color: AppColors.greyDC);
    medAccent = medText.copyWith(color: widget.accentColor);
    medGreyDC = medText.copyWith(color: AppColors.greyDC);
    super.initState();
  }

  bool isMarked(DateTime selectedDate) {
    for (final DateTime date in widget.markedDates ?? []) {
      if (Jiffy(selectedDate).startOf(Units.DAY) == date)
        return true;
      else if (selectedDate.isBetween(
        Jiffy(date).startOf(Units.DAY),
        Jiffy(date).endOf(Units.DAY),
      )) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: size,
              color: AppColors.white,
            ),
          ),
          Positioned.fill(
            top: size,
            child: Container(
              height: size,
              color: AppColors.greyF3,
            ),
          ),
          if (hasMarkerStrip)
            Positioned.fill(
              top: 2 * size,
              child: Container(
                height: markedStripHeight,
                color: AppColors.white,
              ),
            ),
          SizedBox(
            height: widget.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (BuildContext context, int i) {
                final date = dates[dates.length - 1 - i];
                TextStyle regStyle = regText;
                TextStyle medStyle = medText;
                if (date == value) {
                  regStyle = regAccent;
                  medStyle = medAccent;
                } else if (date.isAfter(DateTime.now())) {
                  regStyle = regGreyDC;
                  medStyle = medGreyDC;
                }
                if (dates.length - 2 - i < 0 ||
                    date.month != dates[dates.length - 2 - i].month)
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (i != dates.length - 1)
                        Container(
                          width: 5,
                          color: AppColors.white,
                        ),
                      GestureDetector(
                        onTap: () => widget.onChange(date),
                        child: Column(
                          children: [
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 2 * size,
                              height: size - 4,
                              child: Center(
                                child: Text(date.year.toString(), style: medText),
                              ),
                            ),
                            SizedBox(
                              width: 2 * size,
                              height: size,
                              child: Container(
                                color: Colors.white,
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(bottom: 4, left: 2, right: 2),
                                  decoration: BoxDecoration(
                                    color: AppColors.greyF3,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(size)),
                                  ),
                                  alignment: Alignment.center,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      Jiffy(date).MMMM,
                                      style: regText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DayItemWidget(
                        date: date,
                        hasMarkerStrip: hasMarkerStrip,
                        isMarked: isMarked,
                        markedStripHeight: markedStripHeight,
                        markerRadius: widget.markerRadius,
                        medStyle: medStyle,
                        onChange: widget.onChange,
                        regStyle: regStyle,
                        size: size,
                        value: value,
                      )
                    ],
                  );
                return DayItemWidget(
                  date: date,
                  hasMarkerStrip: hasMarkerStrip,
                  isMarked: isMarked,
                  markedStripHeight: markedStripHeight,
                  markerRadius: widget.markerRadius,
                  medStyle: medStyle,
                  onChange: widget.onChange,
                  regStyle: regStyle,
                  size: size,
                  value: value,
                  hasNextMonth: i != 0 && date.month != dates[dates.length - i].month,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DayItemWidget extends StatelessWidget {
  const DayItemWidget({
    @required this.value,
    @required this.date,
    @required this.onChange,
    @required this.size,
    @required this.regStyle,
    @required this.medStyle,
    @required this.hasMarkerStrip,
    @required this.isMarked,
    @required this.markedStripHeight,
    @required this.markerRadius,
    this.hasNextMonth = false,
    Key key,
  }) : super(key: key);

  final DateTime value;
  final DateTime date;
  final Function(DateTime value) onChange;
  final double size;
  final TextStyle regStyle;
  final TextStyle medStyle;
  final bool hasMarkerStrip;
  final bool Function(DateTime date) isMarked;
  final double markedStripHeight;
  final double markerRadius;
  final bool hasNextMonth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (value != date && date.isBefore(DateTime.now())) onChange(date);
      },
      child: Column(
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Text(
                Jiffy(date).E,
                style: regStyle,
              ),
            ),
          ),
          if (hasNextMonth)
            SizedBox(
              width: size,
              height: size,
              child: Container(
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyF3,
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(size)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: medStyle,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              width: size,
              height: size,
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: medStyle,
                ),
              ),
            ),
          if (hasMarkerStrip && isMarked(date))
            SizedBox(
              width: size,
              height: markedStripHeight,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(markerRadius),
                  ),
                  child: SizedBox(
                    height: markerRadius * 2,
                    width: markerRadius * 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
