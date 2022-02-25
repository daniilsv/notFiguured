import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class PercentInputWidget extends StatelessWidget {
  const PercentInputWidget({
    @required this.focusNode,
    @required this.controller,
    @required this.unitsColor,
    @required this.pointColor,
    @required this.title,
    this.hasError = false,
    Key key,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final Color unitsColor;
  final Color pointColor;
  final String title;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: pointColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 76,
              padding: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: AppColors.greyED,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 50,
                    ),
                    child: TextField(
                      focusNode: focusNode,
                      controller: controller,
                      maxLength: controller.text.startsWith('1') ? 3 : 2,
                      keyboardType: TextInputType.number,
                      buildCounter: (
                        context, {
                        currentLength,
                        isFocused,
                        maxLength,
                      }) =>
                          Container(),
                      style: [
                        AppStylesSmall.button1SemiBold,
                        AppStylesBig.button1SemiBold,
                      ].byHeight.copyWith(
                            color: hasError ? AppColors.error : AppColors.black,
                          ),
                      scrollPadding: const EdgeInsets.only(top: 20, bottom: 235),
                      decoration: const InputDecoration.collapsed(hintText: ''),
                    ),
                  ),
                  Text(
                    '%',
                    style: [
                      AppStylesSmall.button1SemiBold,
                      AppStylesBig.button1SemiBold,
                    ].byHeight.copyWith(color: hasError ? AppColors.error : unitsColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const AppTextStyle(
                color: AppColors.greyB8,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
