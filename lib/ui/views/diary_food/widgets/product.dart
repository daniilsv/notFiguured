import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class ProductWidget extends StatelessWidget {
  final DiaryProduct data;

  const ProductWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = [
      AppStylesBig.body3Regular,
      AppStylesSmall.body3Regular,
    ].byHeight;
    return Column(
      children: [
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.name, style: textStyle),
            Text(
              Utils.getMassStr(data.amount * data.portionWeight),
              style: textStyle,
            ),
          ],
        ),
        const SizedBox(height: 18.0),
        MacronutritionStrip(
          calories: data.amount * data.portionWeight * data.calorie,
          protein: data.amount * data.portionWeight * data.protein,
          fat: data.amount * data.portionWeight * data.fat,
          carb: data.amount * data.portionWeight * data.carb,
          colored: false,
        ),
      ],
    );
  }
}
