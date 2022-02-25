import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataInputCard extends StatelessWidget {
  const DataInputCard({
    @required this.text,
    @required this.type,
    Key key,
    this.value,
    this.onChanged,
    this.color = AppColors.black,
  }) : super(key: key);
  final String text;
  final double value;
  final String type;
  final Color color;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 34, bottom: 30, left: 28, right: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: [AppStylesSmall.button1SemiBold, AppStylesBig.button1SemiBold]
                .byWidth
                .copyWith(color: color),
          ),
          SizedBox(
            width: 99,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 44,
                      child: EditableText(
                        onChanged: onChanged,
                        backgroundCursorColor: AppColors.white,
                        controller: TextEditingController(text: value ?? '1400'),
                        cursorColor: AppColors.primary,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                        focusNode: FocusNode(),
                        style: [
                          AppStylesSmall.button1SemiBold,
                          AppStylesBig.button1SemiBold
                        ].byWidth.copyWith(color: color),
                      ),
                    ),
                    Text(
                      type,
                      style: [
                        AppStylesSmall.button1SemiBold,
                        AppStylesBig.button1SemiBold
                      ].byWidth.copyWith(color: AppColors.greyDC),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: AppColors.greyED),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
