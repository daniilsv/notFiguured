import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculatorScaffold extends StatelessWidget {
  const CalculatorScaffold({
    @required this.title,
    @required this.mainColor,
    @required this.buttonText,
    @required this.children,
    @required this.assetIcon,
    @required this.onDone,
    this.backgroundColor = AppColors.bg,
    Key key,
    this.darkolor,
    this.isBusy = false,
  }) : super(key: key);
  final String title;
  final String assetIcon;
  final bool isBusy;
  final Color mainColor;
  final Color darkolor;
  final String buttonText;
  final Color backgroundColor;
  final VoidCallback onDone;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      waiting: isBusy,
      title: '',
      appBarAction: Padding(
        padding: const EdgeInsets.only(top: 17, bottom: 7),
        child: SvgPicture.asset(
          assetIcon,
          height: 20,
          width: 20,
          color: mainColor,
        ),
      ),
      actionBackButtonBaseline: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold].byHeight,
            ),
            ...children,
          ],
        ),
      ),
      footer: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton(
              onPressed: onDone,
              text: buttonText,
              color: mainColor,
              colorDark: darkolor ?? mainColor,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
