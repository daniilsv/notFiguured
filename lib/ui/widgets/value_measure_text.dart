import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter/cupertino.dart';

class ValueMeasureText extends StatelessWidget {
  final String value;
  final String label;
  final TextAlign textAlign;
  final bool withNewLine;
  final TextStyle valueTextStyle;
  final Color valueColor;
  final bool reversed;

  const ValueMeasureText({
    this.value,
    this.label,
    this.textAlign = TextAlign.center,
    this.withNewLine = false,
    this.valueTextStyle,
    this.valueColor = AppColors.text,
    this.reversed = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vStyle = valueTextStyle ??
        [
          AppStylesSmall.headline2Bold,
          AppStylesBig.headline2Bold,
        ].byHeight;

    final valueTxt = TextSpan(
      text: value,
      style: vStyle.copyWith(color: valueColor),
    );

    final space = TextSpan(text: withNewLine ? "\n" : " ");

    final labelTxt = TextSpan(
      text: label,
      style: const TextStyle(
        height: 1.5,
        inherit: false,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
        color: AppColors.greyB8,
      ),
    );

    return RichText(
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
      text: TextSpan(
        children: reversed ? [labelTxt, space, valueTxt] : [valueTxt, space, labelTxt],
      ),
    );
  }
}
