import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HardLevel extends StatelessWidget {
  final int level;
  final int maxLevel;

  const HardLevel(
    this.level, {
    this.maxLevel = 3,
    Key key,
  })  : assert(level <= maxLevel),
        assert(maxLevel > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < maxLevel; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: SvgPicture.asset(
              Assets.hardLevelPoint,
              color: i < level ? AppColors.error : null,
            ),
          )
      ],
    );
  }
}
