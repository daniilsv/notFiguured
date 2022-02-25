import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/inline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorResultScaffold extends StatelessWidget {
  const CalculatorResultScaffold({
    @required this.mainColor,
    @required this.body,
    this.addGoal,
    Key key,
  }) : super(key: key);
  final Color mainColor;
  final VoidCallback addGoal;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          AppInlineButton(
            text: Strings.current.close,
            onTap: () {
              Navigator.of(context).popUntil((route) {
                return route.settings?.name?.toLowerCase()?.contains('root') ?? false;
              });
            },
          ),
          const SizedBox(width: 30),
        ],
      ),
      backgroundColor: AppColors.white,
      body: body,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 40.0,
        ).copyWith(top: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              onPressed: Navigator.of(context).pop,
              text: Strings.current.calculate_again,
              color: AppColors.greyF3,
              colorDark: AppColors.greyDC,
              style: [
                AppStylesSmall.button1Regular,
                AppStylesBig.button1Regular,
              ].byHeight.copyWith(color: AppColors.black),
            ),
            if (addGoal != null)
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: AppButton(
                  onPressed: addGoal,
                  text: Strings.current.add_goal,
                  color: mainColor,
                  colorDark: mainColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
