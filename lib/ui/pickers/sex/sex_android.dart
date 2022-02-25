import 'package:notfiguured/ui/theme/theme.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/sex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SexBottomSheetPicker extends StatelessWidget {
  const SexBottomSheetPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.v30h20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Пол',
            style: AppTextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(Sex.male),
            child: Padding(
              padding: AppPaddings.v12,
              child: Text(
                Sex.male.localize,
                style: AppTextStyle(
                  color: AppColors.black.withOpacity(0.6),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(Sex.female),
            child: Padding(
              padding: AppPaddings.v12,
              child: Text(
                Sex.female.localize,
                style: AppTextStyle(
                  color: AppColors.black.withOpacity(0.6),
                ),
              ),
            ),
          ),
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
