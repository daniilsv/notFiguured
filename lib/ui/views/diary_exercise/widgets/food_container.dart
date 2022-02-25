import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary_food/widgets/product.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:supercharged/supercharged.dart';

class FoodContainerWidget extends StatelessWidget {
  final FoodContainer data;

  const FoodContainerWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    style: [AppStylesBig.body2SemiBold, AppStylesSmall.body2SemiBold]
                        .byHeight,
                  ),
                  Text(
                    data.time ?? "",
                    style: [AppStylesBig.body2SemiBold, AppStylesSmall.body2SemiBold]
                        .byHeight,
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              ...data.products
                  .mapIndexed((currentValue, index) => Column(
                        children: [
                          if (index > 0 && index < data.products.length) const Divider(),
                          ProductWidget(data.products[index]),
                        ],
                      ))
                  .toList(),
              const Divider(),
              MacronutritionStrip(
                calories: data.products
                    .sumByDouble((e) => e.amount * e.portionWeight * e.calorie),
                protein: data.products
                    .sumByDouble((e) => e.amount * e.portionWeight * e.protein),
                fat: data.products.sumByDouble((e) => e.amount * e.portionWeight * e.fat),
                carb:
                    data.products.sumByDouble((e) => e.amount * e.portionWeight * e.carb),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
