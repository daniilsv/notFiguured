import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCreateDialog extends StatelessWidget {
  const MainCreateDialog({
    @required this.onEditTap,
    @required this.onNewTap,
    @required this.prevGoalText,
    @required this.goalImage,
    @required this.haveGoalText,
    Key key,
    this.primary,
    this.primaryDark,
  }) : super(key: key);
  final VoidCallback onEditTap;
  final VoidCallback onNewTap;
  final Widget prevGoalText;
  final String goalImage;
  final String haveGoalText;
  final Color primary;
  final Color primaryDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 58,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    top: 15,
                  ),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: Navigator.of(context).pop,
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.greyB8,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      goalImage,
                      height: 32.5,
                      width: 32.5,
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Создание новой цели',
                      style: [
                        AppStylesSmall.body1SemiBold,
                        AppStylesBig.body1SemiBold,
                      ].byHeight,
                    ),
                    const SizedBox(height: 19),
                    Text(
                      haveGoalText,
                      style: [
                        AppStylesSmall.body3Regular,
                        AppStylesBig.body3Regular,
                      ].byHeight.copyWith(color: AppColors.grey87),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 13),
                    prevGoalText,
                    const SizedBox(height: 13),
                    Text(
                      '''
                      Создание новой цели приведет к 
удалению текущей. 

Вы можете отредактировать 
текущую цель, возможно это решит 
Вашу задачу.''',
                      style: [
                        AppStylesSmall.body3Regular,
                        AppStylesBig.body3Regular,
                      ].byHeight.copyWith(color: AppColors.grey87),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    AppButton(
                      text: 'Отредактировать',
                      color: AppColors.greyF3,
                      colorDark: AppColors.greyDC,
                      style: AppStylesBig.inputs1Regular,
                      onPressed: onEditTap,
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      text: 'Создать новую цель',
                      color: primary ?? AppColors.primary,
                      colorDark: primaryDark ?? AppColors.primaryDark,
                      onPressed: onNewTap,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
