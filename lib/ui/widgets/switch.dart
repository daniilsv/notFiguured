import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppSwitch({@required this.value, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: FittedBox(
        child: CupertinoSwitch(
          value: value,
          activeColor: AppColors.success,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
