import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightCreateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 21,
          right: 21,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close_fullscreen_rounded,
              size: 14,
            ),
          ),
        )
      ],
    );
  }
}
