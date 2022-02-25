import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

enum AppButtonStatus { idle, pressed, disabled }

class AppButton extends StatefulWidget {
  const AppButton({
    @required this.onPressed,
    @required this.text,
    Key key,
    this.color = AppColors.primary,
    this.colorDark = AppColors.primaryDark,
    this.style = AppStylesBig.button1SemiBold,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final TextStyle style;
  final Color color;
  final Color colorDark;

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  AppButtonStatus status;

  void initStatus() {
    if (status == AppButtonStatus.pressed) return;
    if (widget.onPressed == null) {
      status = AppButtonStatus.disabled;
    } else {
      status = AppButtonStatus.idle;
    }
  }

  void changeStatus(AppButtonStatus status) {
    this.status = status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    initStatus();
    const paddingForBigScreen = EdgeInsets.only(left: 39, right: 39, top: 21, bottom: 20);
    const paddingForSmallScreen =
        EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 20);
    return IgnorePointer(
      ignoring: status == AppButtonStatus.disabled,
      child: GestureDetector(
        onTapDown: (_) => changeStatus(AppButtonStatus.pressed),
        onTapUp: (_) => changeStatus(AppButtonStatus.idle),
        onTapCancel: () => changeStatus(AppButtonStatus.idle),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: getColor(status),
            borderRadius: AppBorderRadius.button,
          ),
          duration: 200.milliseconds,
          child: Padding(
            padding: [paddingForSmallScreen, paddingForBigScreen].byHeight,
            child: Center(
              child: Text(
                widget.text,
                style: widget.style,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(AppButtonStatus status) {
    switch (status) {
      case AppButtonStatus.idle:
        return widget.color;
        break;
      case AppButtonStatus.pressed:
        return widget.colorDark;
        break;
      case AppButtonStatus.disabled:
        return widget.color.withOpacity(.5);
        break;
      default:
        return widget.color;
    }
  }
}
