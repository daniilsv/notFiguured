import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GlassFilter extends StatelessWidget {
  final Widget child;

  const GlassFilter({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: child,
      ),
    );
  }
}
