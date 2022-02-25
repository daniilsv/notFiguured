import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseSummaryCard extends StatelessWidget {
  const ExerciseSummaryCard({
    @required this.exercise,
    @required this.onTap,
    this.userWeight,
  });

  final DiaryDayExercise exercise;
  final void Function(DiaryDayExercise exercise) onTap;
  final double userWeight;

  @override
  Widget build(BuildContext context) {
    final hintStyle = [AppStylesSmall.body3Medium, AppStylesBig.body3Medium].byHeight;
    return CupertinoButton(
      onPressed: () => onTap(exercise),
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          borderRadius: AppBorderRadius.historyCard,
          color: AppColors.white,
          boxShadow: [AppShadows.easy],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                exercise.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: [
                  AppStylesBig.body3Medium,
                  AppStylesSmall.body3Medium,
                ].byHeight,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${exercise.amount.toInt()} м',
              style: hintStyle.copyWith(color: AppColors.greyB8),
            ),
            const SizedBox(width: 20),
            Text(
              '-${Utils.getKaloriesStr(exercise.calories * exercise.amount / 60 * (userWeight ?? 1))}',
              style: hintStyle.copyWith(color: AppColors.green),
            )
          ],
        ),
      ),
    );
  }
}
