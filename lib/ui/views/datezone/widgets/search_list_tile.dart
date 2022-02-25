import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({
    @required this.title,
    this.searchValue,
    this.onTap,
    this.withBottomDivider = false,
    Key key,
  }) : super(key: key);

  final String searchValue;
  final String title;
  final VoidCallback onTap;
  final bool withBottomDivider;

  List<TextSpan> prepareSpans(List<Match> matches) {
    final List<TextSpan> spans = [];
    void addTextSpan(int start, int end, {isPrimaryColor = false}) {
      spans.add(
        TextSpan(
          text: title.substring(start, end),
          style: [
            AppStylesSmall.body3Medium,
            AppStylesBig.body3Medium,
          ].byHeight.copyWith(
                color: isPrimaryColor ? AppColors.primary : AppColors.black,
              ),
        ),
      );
    }

    if (matches.first.start > 0) {
      addTextSpan(0, matches.first.start); //text before match
    }
    for (int i = 0; i < matches.length - 1; i++) {
      final Match match = matches[i];
      final Match nextMatch = matches[i + 1];
      addTextSpan(match.start, match.end, isPrimaryColor: true); //matched text
      addTextSpan(match.end, nextMatch.start); //text after match, before next match
    }
    addTextSpan(matches.last.start, matches.last.end, isPrimaryColor: true); //last match
    if (title.length != matches.last.end) {
      addTextSpan(matches.last.end, title.length); //after last match
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    if ((searchValue?.isEmpty ?? true) ||
        !title.toLowerCase().contains(searchValue.toLowerCase())) {
      spans.add(
        TextSpan(
          text: title,
          style: [
            AppStylesSmall.body3Medium,
            AppStylesBig.body3Medium,
          ].byHeight.copyWith(
                color: AppColors.black,
              ),
        ),
      );
    } else {
      final List<Match> matches =
          searchValue.toLowerCase().allMatches(title.toLowerCase()).toList();
      spans = prepareSpans(matches);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoButton(
          onPressed: onTap,
          padding: [
            AppPaddings.v20h25,
            AppPaddings.v20h30,
          ].byHeight,
          child: RichText(
            text: TextSpan(
              children: spans,
            ),
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
      ],
    );
  }
}
