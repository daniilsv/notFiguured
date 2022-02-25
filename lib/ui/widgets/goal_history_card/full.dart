import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/data/model/macronutrition_history_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:notfiguured/app/breakpoints.dart';

class FullHistoryCard extends StatelessWidget {
  const FullHistoryCard({
    @required this.historyItem,
    Key key,
  }) : super(key: key);

  final MacronutritionHistoryItemModel historyItem;

  @override
  Widget build(BuildContext context) {
    final spots = [
      historyItem.protein,
      historyItem.fat,
      historyItem.carbon,
    ];
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
                    text: Jiffy(historyItem.date).format('d MMM '),
                    style: [
                      AppStylesSmall.body3Medium,
                      AppStylesBig.body3Medium,
                    ].byHeight,
                  ),
                  TextSpan(
                    text: Jiffy(historyItem.date).year.toString(),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    3,
                    (index) => Column(
                      children: [
                        if (index != 0) const SizedBox(height: 10),
                        Text(
                          '${['Б', 'Ж', 'У'][index]}:',
                          style: [
                            AppStylesSmall.body3Medium,
                            AppStylesBig.body3Medium,
                          ].byHeight.copyWith(color: AppColors.greyB8),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    3,
                    (index) => Column(
                      children: [
                        if (index != 0) const SizedBox(height: 10),
                        Text(
                          '${spots[index].data ?? 0} г',
                          style: [
                            AppStylesSmall.body3Medium,
                            AppStylesBig.body3Medium,
                          ].byHeight.copyWith(
                                color: [
                                  AppColors.blue,
                                  AppColors.lightPink,
                                  AppColors.yellow,
                                ][index],
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    3,
                    (index) {
                      final spot = spots[index];
                      final diff = ((spot?.normal ?? 0.0) - (spot?.data ?? 0.0)).floor();
                      return Column(
                        children: [
                          SizedBox(height: index == 0 ? 7 : 21),
                          if (diff != 0)
                            SvgPicture.asset(
                              diff > 0 ? 'assets/icons/up.svg' : 'assets/icons/down.svg',
                            )
                          else
                            const SizedBox(height: 7),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    3,
                    (index) {
                      final spot = spots[index];
                      final diff =
                          ((spot?.normal ?? 0) - (spot?.data ?? 0)).floor().abs();
                      return Column(
                        children: [
                          if (index != 0) const SizedBox(height: 10),
                          Text(
                            '$diff г',
                            style: [
                              AppStylesSmall.body3Medium,
                              AppStylesBig.body3Medium,
                            ].byHeight.copyWith(color: AppColors.greyB8),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
