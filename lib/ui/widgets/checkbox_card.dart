import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxCard extends StatelessWidget {
  const CheckboxCard({
    @required this.title,
    Key key,
    this.value = false,
    this.color = AppColors.primary,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final Color color;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.v5,
      child: CupertinoButton(
        color: AppColors.white,
        disabledColor: AppColors.white,
        onPressed: onPressed,
        pressedOpacity: 0.7,
        minSize: 0,
        padding: EdgeInsets.zero,
        borderRadius: AppBorderRadius.calculatorCard,
        child: Container(
          constraints: const BoxConstraints(minHeight: 70),
          padding: AppPaddings.v15h25,
          child: Row(
            children: [
              Checkbox(
                value: value,
                activeColor: color,
                onChanged: (_) => onPressed?.call(),
              ),
              Expanded(
                child: Text(
                  title,
                  style: [
                    AppStylesSmall.body3Medium,
                    AppStylesBig.body3Medium,
                  ].byWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
