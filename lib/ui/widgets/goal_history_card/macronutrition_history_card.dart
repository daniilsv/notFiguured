import 'package:notfiguured/data/model/enum/history_type.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/data/model/macronutrition_history_item_model.dart';
import 'package:flutter/material.dart';

import 'full.dart';
import 'single.dart';

class MacronutritionHistoryCard extends StatelessWidget {
  const MacronutritionHistoryCard({
    @required this.historyItem,
    @required this.historyType,
    Key key,
  }) : super(key: key);

  final MacronutritionHistoryItemModel historyItem;
  final HistoryType historyType;

  @override
  Widget build(BuildContext context) {
    switch (historyType) {
      case HistoryType.all:
        return FullHistoryCard(
          historyItem: historyItem,
        );
      case HistoryType.protein:
        return SingleHistoryCard(
          date: historyItem.date,
          spot: historyItem.protein,
          color: AppColors.blue,
          title: 'Б',
          units: 'г',
        );
        break;
      case HistoryType.fat:
        return SingleHistoryCard(
          date: historyItem.date,
          spot: historyItem.fat,
          color: AppColors.lightPink,
          title: 'Ж',
          units: 'г',
        );
      case HistoryType.carbon:
        return SingleHistoryCard(
          date: historyItem.date,
          spot: historyItem.carbon,
          color: AppColors.yellow,
          title: 'У',
          units: 'г',
        );
      default:
        return Container();
    }
  }
}
