import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExerciseDismissibleCard extends StatelessWidget {
  const ExerciseDismissibleCard({
    @required this.exercise,
    @required this.onTap,
    @required this.onDelete,
    this.userWeight,
  });

  final DiaryDayExercise exercise;
  final void Function(DiaryDayExercise exercise) onTap;
  final void Function(DiaryDayExercise exercise) onDelete;
  final double userWeight;

  @override
  Widget build(BuildContext context) {
    final hintStyle = [AppStylesSmall.body3Medium, AppStylesBig.body3Medium]
        .byHeight
        .copyWith(color: AppColors.greyB8);
    return Slidable(
      key: ValueKey(exercise.id),
      actionPane: const SlidableBehindActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: [
        IconSlideAction(
          //CupertinoIcons.minus_circle_fill
          iconWidget: const Icon(Icons.close, color: Colors.red),
          onTap: () => onDelete(exercise),
        ),
      ],
      child: CupertinoButton(
        onPressed: () => onTap(exercise),
        minSize: 0,
        padding: EdgeInsets.zero,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            borderRadius: AppBorderRadius.historyCard,
            color: AppColors.greyF3,
            boxShadow: [AppShadows.easy],
          ),
          child: Column(
            children: [
              Row(
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
                    style: [
                      AppStylesBig.body3Regular,
                      AppStylesSmall.body3Regular,
                    ].byHeight,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Сжигается за час тренировки:',
                      style: hintStyle,
                    ),
                  ),
                  Text(
                    '-${Utils.getKaloriesStr(exercise.calories * exercise.amount / 60 * (userWeight ?? 1))}',
                    style: hintStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
