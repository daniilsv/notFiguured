import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({
    @required this.onTap,
    @required this.text,
    @required this.color,
    this.selected = false,
    Key key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final bool selected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: selected ? color : AppColors.white,
              borderRadius: AppBorderRadius.badge,
              border: Border.all(color: selected ? color : AppColors.greyED),
            ),
            child: Padding(
              padding: [
                const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 11,
                ),
                const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 9,
                ),
              ].byHeight,
              child: Center(
                child: Text(
                  text,
                  style: [
                    AppStylesSmall.body3Regular,
                    AppStylesBig.body3Regular,
                  ]
                      .byHeight
                      .copyWith(color: selected ? AppColors.white : AppColors.grey87),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
