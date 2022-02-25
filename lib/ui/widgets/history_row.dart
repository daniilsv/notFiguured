import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:jiffy/jiffy.dart';

class HistoryRow extends StatelessWidget {
  final DateTime date;
  final Color color;

  const HistoryRow(
    this.date, {
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: Jiffy(date).format("dd LLLL"),
          style: [AppStylesSmall.body3Medium, AppStylesBig.body3Medium]
              .byHeight
              .copyWith(color: color ?? AppColors.text),
          children: [
            const TextSpan(text: " "),
            TextSpan(
                text: Jiffy(date).format("yyyy"),
                style: TextStyle(color: color ?? AppColors.grey87))
          ]),
    );
  }
}
