import 'dart:math';

import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/app/number_formatter.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCard extends StatefulWidget {
  const InputCard({
    @required this.title,
    this.value = '',
    Key key,
    this.onPressed,
    this.units = '',
    this.editable = false,
    this.onTextChange,
    this.textColor = AppColors.text,
    this.error,
    this.doubleOnly = true,
    this.focusNode,
    this.controller,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final String value;
  final String units;
  final bool editable;
  final Color textColor;
  final String error;
  final Function(String newValue) onTextChange;
  final bool doubleOnly;
  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  FocusNode _focusNode;
  TextEditingController _controller;
  @override
  void initState() {
    if (widget.editable) {
      _controller = (widget.controller ?? TextEditingController())
        ..text = widget.value
        ..addListener(() => setState(() {}));
      _focusNode = (widget.focusNode ?? FocusNode())..addListener(() => setState(() {}));
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  double get maxWidth => widget.editable
      ? min(100, _controller.text.length * 13.0 + 15 + widget.units.length * 8.0)
      : widget.value.length * 10.0 + 15 + widget.units.length * 7.0;

  Color get valueColor => widget.error != null ? AppColors.error : widget.textColor;
  Color get unitsColor => widget.error != null
      ? AppColors.error
      : widget.editable && (_focusNode?.hasFocus ?? false)
          ? AppColors.black
          : AppColors.greyDC;

  void onPressed() {
    if (widget.editable)
      _focusNode.requestFocus();
    else {
      FocusScope.of(context).unfocus();
      widget.onPressed?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.v5,
          child: CupertinoButton(
            color: AppColors.white,
            disabledColor: AppColors.white,
            pressedOpacity: 0.7,
            onPressed: onPressed,
            minSize: 0,
            padding: AppPaddings.v35h30,
            borderRadius: AppBorderRadius.calculatorCard,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: [
                    AppStylesSmall.button1SemiBold,
                    AppStylesBig.button1SemiBold,
                  ].byHeight.copyWith(color: widget.textColor),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: AppColors.greyED)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.editable)
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: min(50, _controller.text.length * 13.0 + 5)),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _controller,
                            onChanged: widget.onTextChange,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              if (widget.doubleOnly == true)
                                TextInputFormatterOnlyNumbers(),
                            ],
                            style: [
                              AppStylesSmall.button1SemiBold,
                              AppStylesBig.button1SemiBold,
                            ].byHeight.copyWith(color: valueColor),
                            scrollPadding: const EdgeInsets.only(top: 20, bottom: 235),
                            decoration: const InputDecoration.collapsed(hintText: ''),
                          ),
                        )
                      else
                        Text(
                          widget.value,
                          style: [
                            AppStylesSmall.button1SemiBold,
                            AppStylesBig.button1SemiBold,
                          ].byHeight.copyWith(color: valueColor),
                        ),
                      Text(
                        widget.units,
                        style: [
                          AppStylesSmall.button1SemiBold,
                          AppStylesBig.button1SemiBold,
                        ].byHeight.copyWith(color: unitsColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.error != null) ...[
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.error,
                style: [
                  AppStylesSmall.body3Regular,
                  AppStylesBig.body3Regular,
                ].byHeight.copyWith(color: AppColors.error),
              ),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ],
    );
  }
}
