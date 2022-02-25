import 'package:notfiguured/data/model/enum/meal_type.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/inline_button.dart';
import 'package:flutter/cupertino.dart';

class MealCupertinoPicker extends StatelessWidget {
  final MealType initial;

  const MealCupertinoPicker({Key key, this.initial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealType result = initial ?? MealType.values[0];
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * .4,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppInlineButton(
                    text: Strings.current.cancel,
                    onTap: Navigator.of(context).pop,
                  ),
                  AppInlineButton(
                    text: Strings.current.done,
                    onTap: () => Navigator.of(context).pop<MealType>(result),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: initial == null ? 0 : MealType.values.indexOf(initial),
                  ),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (index) => result = MealType.values[index],
                  children: MealType.values
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Text(
                            e.title,
                            style: const AppTextStyle(
                              fontSize: 18,
                              height: 1.15,
                              color: AppColors.grey2E,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
