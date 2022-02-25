import 'package:notfiguured/ui/theme/theme.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryBottomSheetPicker extends StatelessWidget {
  CountryBottomSheetPicker({Key key}) : super(key: key);

  final countries = [
    MicronutrientCountry.russia,
    MicronutrientCountry.uk,
    MicronutrientCountry.canada,
    MicronutrientCountry.usa
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.v30h20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Страна',
            style: AppTextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 30),
          for (final country in countries) ...[
            const SizedBox(height: 10),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(country),
              child: Padding(
                padding: AppPaddings.v12,
                child: Text(
                  country?.localize ?? 'qwert',
                  style: AppTextStyle(
                    color: AppColors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ],
          const Divider(color: AppColors.greyDC),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: Navigator.of(context).pop,
            child: Padding(
              padding: AppPaddings.v12,
              child: Text(
                'Отмена',
                style: AppTextStyle(
                  color: AppColors.black.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
