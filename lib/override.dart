import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app/breakpoints.dart';

class SizedApp extends StatefulWidget {
  const SizedApp({
    @required this.child,
    this.ratio,
    this.size,
  });
  final Widget child;
  final Size size;
  final double ratio;
  @override
  _SizedAppState createState() => _SizedAppState();
}

class _SizedAppState extends State<SizedApp> {
  @override
  void initState() {
    updateBP();
    super.initState();
  }

  @override
  void didUpdateWidget(SizedApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateBP();
  }

  void updateBP() {
    BreakPoints(
      byWidth: const [380, 800],
      byHeight: const [670, 800],
      overridedSize: widget.size,
      overridedRatio: widget.ratio,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (BreakPoints.overrided != true) return widget.child;
    final bigSize = Size(max(BreakPoints.size.width, BreakPoints.windowSize.width),
        max(BreakPoints.size.height, BreakPoints.windowSize.height));
    return InteractiveViewer(
      minScale: 0.5,
      maxScale: 2,
      constrained: false,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Placeholder(
            fallbackWidth: 1.3 * bigSize.width,
            fallbackHeight: 1.3 * bigSize.height,
            color: Colors.grey,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 50,
            child: Text(
              '${BreakPoints.size.width.toInt()}x${BreakPoints.size.height.toInt()} in '
              '${BreakPoints.windowSize.width.toInt()}x${BreakPoints.windowSize.height.toInt()}\n'
              '${BreakPoints.ratio} in ${BreakPoints.windowRatio}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
          ),
          Positioned(
            left: 10,
            top: 100,
            child: MediaQuery(
              data: MediaQueryData(
                size: BreakPoints.size,
                devicePixelRatio: BreakPoints.ratio,
              ),
              child: Builder(
                builder: (context) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(border: Border.all()),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
