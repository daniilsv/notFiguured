import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class CaloriesDetailGoalCard extends StatelessWidget {
  const CaloriesDetailGoalCard({
    @required this.title,
    @required this.value,
    this.valueColor = AppColors.black,
    Key key,
  }) : super(key: key);

  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [AppShadows.easy],
        borderRadius: AppBorderRadius.smallCard,
      ),
      child: Padding(
        padding: const EdgeInsets.all(22).copyWith(top: 16),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const AppTextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.greyB8,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    value ?? '',
                    style: [
                      AppStylesSmall.headline1Bold,
                      AppStylesBig.headline1Bold,
                    ].byHeight.copyWith(color: valueColor),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  'ккал',
                  style: [
                    AppStylesSmall.body1SemiBold,
                    AppStylesBig.body1SemiBold,
                  ].byHeight,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
