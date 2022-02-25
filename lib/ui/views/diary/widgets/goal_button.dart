import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoalButton extends StatelessWidget {
  const GoalButton({
    @required this.icon,
    @required this.title,
    Key key,
    this.onPressed,
  }) : super(key: key);

  final String icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 40,
          left: 32,
          right: 38,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.greyF3,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 17),
                Text(
                  title,
                  style: [
                    AppStylesSmall.headline2Bold,
                    AppStylesBig.headline2Bold,
                  ].byWidth,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.greyDC,
              size: 12,
            )
          ],
        ),
      ),
    );
  }
}
