import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalMacronutritionCard extends StatelessWidget {
  const GoalMacronutritionCard({
    this.index,
    this.target,
    this.currentP,
    this.currentF,
    this.currentC,
    this.onTap,
  });
  final int index;
  final TargetMacroModel target;
  final double currentP;
  final double currentF;
  final double currentC;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Widget left, right;
    left = Column(
      children: [
        CircularPercentIndicator(
          radius: 90,
          lineWidth: 8,
          percent: (currentP / target.protein).clamp(0.0, 1.0),
          center: CircularPercentIndicator(
            radius: 70,
            lineWidth: 8,
            percent: (currentF / target.fat).clamp(0.0, 1.0),
            center: CircularPercentIndicator(
              radius: 50,
              lineWidth: 8,
              percent: (currentC / target.carbon).clamp(0.0, 1.0),
              backgroundColor: AppColors.greyF3,
              progressColor: AppColors.yellow,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            backgroundColor: AppColors.greyF3,
            progressColor: AppColors.lightPink,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          backgroundColor: AppColors.greyF3,
          progressColor: AppColors.blue,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ],
    );
    right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text:
                    Utils.numToFixStr(currentP, 1),
                style: [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold]
                    .byHeight
                    .copyWith(color: AppColors.blue)),
            TextSpan(
                text: '/${Utils.numToFixStr(target.protein, 1)} %',
                style: [AppStylesSmall.body1SemiBold, AppStylesBig.body1SemiBold]
                    .byHeight
                    .copyWith(color: AppColors.blue)),
          ]),
        ),
        Text('Белков',
            style: [AppStylesSmall.inputs2TitleRegular, AppStylesBig.inputs2TitleRegular]
                .byHeight
                .copyWith(color: AppColors.greyB8)),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: Utils.numToFixStr(currentF, 1),
                style: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.lightPink)),
            TextSpan(
                text: '/${Utils.numToFixStr(target.fat, 1)} %',
                style: [
                  AppStylesSmall.body1SemiBold,
                  AppStylesBig.body1SemiBold,
                ].byHeight.copyWith(color: AppColors.lightPink)),
          ]),
        ),
        Text('Жиров',
            style: [
              AppStylesSmall.inputs2TitleRegular,
              AppStylesBig.inputs2TitleRegular,
            ].byHeight.copyWith(color: AppColors.greyB8)),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: Utils.numToFixStr(currentC, 1),
                style: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.yellow)),
            TextSpan(
                text: '/${Utils.numToFixStr(target.carbon, 1)} %',
                style: [
                  AppStylesSmall.body1SemiBold,
                  AppStylesBig.body1SemiBold,
                ].byHeight.copyWith(color: AppColors.yellow)),
          ]),
        ),
        Text('Углеводов',
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
              padding: const EdgeInsets.only(top: 3, bottom: 14),
              child: Row(
                children: [
                  Text(
                    Strings.current.control_macronutrition,
                    style: [
                      AppStylesSmall.headline2Bold,
                      AppStylesBig.headline2Bold,
                    ].byHeight.copyWith(color: AppColors.black),
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
                const SizedBox(width: 59),
                right,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
