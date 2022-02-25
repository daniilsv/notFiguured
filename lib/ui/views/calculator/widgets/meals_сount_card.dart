import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealsCountCard extends StatelessWidget {
  const MealsCountCard({
    @required this.onTap,
    this.min = 2,
    this.max = 10,
    this.selectedCount = 3,
  }) : assert(min < max);

  final int min;
  final int max;
  final int selectedCount;
  final void Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.v5,
      child: CupertinoButton(
        color: AppColors.white,
        disabledColor: AppColors.white,
        onPressed: () {},
        pressedOpacity: 0.7,
        minSize: 0,
        padding: AppPaddings.v35,
        borderRadius: AppBorderRadius.calculatorCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppPaddings.h30,
              child: Text(
                'Приёмов пищи за день:',
                style: [
                  AppStylesSmall.button1SemiBold,
                  AppStylesBig.button1SemiBold,
                ].byHeight.copyWith(color: AppColors.black),
              ),
            ),
            const SizedBox(height: 24),
            Stack(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    padding: AppPaddings.h30,
                    itemCount: max - min + 1,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      final int count = min + index;
                      final bool isSelected = count == selectedCount;
                      final Color borderColor =
                          isSelected ? AppColors.primary : AppColors.greyDC;
                      final Color circleColor =
                          isSelected ? AppColors.primary : AppColors.white;
                      final Color textColor =
                          isSelected ? AppColors.white : AppColors.grey87;
                      return GestureDetector(
                        onTap: () => onTap(count),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: borderColor),
                              color: circleColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                count.toString(),
                                style: [
                                  AppStylesSmall.button1Regular,
                                  AppStylesBig.button1Regular,
                                ].byHeight.copyWith(color: textColor),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Positioned(
                  right: 0,
                  height: 50,
                  width: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x00FFFFFF),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
