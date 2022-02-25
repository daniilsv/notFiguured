import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductDismissibleCard extends StatelessWidget {
  const ProductDismissibleCard({
    @required this.product,
    @required this.onTap,
    @required this.onDelete,
  });

  final DiaryProduct product;
  final void Function(DiaryProduct product) onTap;
  final void Function(DiaryProduct product) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(product.id),
      actionPane: const SlidableBehindActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: [
        IconSlideAction(
          //CupertinoIcons.minus_circle_fill
          iconWidget: const Icon(Icons.close, color: Colors.red),
          onTap: () => onDelete(product),
        ),
      ],
      child: CupertinoButton(
        onPressed: () => onTap(product),
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
                      product.name,
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
                    Utils.getMassStr(product.amount),
                    style: [
                      AppStylesBig.body3Regular,
                      AppStylesSmall.body3Regular,
                    ].byHeight,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MacronutritionStrip(
                calories: product.calorie * product.amount,
                protein: product.protein * product.amount,
                fat: product.fat * product.amount,
                carb: product.carb * product.amount,
                colored: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
