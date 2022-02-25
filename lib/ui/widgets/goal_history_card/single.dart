import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/data/model/custom_spot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:notfiguured/app/breakpoints.dart';

class SingleHistoryCard extends StatelessWidget {
  const SingleHistoryCard({
    @required this.date,
    @required this.spot,
    @required this.color,
    @required this.units,
    this.title,
    this.difference,
    Key key,
  }) : super(key: key);

  final DateTime date;
  final CustomSpot spot;
  final Color color;
  final String title;
  final String units;
  final double difference;

  @override
  Widget build(BuildContext context) {
    final newDifference = difference ?? ((spot?.normal ?? 0.0) - (spot?.data ?? 0.0)).floor();
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: AppBorderRadius.historyCard,
        boxShadow: [AppShadows.easy],
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: Jiffy(date).format('d MMM '),
                    style: [
                      AppStylesSmall.body3Medium,
                      AppStylesBig.body3Medium,
                    ].byHeight,
                  ),
                  TextSpan(
                    text: Jiffy(date).year.toString(),
                    style: [
                      AppStylesSmall.body3Medium,
                      AppStylesBig.body3Medium,
                    ].byHeight.copyWith(color: AppColors.greyB8),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                if (title?.isNotEmpty ?? false) ...[
                  Text(
                    '$title:',
                    style: [
                      AppStylesSmall.body3Medium,
                      AppStylesBig.body3Medium,
                    ].byHeight.copyWith(color: AppColors.greyB8),
                  ),
                  const SizedBox(width: 15),
                ],
                Text(
                  '${spot.data ?? 0} $units',
                  style: [
                    AppStylesSmall.body3Medium,
                    AppStylesBig.body3Medium,
                  ].byHeight.copyWith(color: color),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 7),
                    if (newDifference != 0)
                      SvgPicture.asset(
                        newDifference > 0 ? 'assets/icons/up.svg' : 'assets/icons/down.svg',
                      )
                    else
                      const SizedBox(height: 7),
                  ],
                ),
                const SizedBox(width: 7),
                Column(
                  children: [
                    Text(
                      '${newDifference.abs()} $units',
                      style: [
                        AppStylesSmall.body3Medium,
                        AppStylesBig.body3Medium,
                      ].byHeight.copyWith(color: AppColors.greyB8),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
