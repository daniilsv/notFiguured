import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:notfiguured/ui/widgets/searched_text.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductSimpleModel product;
  final void Function(ProductSimpleModel product) onTap;
  final String searchText;

  const SimpleProductWidget({
    @required this.product,
    @required this.onTap,
    Key key,
    this.searchText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => onTap(product),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchedText(
                fullText: product.name,
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
              MacronutritionStrip(
                calories: product.portionSize * product.calorie,
                protein: product.portionSize * product.protein,
                fat: product.portionSize * product.fat,
                carb: product.portionSize * product.carbon,
                colored: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
