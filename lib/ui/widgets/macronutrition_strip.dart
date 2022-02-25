import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';

class MacronutritionStrip extends StatelessWidget {
  final num calories;
  final num protein;
  final num fat;
  final num carb;
  final bool colored;

  const MacronutritionStrip({
    this.calories,
    this.protein,
    this.fat,
    this.carb,
    this.colored = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = [
      AppStylesBig.body3Medium,
      AppStylesSmall.body3Medium,
    ].byHeight;
    if (!colored) style = style.copyWith(color: AppColors.greyB8);
    return LayoutBuilder(
      builder: (context, constrains) {
        final width = constrains.maxWidth / 4.0;
        return Row(
          children: [
            SizedBox(
              width: width,
              child: RichText(
                text: TextSpan(
                  text: "${Strings.current.kalories_character}: ",
                  style: style,
                  children: [
                    TextSpan(
                      text: Utils.getKaloriesStr(calories ?? 0.0),
                      style: colored ? style.copyWith(color: AppColors.green) : style,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: RichText(
                text: TextSpan(
                  text: "${Strings.current.proteins_character}: ",
                  style: style,
                  children: [
                    TextSpan(
                      text: Utils.getBjuStr(protein ?? 0.0),
                      style: colored ? style.copyWith(color: AppColors.blue) : style,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: RichText(
                text: TextSpan(
                  text: "${Strings.current.fat_character}: ",
                  style: style,
                  children: [
                    TextSpan(
                      text: Utils.getBjuStr(fat ?? 0.0),
                      style: colored ? style.copyWith(color: AppColors.pink) : style,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: RichText(
                text: TextSpan(
                  text: "${Strings.current.carbo_character}: ",
                  style: style,
                  children: [
                    TextSpan(
                      text: Utils.getBjuStr(carb ?? 0.0),
                      style: colored ? style.copyWith(color: AppColors.yellow) : style,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
