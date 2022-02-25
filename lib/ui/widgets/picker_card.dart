import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerCard extends StatelessWidget {
  const PickerCard({
    @required this.title,
    this.value = '',
    Key key,
    this.onPressed,
    this.error,
    this.fullValueText = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final String value;
  final String error;
  final bool fullValueText;
  @override
  Widget build(BuildContext context) {
    Widget valueText = Text(
      value,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.end,
      style: [
        AppStylesSmall.button1SemiBold,
        AppStylesBig.button1SemiBold,
      ].byHeight.copyWith(color: AppColors.greyB8),
    );
    if (fullValueText != true)
      valueText = ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 150),
        child: valueText,
      );
    return Column(
      children: [
        Padding(
          padding: AppPaddings.v5,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: AppBorderRadius.calculatorCard,
              color: Colors.white,
              boxShadow: [AppShadows.easy],
            ),
            child: CupertinoButton(
              onPressed: onPressed,
              color: Colors.transparent,
              disabledColor: Colors.transparent,
              pressedOpacity: 0.7,
              borderRadius: BorderRadius.zero,
              minSize: 0,
              padding: AppPaddings.v35h30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: [
                      AppStylesSmall.button1SemiBold,
                      AppStylesBig.button1SemiBold,
                    ].byHeight.copyWith(color: AppColors.black),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .05),
                  Flexible(
                    child: valueText,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                error,
                style: [
                  AppStylesSmall.body3Regular,
                  AppStylesBig.body3Regular,
                ].byHeight.copyWith(color: AppColors.error),
              ),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ],
    );
  }
}
