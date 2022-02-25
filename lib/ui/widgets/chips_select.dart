import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class ChipsSelect<T> extends StatelessWidget {
  final List<T> options;
  final T value;
  final Function(T item) onChange;
  final String Function(T item) getText;
  final Color defaultColor;
  final Color accentColor;
  final EdgeInsets padding;

  const ChipsSelect.single({
    @required this.options,
    @required this.value,
    @required this.onChange,
    this.defaultColor = AppColors.white,
    this.accentColor = AppColors.text,
    this.getText,
    this.padding = EdgeInsets.zero,
    Key key,
  }) : super(key: key);

  //TODO: допилить
  const ChipsSelect.multi({
    @required this.options,
    @required this.value,
    @required this.onChange,
    this.defaultColor = AppColors.white,
    this.accentColor = AppColors.text,
    this.getText,
    this.padding = EdgeInsets.zero,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, i) => FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: AppColors.greyED),
          ),
          color: options[i] != value ? defaultColor : accentColor,
          onPressed: () {
            if (options[i] != value) onChange(options[i]);
          },
          child: Text(
            getText?.call(options[i]) ?? options[i].toString(),
            style: [
              AppStylesSmall.body3Regular,
              AppStylesBig.body3Regular,
            ].byHeight.copyWith(
                  color: options[i] == value ? defaultColor : AppColors.grey87,
                ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
