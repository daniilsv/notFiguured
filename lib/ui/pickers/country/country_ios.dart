import 'package:notfiguured/ui/theme/theme.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryCupertinoActionSheet extends StatelessWidget {
  CountryCupertinoActionSheet({Key key}) : super(key: key);

  final countries = [
    MicronutrientCountry.russia,
    MicronutrientCountry.uk,
    MicronutrientCountry.canada,
    MicronutrientCountry.usa
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text(
        'Страна',
        style: AppTextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          height: 1.385,
          color: AppColors.grey3Cop06,
        ),
      ),
      actions: List.generate(
        countries.length,
        (index) => CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(countries[index]),
          child: Text(
            countries[index].localize,
            style: const AppTextStyle(
              fontSize: 20,
              height: 1.385,
              color: AppColors.iosBlue,
            ),
          ),
        ),
      ),
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: Navigator.of(context).pop,
        child: const Text(
          'Отмена',
          style: AppTextStyle(
            fontSize: 20,
            height: 1.385,
            color: AppColors.iosBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
