import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({
    Key key,
    this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: [44.0, 56.0].byHeight,
      child: CupertinoButton(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Assets.apple,
              color: AppColors.white,
              height: [44.0, 56.0].byHeight * .43,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .1),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                'Войти с Apple',
                style: AppTextStyle(
                  color: AppColors.white,
                  fontSize: [19.0, 24.0].byHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
