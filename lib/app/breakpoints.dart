import 'dart:math';

import 'package:flutter/widgets.dart';

/// [BreakPoints] provides cold screen break points for adaptive design
/// by setting `byWidth` or `byHeight` properties.
///
///
/// To set up [BreakPoints] init it at start of application e.g in main():
///
/// ```dart
/// void main() {
///   BreakPoints(
///     byWidth: const [500, 800],
///     byHeight: const [500, 800],
///   );
///   runApp(App());
/// }
/// ```
///
///
/// Next in every place of code is possible to get proper value according
/// on size of screen e.g:
///
///
/// ```dart
/// SizedBox(
///   width: [100, 500].byWidth,
///   height: [100, 500].byWidth,
/// )
/// ```
///
/// will make small square on small width devices and large square on normal ones.
///
///
/// ```dart
/// Text(
///   'Flutter rules!',
///   style: TextStyle(
///     fontSize: [14, 16, 18].byHeight,
///   ),
/// )
/// ```
/// will make text with:
///
/// `height < 500` => `fontSize: 14`
///
/// `500 <= height < 800` => `fontSize: 16`
///
/// `height >= 800` => `fontSize: 18`
///
class BreakPoints {
  /// Sets up [BreakPoints] for application. Usually places in `main()`
  BreakPoints({
    List<double> byWidth = const [],
    List<double> byHeight = const [],
    Size overridedSize,
    double overridedRatio,
  }) {
    final w = WidgetsBinding.instance.window;
    windowRatio = w.devicePixelRatio;
    windowSize = Size(w.physicalSize.width - w.viewInsets.left - w.viewInsets.right,
            w.physicalSize.height - w.viewInsets.top - w.viewInsets.bottom) /
        w.devicePixelRatio;
    overrided = overridedSize != null;
    if (overrided) {
      ratio = overridedRatio ?? 1.0;
      size = overridedSize;
    } else {
      ratio = windowRatio;
      size = windowSize;
    }
    currentByWidth = 0;
    for (final bp in byWidth ?? []) {
      if (bp > size.width) break;
      currentByWidth += 1;
    }
    currentByHeight = 0;
    for (final bp in byHeight ?? []) {
      if (bp > size.height) break;
      currentByHeight += 1;
    }
  }
  static Size windowSize;
  static double windowRatio;
  static bool overrided;
  static Size size;
  static double ratio;
  static int currentByWidth = 0;
  static int currentByHeight = 0;
}

extension Responsible<T> on List<T> {
  T get byWidth {
    final cur = BreakPoints.currentByWidth;
    return this[min(length - 1, cur)];
  }

  T get byHeight {
    final cur = BreakPoints.currentByHeight;
    return this[min(length - 1, cur)];
  }
}
