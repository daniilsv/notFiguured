import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/inline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    this.onAddGoalTap,
    this.name,
  });
  final Function onAddGoalTap;
  final String name;
  List<String> get dayTimes => [
        'Доброй ночи',
        'Доброе утро',
        'Добрый день',
        'Добрый вечер',
      ];

  String get dayTimeString {
    final int hour = DateTime.now().hour;
    return dayTimes[hour ~/ 6] + (name == null ? '' : ',');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.v20h30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (name != null)
            Text(
              dayTimeString,
              style: [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold].byHeight,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (name == null)
                Text(
                  dayTimeString,
                  style:
                      [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold].byHeight,
                )
              else
                Expanded(
                  child: AutoSizeText(
                    '$name!',
                    maxLines: name.split(' ').length == 1 ? 1 : 3,
                    style: [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold]
                        .byHeight,
                  ),
                ),
              const SizedBox(width: 5),
              AppInlineButton(
                onTap: onAddGoalTap,
                text: Strings.current.new_goal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
