import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/data/model/calories_calc.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/hard_level.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/property_value.dart';

class CaloriesGoalCardView extends StatelessWidget {
  final CaloriesCalcLevel data;
  final double weightGoal;
  final int variantIndex;
  final Color mainColor;
  final Function(CaloriesCalcLevel data) addToGoal;

  const CaloriesGoalCardView({
    @required this.data,
    @required this.weightGoal,
    @required this.variantIndex,
    this.addToGoal,
    this.mainColor = AppColors.green,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.greyF3,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.current.variant_index(variantIndex),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: AppColors.grey87,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.scenarioId.name,
                style: [
                  AppStylesSmall.headline2Bold,
                  AppStylesBig.headline2Bold,
                ].byHeight,
              ),
              HardLevel(data.scenarioId.level),
            ],
          ),
          const Divider(),
          Column(
            children: [
              PropertyValue(
                "${Strings.current.goal}:",
                Utils.getMassStr(
                  weightGoal * 1000,
                  0,
                  true,
                ),
              ),
              PropertyValue(
                "${Strings.current.consuming}:",
                Strings.current.measure_kkal_per_day(
                  Utils.numberToString(
                    data.calories,
                    0,
                  ),
                ),
              ),
              PropertyValue(
                "${Strings.current.will_lose}:",
                Strings.current.measure_gram_per_week(
                  Utils.numberToString(
                    data.weeklyKgLoss * 1000,
                    0,
                  ),
                ),
              ),
              PropertyValue(
                "${Strings.current.reach_goal}:",
                Strings.current.by_count_days(
                  data.daysCount,
                ),
              ),
            ],
          ),
          if (addToGoal != null) const Spacer(),
          if (addToGoal != null)
            AppButton(
              onPressed: () => addToGoal(data),
              text: Strings.current.add_goal,
              color: mainColor,
              colorDark: mainColor,
            ),
        ],
      ),
    );
  }
}
