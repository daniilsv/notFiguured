import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class MarkeredListItem extends StatelessWidget {
  final Widget child;

  const MarkeredListItem({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 12.0, top: 8.0),
          child: Icon(
            Icons.circle,
            color: AppColors.black,
            size: 8,
          ),
        ),
        Expanded(child: child)
      ],
    );
  }
}
