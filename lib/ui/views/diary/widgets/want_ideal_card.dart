import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class WantIdealCard extends StatelessWidget {
  const WantIdealCard(
      {@required this.title,
      @required this.text,
      @required this.buttonText,
      Key key,
      this.onPressed})
      : super(key: key);
  final String title;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: [AppStylesSmall.body2SemiBold, AppStylesBig.body2SemiBold].byWidth,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: [AppStylesSmall.body3Regular, AppStylesBig.body3Regular]
                .byWidth
                .copyWith(color: AppColors.grey87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          AppButton(
            onPressed: onPressed,
            color: AppColors.bg,
            colorDark: AppColors.greyDC,
            text: buttonText,
            style: AppStylesBig.inputs1Regular,
          ),
        ],
      ),
    );
  }
}
