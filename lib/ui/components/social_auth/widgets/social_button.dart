import 'package:notfiguured/data/model/enum/social_networks.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

enum SocialButtonStatus { idle, pressed }

class SocialButton extends StatefulWidget {
  const SocialButton({
    @required this.socialNetwork,
    @required this.onTap,
    @required this.width,
    Key key,
  }) : super(key: key);

  final double width;
  final SocialNetworks socialNetwork;
  final void Function(SocialNetworks socialNetwork) onTap;

  @override
  _SocialButtonState createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  SocialButtonStatus status = SocialButtonStatus.idle;

  void changeStatus(SocialButtonStatus status) {
    setState(() {
      this.status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: GestureDetector(
        onTap: () => widget.onTap(widget.socialNetwork),
        onTapDown: (_) => changeStatus(SocialButtonStatus.pressed),
        onTapUp: (_) => changeStatus(SocialButtonStatus.idle),
        onTapCancel: () => changeStatus(SocialButtonStatus.idle),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.button,
            color: getColor(status),
            border: Border.all(
              color: getBorderColor(status),
            ),
          ),
          duration: 200.milliseconds,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Center(
              child: Image.asset(
                widget.socialNetwork.imagePath,
                height: widget.width * .5,
                width: widget.width * .5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(SocialButtonStatus status) {
    switch (status) {
      case SocialButtonStatus.idle:
        return AppColors.white;
        break;
      case SocialButtonStatus.pressed:
        return AppColors.greyF3;
        break;
      default:
        return AppColors.white;
    }
  }

  Color getBorderColor(SocialButtonStatus status) {
    switch (status) {
      case SocialButtonStatus.idle:
        return AppColors.greyED;
        break;
      case SocialButtonStatus.pressed:
        return AppColors.greyF3;
        break;
      default:
        return AppColors.greyED;
    }
  }
}
