import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';

import 'detail_goal_item.dart';

class MacronutritionDetailGoalCard extends StatelessWidget {
  const MacronutritionDetailGoalCard({
    @required this.items,
    Key key,
  }) : super(key: key);

  final List<MacronutritionDetailGoalItem> items;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [AppShadows.easy],
          borderRadius: AppBorderRadius.smallCard,
        ),
        child: Padding(
          padding: const EdgeInsets.all(22).copyWith(top: 16),
          child: Column(
            children: items,
          ),
        ),
      ),
    );
  }
}
