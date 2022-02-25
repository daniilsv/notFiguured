import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    @required this.isBusy,
    Key key,
  }) : super(key: key);
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: 300.milliseconds,
      opacity: isBusy ? 1 : 0,
      child: Container(
        width: isBusy ? MediaQuery.of(context).size.width : 0,
        height: isBusy ? MediaQuery.of(context).size.height : 0,
        decoration: BoxDecoration(
          color: AppColors.greyED.withOpacity(.5),
        ),
        child: const CupertinoActivityIndicator(),
      ),
    );
  }
}
