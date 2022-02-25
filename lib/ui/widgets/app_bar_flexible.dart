import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class AppBarFlexible extends StatefulWidget {
  const AppBarFlexible({
    @required this.title,
    Key key,
    this.action,
    this.showAction = true,
    this.automaticallyImplyLeading = true,
    this.onBackButton,
    this.actionBackButtonBaseline = false,
  }) : super(key: key);
  final String title;
  final Widget action;
  final bool showAction;
  final bool automaticallyImplyLeading;
  final bool actionBackButtonBaseline;
  final Function onBackButton;

  @override
  _AppBarFlexibleState createState() => _AppBarFlexibleState();
}

class _AppBarFlexibleState extends State<AppBarFlexible> {
  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    Widget backButton;
    if (widget.automaticallyImplyLeading && canPop || widget.onBackButton != null) {
      backButton = CupertinoButton(
        padding: const EdgeInsets.only(top: 15, bottom: 7, right: 20),
        minSize: 0,
        onPressed: widget.onBackButton ?? () => Navigator.maybePop(context),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.greyB8,
        ),
      );
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bigTextSize =
            [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold].byHeight;
        final smallTextSize =
            [AppStylesSmall.headline2Bold, AppStylesBig.headline2Bold].byHeight;
        final settings =
            context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        final double deltaExtent = settings.maxExtent - settings.minExtent;

        // 0.0 -> Expanded
        // 1.0 -> Collapsed to toolbar
        final double t =
            (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
                .clamp(0.0, 1.0) as double;

        // Scale from headline1 to headline2 accords to t
        final double textSizeScaleValue = MediaQuery.of(context).viewInsets.bottom == 0
            ? Tween<double>(begin: 1, end: smallTextSize.fontSize / bigTextSize.fontSize)
                .transform(t)
            : smallTextSize.fontSize / bigTextSize.fontSize;

        final Matrix4 scaleTransform = Matrix4.identity()
          ..scale(textSizeScaleValue, textSizeScaleValue, 1.0);
        return Padding(
          padding:
              EdgeInsets.only(left: [25.0, 30.0].byHeight, right: [25.0, 30.0].byHeight),
          child: Stack(
            children: [
              SizedBox(
                height: constraints.maxHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Transform(
                        transform: scaleTransform,
                        child: AutoSizeText(
                          widget.title,
                          style: bigTextSize,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    if (widget.action != null && widget.actionBackButtonBaseline != true)
                      AnimatedOpacity(
                        opacity: t == 0 && widget.showAction ? 1 : 0,
                        duration: 200.milliseconds,
                        child: widget.action,
                      )
                  ],
                ),
              ),
              if (backButton != null)
                Positioned(
                  left: 0,
                  top: 10,
                  child: IgnorePointer(
                    ignoring: t != 0,
                    child: AnimatedOpacity(
                      opacity: t == 0 ? 1 : 0,
                      duration: 200.milliseconds,
                      child: backButton,
                    ),
                  ),
                ),
              if (widget.action != null && widget.actionBackButtonBaseline == true)
                Positioned(
                  right: 0,
                  top: 10,
                  child: IgnorePointer(
                    ignoring: t != 0,
                    child: AnimatedOpacity(
                      opacity: t == 0 ? 1 : 0,
                      duration: 200.milliseconds,
                      child: widget.action,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
