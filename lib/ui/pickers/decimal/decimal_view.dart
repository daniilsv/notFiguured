import 'dart:io';

import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stacked/stacked.dart';

import 'decimal_view_model.dart';

Future<double> showDecimalPicker(
  BuildContext context, {
  bool isAndroid,
  String title,
  String suffixText,
  double initialValue,
  double minValue,
  double maxValue,
}) async {
  isAndroid ??= Platform.isAndroid;
  if (initialValue != null) {
    if (initialValue > maxValue) initialValue = maxValue;
    if (initialValue < minValue) initialValue = minValue;
  } else
    initialValue = minValue;
  if (isAndroid)
    return showDialog(
      context: context,
      builder: (ctx) => _DecimalPickerView(
        isAndroid: true,
        title: title,
        suffixText: suffixText,
        initialValue: initialValue,
        minValue: minValue,
        maxValue: maxValue,
      ),
      useRootNavigator: true,
      barrierDismissible: true,
    );
  else
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => _DecimalPickerView(
        isAndroid: false,
        title: title,
        suffixText: suffixText,
        initialValue: initialValue,
        minValue: minValue,
        maxValue: maxValue,
      ),
    );
}

class _DecimalPickerView extends StatelessWidget {
  const _DecimalPickerView({
    this.title,
    this.suffixText,
    this.isAndroid,
    this.initialValue,
    this.minValue,
    this.maxValue,
  });
  final bool isAndroid;
  final String title;
  final String suffixText;
  final double initialValue;
  final double minValue;
  final double maxValue;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DecimalPickerViewModel>.reactive(
      viewModelBuilder: () => DecimalPickerViewModel(
        context,
        initialValue: initialValue,
        minValue: minValue,
        addMinValue: !isAndroid,
      ),
      builder: (context, model, child) {
        if (isAndroid)
          return Dialog(
            child: Padding(
              padding: AppPaddings.v20h30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: [AppStylesSmall.inputs1Medium, AppStylesBig.inputs1Medium]
                        .byHeight,
                  ),
                  const SizedBox(height: 35),
                  Stack(
                    children: [
                      NumberPicker.decimal(
                        initialValue: model.result,
                        minValue: minValue.round(),
                        maxValue: maxValue.round(),
                        highlightSelectedValue: false,
                        textStyle: AppStylesBig.inputs1Medium,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2, color: AppColors.greyDC),
                            bottom: BorderSide(width: 2, color: AppColors.greyDC),
                          ),
                        ),
                        onChanged: model.onSelected,
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Container(
                            padding: AppPaddings.h20,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                const Text('   . ', style: AppStylesBig.inputs1Medium),
                                Text(
                                  suffixText,
                                  style: AppStylesBig.inputs1Medium
                                      .copyWith(color: Colors.black.withOpacity(0.4)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: model.cancel,
                        textColor: AppColors.primary,
                        child: Text(Strings.current.cancel),
                      ),
                      FlatButton(
                        onPressed: model.done,
                        textColor: AppColors.primary,
                        child: Text(Strings.current.done),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        else {
          const Color _kHighlighterBorder = CupertinoDynamicColor.withBrightness(
            color: Color(0x33000000),
            darkColor: Color(0x33FFFFFF),
          );
          final Color resolvedBorderColor =
              CupertinoDynamicColor.resolve(_kHighlighterBorder, context);

          return Container(
            color: Colors.white,
            height: 250,
            padding: AppPaddings.all16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: model.cancel,
                      child: Text(
                        Strings.current.cancel,
                        style: const AppTextStyle(
                          color: AppColors.iosBlue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: model.done,
                      child: Text(
                        Strings.current.done,
                        style: const AppTextStyle(
                          color: AppColors.iosBlue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: AppPaddings.h25,
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Spacer(),
                            Expanded(
                              child: CupertinoPicker.builder(
                                scrollController: model.numberController,
                                itemExtent: 34,
                                onSelectedItemChanged: model.onSelectedNumber,
                                itemBuilder: (context, index) => Center(
                                    child: Text((minValue + index).round().toString())),
                                childCount: (maxValue - minValue).round(),
                              ),
                            ),
                            const Center(child: Text(',')),
                            Expanded(
                              child: CupertinoPicker(
                                scrollController: model.decimalController,
                                itemExtent: 34,
                                onSelectedItemChanged: model.onSelectedDecimal,
                                looping: true,
                                children: List<Widget>.generate(
                                  10,
                                  (index) => Center(child: Text(index.toString())),
                                ),
                              ),
                            ),
                            const Spacer(flex: 2),
                            Center(child: Text(suffixText)),
                            const Spacer(),
                          ],
                        ),
                        IgnorePointer(
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(width: 0, color: Colors.white),
                                  bottom: BorderSide(width: 0, color: Colors.white),
                                ),
                              ),
                              constraints: const BoxConstraints.expand(height: 34),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 0, color: resolvedBorderColor),
                                    bottom:
                                        BorderSide(width: 0, color: resolvedBorderColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
