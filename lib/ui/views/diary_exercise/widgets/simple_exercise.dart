import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/searched_text.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleExerciseWidget extends StatelessWidget {
  const SimpleExerciseWidget({
    @required this.exercise,
    @required this.onTap,
    this.searchText,
    this.userWeight,
  });

  final ExerciseSimpleModel exercise;
  final void Function(ExerciseSimpleModel exercise) onTap;
  final String searchText;
  final double userWeight;

  @override
  Widget build(BuildContext context) {
    final hintStyle = [
      AppStylesSmall.body3Medium,
      AppStylesBig.body3Medium,
    ].byHeight.copyWith(color: AppColors.greyB8);
    return CupertinoButton(
      onPressed: () => onTap(exercise),
      minSize: 0,
      padding: EdgeInsets.zero,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: AppBorderRadius.historyCard,
          color: AppColors.greyF3,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchedText(
                fullText: exercise.name,
                searchValue: searchText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textStyle: [
                  AppStylesBig.body3Medium,
                  AppStylesSmall.body3Medium,
                ].byHeight,
                matchedStyle: [
                  AppStylesBig.body3Medium,
                  AppStylesSmall.body3Medium,
                ].byHeight.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Сжигается за час тренировки:',
                    style: hintStyle,
                  ),
                  Text(
                    '-${Utils.getKaloriesStr(exercise.caloriesPerKg * (userWeight ?? 1))}',
                    style: hintStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
