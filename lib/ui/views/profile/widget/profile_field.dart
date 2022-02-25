import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class ProfileLine extends StatelessWidget {
  final String name;
  final String value;
  final VoidCallback callback;
  final bool isActive;
  final TextStyle textStyleName;

  const ProfileLine({
    @required this.name,
    @required this.value,
    this.textStyleName = AppStylesSmall.body3Medium,
    this.callback,
    this.isActive,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Text(
                name,
                style: textStyleName,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .28,
              ),
              child: Text(
                value,
                textAlign: TextAlign.end,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: [
                  AppStylesSmall.body3Regular,
                  AppStylesBig.body3Regular,
                ].byHeight.copyWith(color: AppColors.greyB8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
