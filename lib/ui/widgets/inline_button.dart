import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter/cupertino.dart';

class AppInlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AppInlineButton({@required this.text, @required this.onTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: onTap,
      child: Text(
        text,
        style: [AppStylesSmall.body3Medium, AppStylesBig.body3Medium]
            .byHeight
            .copyWith(color: AppColors.primary),
      ),
    );
  }
}
