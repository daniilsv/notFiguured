import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPickerButton extends StatelessWidget {
  const DataPickerButton({
    @required this.text,
    @required this.type,
    Key key,
    this.value,
    this.onPressed,
    this.color = AppColors.black,
  }) : super(key: key);
  final String text;
  final double value;
  final String type;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        padding: const EdgeInsets.only(
          top: 34,
          bottom: 30,
          left: 28,
          right: 28,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: [
                AppStylesSmall.button1SemiBold,
                AppStylesBig.button1SemiBold,
              ].byWidth.copyWith(color: color),
            ),
            SizedBox(
              width: 76,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (value ?? 50.0).toStringAsFixed(1),
                        style: [
                          AppStylesSmall.button1SemiBold,
                          AppStylesBig.button1SemiBold
                        ].byWidth.copyWith(color: color),
                      ),
                      Text(
                        type,
                        style: [
                          AppStylesSmall.button1SemiBold,
                          AppStylesBig.button1SemiBold
                        ].byWidth.copyWith(color: AppColors.greyDC),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greyED,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
