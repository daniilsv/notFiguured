import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notfiguured/app/breakpoints.dart';

class HistoryLegend extends StatelessWidget {
  const HistoryLegend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          ...[
            AppImages.upperArrow,
            AppImages.downerArrow,
          ]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.greyF3,
                      borderRadius: AppBorderRadius.c4,
                    ),
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: Center(
                        child: SvgPicture.asset(e),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          Text(
            '— отклонение от прогноза',
            style: [
              AppStylesSmall.body3Regular,
              AppStylesBig.body3Regular,
            ].byHeight.copyWith(color: AppColors.greyB8),
          ),
        ],
      ),
    );
  }
}
