import 'dart:math';

import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.inactiveColor = Colors.black,
    this.activeColor = Colors.red,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color inactiveColor;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color activeColor;

  Widget _buildDot(int index) {
    final selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    final zoom =
        ColorTween(begin: inactiveColor, end: activeColor).transform(selectedness);
    return CupertinoButton(
      onPressed: () => onPageSelected?.call(index),
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Container(
        width: 8,
        height: 8,
        margin: AppPaddings.all8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: zoom,
        ),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(itemCount, _buildDot),
      ),
    );
  }
}
