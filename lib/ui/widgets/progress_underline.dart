import 'dart:math' as math;

import 'package:flutter/material.dart';

class ProgressUnderline extends InputBorder {
  const ProgressUnderline({
    this.ratio,
    this.primary,
    BorderSide secondary = const BorderSide(),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4.0),
      topRight: Radius.circular(4.0),
    ),
  }) : super(borderSide: secondary);

  final BorderRadius borderRadius;
  final BorderSide primary;
  final double ratio;

  @override
  InputBorder copyWith({BorderSide borderSide}) {
    return const ProgressUnderline();
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: borderSide.width);

  @override
  ShapeBorder scale(double t) {
    return ProgressUnderline(secondary: borderSide.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..addRect(Rect.fromLTWH(rect.left, rect.top, rect.width,
          math.max(0.0, rect.height - borderSide.width)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  bool get isOutline => false;

  @override
  void paint(Canvas canvas, Rect rect,
      {double gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection textDirection}) {
    if (borderRadius.bottomLeft != Radius.zero || borderRadius.bottomRight != Radius.zero)
      canvas.clipPath(getOuterPath(rect, textDirection: textDirection));
    canvas.drawLine(rect.bottomLeft, rect.bottomRight, borderSide.toPaint());
    if (ratio != null) {
      var _ratio = ratio > 1.0 ? 1.0 : ratio;
      _ratio = _ratio == 0 ? 0.02 : _ratio;
      canvas.drawLine(
          rect.bottomLeft, rect.bottomRight.scale(_ratio, 1), primary.toPaint());
    }
  }
}
