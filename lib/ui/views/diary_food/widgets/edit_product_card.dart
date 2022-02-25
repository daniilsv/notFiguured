import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';

class EditProductCard extends StatelessWidget {
  const EditProductCard({
    @required this.controller,
    @required this.product,
    Key key,
  }) : super(key: key);

  final TextEditingController controller;
  final DiaryProduct product;

  bool get hasError =>
      controller.text.isNotEmpty && (double.tryParse(controller.text) ?? 0) <= 0;

  @override
  Widget build(BuildContext context) {
    final multiplicator = (double.tryParse(controller.text) ?? 0).clamp(0.0, 9999);
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: AppBorderRadius.smallCard,
        color: AppColors.white,
        boxShadow: [AppShadows.easy],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: [29.0, 34.0].byHeight,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Strings.current.portion}:',
                    style: [
                      AppStylesBig.button1SemiBold,
                      AppStylesSmall.button1SemiBold,
                    ].byHeight.copyWith(color: AppColors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      width: 76,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: AppColors.greyED,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 50),
                              child: TextField(
                                controller: controller,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                scrollPadding:
                                    const EdgeInsets.only(top: 20, bottom: 235),
                                decoration: const InputDecoration.collapsed(
                                  hintText: '',
                                ),
                                buildCounter: (
                                  context, {
                                  currentLength,
                                  isFocused,
                                  maxLength,
                                }) =>
                                    Container(),
                                style: [
                                  AppStylesSmall.button1SemiBold,
                                  AppStylesBig.button1SemiBold,
                                ].byHeight.copyWith(
                                      color: hasError ? AppColors.error : AppColors.black,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                'г',
                                style: [
                                  AppStylesSmall.button1SemiBold,
                                  AppStylesBig.button1SemiBold,
                                ].byHeight.copyWith(
                                    color: hasError ? AppColors.error : AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.greyDC,
              thickness: 1,
              height: 52,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: MacronutritionStrip(
                calories: product.calorie * multiplicator,
                protein: product.protein * multiplicator,
                fat: product.fat * multiplicator,
                carb: product.carb * multiplicator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
