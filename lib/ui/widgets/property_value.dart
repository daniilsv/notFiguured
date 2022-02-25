import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class PropertyValue extends StatelessWidget {
  final String prop;
  final String value;
  final bool highlightedValue;

  const PropertyValue(
    this.prop,
    this.value, {
    this.highlightedValue = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = [
      AppStylesSmall.body2Regular,
      AppStylesBig.body2Regular,
    ].byHeight.copyWith(color: AppColors.grey87);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prop,
            style: defaultStyle,
          ),
          Text(
            value,
            style: highlightedValue
                ? [
                    AppStylesSmall.body2SemiBold,
                    AppStylesBig.body2SemiBold,
                  ].byHeight
                : defaultStyle,
          ),
        ],
      ),
    );
  }
}
