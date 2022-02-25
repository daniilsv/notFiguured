import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    this.value,
    this.color = AppColors.primary,
    this.backgroundColor = AppColors.greyF3,
    this.height = 2,
    this.duration = const Duration(milliseconds: 200),
  });
  final double value;
  final Color color;
  final Color backgroundColor;
  final double height;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: height,
        child: Stack(
          children: [
            Container(color: backgroundColor),
            AnimatedContainer(
              duration: duration,
              color: color,
              width: constraints.maxWidth * value,
            )
          ],
        ),
      );
    });
  }
}
