import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    @required this.title,
    this.trailing,
    this.onTap,
    this.withBottomDivider = false,
    Key key,
  }) : super(key: key);

  final String title;
  final String trailing;
  final VoidCallback onTap;
  final bool withBottomDivider;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CupertinoButton(
        onPressed: onTap,
        padding: [
          AppPaddings.v20h25,
          AppPaddings.v20h30,
        ].byHeight,
        minSize: 0,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: [
                  AppStylesSmall.body3Regular,
                  AppStylesBig.body3Regular,
                ].byHeight.copyWith(color: AppColors.black),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .5,
              ),
              child: Text(
                trailing ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: [
                  AppStylesSmall.body3Regular,
                  AppStylesBig.body3Regular,
                ].byHeight.copyWith(color: AppColors.grey87),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
      if (withBottomDivider)
        Padding(
          padding: [
            AppPaddings.h25,
            AppPaddings.h30,
          ].byHeight,
          child: const Divider(color: AppColors.greyDC),
        ),
    ]);
  }
}
