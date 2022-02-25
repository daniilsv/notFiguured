import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notfiguured/app/breakpoints.dart';

class CalculatorCard extends StatelessWidget {
  const CalculatorCard({
    @required this.title,
    @required this.assetIcon,
    @required this.color,
    Key key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final String assetIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      onPressed: onPressed,
      padding: const EdgeInsets.only(
        top: 44,
        bottom: 21,
        left: 20,
        right: 20,
      ),
      borderRadius: AppBorderRadius.calculatorCard,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              assetIcon,
              height: 20,
              width: 20,
              color: AppColors.white,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: [
                AppStylesSmall.headline2Bold,
                AppStylesBig.headline2Bold,
              ].byHeight.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
