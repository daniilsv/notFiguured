import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalCaloriesCard extends StatelessWidget {
  GoalCaloriesCard({
    this.index,
    this.target,
    this.current,
    this.onTap,
    this.burned,
  }) : _progress = (current / (target.calories + burned));
  final int index;
  final TargetCalorieModel target;
  final double current;
  final double burned;
  final Function onTap;
  final double _progress;

  @override
  Widget build(BuildContext context) {
    Widget left, right;
    left = Column(
      children: [
        CircularPercentIndicator(
          radius: 90,
          lineWidth: 8,
          percent: _progress.clamp(0.0, 1.0),
          center: SvgPicture.asset(
            Assets.calories,
            height: 20,
            width: 20,
            color: AppColors.greyDC,
          ),
          backgroundColor: AppColors.greyF3,
          progressColor: AppColors.green,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        const SizedBox(height: 15),
        Text(
          '${(_progress * 100).clamp(0, 100).truncate()}%',
          style: [
            AppStylesSmall.body2SemiBold,
            AppStylesBig.body2SemiBold,
          ].byHeight,
        ),
        Text('Прогресс',
            style: [
              AppStylesSmall.inputs2TitleRegular,
              AppStylesBig.inputs2TitleRegular,
            ].byHeight.copyWith(color: AppColors.greyB8)),
      ],
    );
    right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: Utils.numToFixStr(current, 1),
                  style: [
                    AppStylesSmall.headline1Bold,
                    AppStylesBig.headline1Bold,
                  ].byHeight),
              TextSpan(
                  text: ' ${Strings.current.kkal}',
                  style: [
                    AppStylesSmall.body1SemiBold,
                    AppStylesBig.body1SemiBold,
                  ].byHeight),
            ],
          ),
        ),
        Text('Сегодня',
            style: [
              AppStylesSmall.inputs2TitleRegular,
              AppStylesBig.inputs2TitleRegular,
            ].byHeight.copyWith(color: AppColors.greyB8)),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: Utils.numToFixStr(target.calories, 1),
              style: [
                AppStylesSmall.headline1Bold,
                AppStylesBig.headline1Bold,
              ].byHeight,
            ),
            TextSpan(
              text: ' ${Strings.current.kkal}',
              style: [
                AppStylesSmall.body1SemiBold,
                AppStylesBig.body1SemiBold,
              ].byHeight,
            ),
          ]),
        ),
        Text('Норма',
            style: [
              AppStylesSmall.inputs2TitleRegular,
              AppStylesBig.inputs2TitleRegular,
            ].byHeight.copyWith(color: AppColors.greyB8)),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: Utils.numToFixStr(target.calories - current + burned, 1),
                style: [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold]
                    .byHeight
                    .copyWith(color: AppColors.green)),
            TextSpan(
                text: ' ${Strings.current.kkal}',
                style: [AppStylesSmall.body1SemiBold, AppStylesBig.body1SemiBold]
                    .byHeight
                    .copyWith(color: AppColors.green)),
          ]),
        ),
        Text('Осталось',
            style: [
              AppStylesSmall.inputs2TitleRegular,
              AppStylesBig.inputs2TitleRegular,
            ].byHeight.copyWith(color: AppColors.greyB8)),
      ],
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppPaddings.v10h20,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [AppShadows.easy],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Цель $index',
              style: [
                AppStylesSmall.inputs2TitleRegular,
                AppStylesBig.inputs2TitleRegular
              ].byHeight.copyWith(color: AppColors.grey87),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 3,
                bottom: 14,
              ),
              child: Row(
                children: [
                  Text(
                    Strings.current.control_calories,
                    style: [
                      AppStylesSmall.headline2Bold,
                      AppStylesBig.headline2Bold,
                    ].byHeight.copyWith(color: AppColors.green),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      color: AppColors.greyDC, size: 14),
                  const SizedBox(width: 13),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                left,
                const SizedBox(width: 32),
                right,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
