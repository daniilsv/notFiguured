import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary_food/widgets/product.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:supercharged/supercharged.dart';

class FoodContainerWidget extends StatelessWidget {
  final FoodContainer data;
  final void Function(DiaryProduct product) onProductTap;

  const FoodContainerWidget(
    this.data, {
    Key key,
    this.onProductTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calorieSum = data.products.sumByDouble(
      (e) => e.amount * e.portionWeight * e.calorie,
    );
    final proteinSum = data.products.sumByDouble(
      (e) => e.amount * e.portionWeight * e.protein,
    );
    final fatSum = data.products.sumByDouble(
      (e) => e.amount * e.portionWeight * e.fat,
    );
    final carbSum = data.products.sumByDouble(
      (e) => e.amount * e.portionWeight * e.carb,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.name,
                    style: [
                      AppStylesBig.body2SemiBold,
                      AppStylesSmall.body2SemiBold,
                    ].byHeight,
                  ),
                  Text(
                    data.time ?? "",
                    style: [
                      AppStylesBig.body2SemiBold,
                      AppStylesSmall.body2SemiBold,
                    ].byHeight,
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              ...data.products
                  .mapIndexed(
                    (currentValue, index) => Column(
                      children: [
                        if (index > 0 && index < data.products.length) const Divider(),
                        CupertinoButton(
                          onPressed: () => onProductTap(data.products[index]),
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          child: ProductWidget(data.products[index]),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              const Divider(),
              MacronutritionStrip(
                calories: calorieSum,
                protein: proteinSum,
                fat: fatSum,
                carb: carbSum,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
