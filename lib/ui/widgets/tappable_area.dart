import 'package:notfiguured/ui/theme/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:notfiguured/app/breakpoints.dart';

class TappableArea extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const TappableArea({
    @required this.onTap,
    this.label,
    this.color = AppColors.greyB8,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      minSize: 0,
      padding: EdgeInsets.zero,
      child: DottedBorder(
        dashPattern: const [6, 6],
        strokeWidth: 2,
        color: color,
        borderType: BorderType.RRect,
        radius: const Radius.circular(15.0),
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 38.0),
        child: Center(
          child: Text(
            label ?? "",
            style: [
              AppStylesSmall.button1Regular,
              AppStylesBig.button1Regular,
            ].byHeight.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
