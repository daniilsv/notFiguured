import 'package:notfiguured/ui/theme/theme.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/extensions/sex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SexCupertinoActionSheet extends StatelessWidget {
  const SexCupertinoActionSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sexes = [Sex.male, Sex.female];
    return CupertinoActionSheet(
      title: const Text(
        'Пол',
        style: AppTextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          height: 1.385,
          color: AppColors.grey3Cop06,
        ),
      ),
      actions: List.generate(
        sexes.length,
        (index) => CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(sexes[index]),
          child: Text(
            sexes[index].localize,
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
