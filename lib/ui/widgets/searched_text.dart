import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchedText extends StatelessWidget {
  const SearchedText({
    @required this.fullText,
    this.searchValue,
    this.textStyle,
    this.matchedStyle,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    Key key,
  }) : super(key: key);

  final String searchValue;
  final String fullText;
  final TextStyle textStyle;
  final TextStyle matchedStyle;
  final int maxLines;
  final TextOverflow overflow;

  List<TextSpan> prepareSpans(List<Match> matches) {
    final List<TextSpan> spans = [];
    void addTextSpan(int start, int end, {isMatch = false}) {
      spans.add(
        TextSpan(
          text: fullText.substring(start, end),
          style: isMatch ? matchedStyle : textStyle,
        ),
      );
    }

    if (matches.first.start > 0) {
      addTextSpan(0, matches.first.start); //text before match
    }
    for (int i = 0; i < matches.length - 1; i++) {
      final Match match = matches[i];
      final Match nextMatch = matches[i + 1];
      addTextSpan(match.start, match.end, isMatch: true); //matched text
      addTextSpan(match.end, nextMatch.start); //text after match, before next match
    }
    addTextSpan(matches.last.start, matches.last.end, isMatch: true); //last match
    if (fullText.length != matches.last.end) {
      addTextSpan(matches.last.end, fullText.length); //after last match
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    if ((searchValue?.isEmpty ?? true) ||
        !fullText.toLowerCase().contains(searchValue.toLowerCase())) {
      spans.add(
        TextSpan(
          text: fullText,
          style: textStyle,
        ),
      );
    } else {
      final List<Match> matches =
          searchValue.toLowerCase().allMatches(fullText.toLowerCase()).toList();
      spans = prepareSpans(matches);
    }
    return RichText(
      maxLines: maxLines,
      overflow: overflow,
      text: TextSpan(
        children: spans,
      ),
    );
  }
}
