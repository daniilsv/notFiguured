import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter/cupertino.dart';

class LabeledDivider extends StatelessWidget {
  final String label;

  const LabeledDivider(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              color: AppColors.greyED,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(label,
                style: [AppStylesSmall.body3Regular, AppStylesBig.body3Regular]
                    .byHeight
                    .copyWith(color: AppColors.greyB8)),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: AppColors.greyED,
            ),
          ),
        ],
      ),
    );
  }
}
