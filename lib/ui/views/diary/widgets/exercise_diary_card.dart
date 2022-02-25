import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/material.dart';

class ExerciseDiaryCard extends StatelessWidget {
  const ExerciseDiaryCard({
    this.today,
    this.onTap,
  });

  final double today;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: AppPaddings.v10h20,
        child: Container(
          padding: AppPaddings.all20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [AppShadows.easy],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Strings.current.exercise_diary,
                style:
                    [AppStylesBig.headline2Bold, AppStylesSmall.headline2Bold].byHeight,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${Strings.current.today_burn}:",
                    style: [AppStylesBig.body3Medium, AppStylesSmall.body3Medium]
                        .byHeight
                        .copyWith(color: AppColors.greyB8),
                  ),
                  Text(
                    Utils.getKaloriesStr(today),
                    style: [AppStylesBig.body3Medium, AppStylesSmall.body3Medium]
                        .byHeight
                        .copyWith(color: AppColors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
