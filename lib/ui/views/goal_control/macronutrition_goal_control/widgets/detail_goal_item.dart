import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class MacronutritionDetailGoalItem extends StatelessWidget {
  const MacronutritionDetailGoalItem({
    @required this.title,
    @required this.value,
    this.valueColor = AppColors.black,
    this.withDivider = true,
    Key key,
  }) : super(key: key);

  final String title;
  final String value;
  final Color valueColor;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const AppTextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.greyB8,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: [
            AppStylesSmall.headline1Bold,
            AppStylesBig.headline1Bold,
          ].byHeight.copyWith(color: valueColor),
        ),
        if (withDivider) ...[
          const SizedBox(height: 22),
          Container(
            color: AppColors.greyF3,
            width: double.infinity,
            height: 1,
          ),
          const SizedBox(height: 27),
        ],
      ],
    );
  }
}
