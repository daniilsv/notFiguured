import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter/material.dart';

class ValueMeasureCard extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;
  final bool withColon;
  final VoidCallback onPressed;

  const ValueMeasureCard({
    @required this.label,
    @required this.value,
    this.valueColor = AppColors.black,
    this.withColon = true,
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trailingSize = [32.0, 32.0].byHeight;
    return Padding(
      padding: AppPaddings.v5,
      child: CupertinoButton(
        color: AppColors.white,
        disabledColor: AppColors.white,
        pressedOpacity: 0.7,
        onPressed: onPressed ?? () {},
        minSize: 0,
        padding: AppPaddings.v35h30,
        borderRadius: AppBorderRadius.calculatorCard,
        child: Row(
          children: [
            Text(
              withColon ? "$label:" : label,
              style: [
                AppStylesSmall.button1SemiBold,
                AppStylesBig.button1SemiBold,
              ].byHeight.copyWith(color: AppColors.text),
            ),
            const Spacer(),
            Text(
              value ?? "",
              style: [
                AppStylesSmall.button1SemiBold,
                AppStylesBig.button1SemiBold,
              ].byHeight.copyWith(color: valueColor),
            ),
            Visibility(
              visible: onPressed != null,
              replacement: SizedBox(width: trailingSize),
              child: SizedBox(
                width: trailingSize,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.greyDC,
                  size: trailingSize / 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
