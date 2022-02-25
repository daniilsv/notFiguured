import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:chopper_api/extensions/sex.dart';

import '../personalization_viewmodel.dart';

class PersonalInfo extends ViewModelWidget<PersonalizationViewModel> {
  const PersonalInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, PersonalizationViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: [
            AppPaddings.t35b40h25,
            AppPaddings.t45b50h30,
          ].byHeight,
          child: Text(
            'Расскажите о себе:',
            style: [
              AppStylesSmall.headline1Bold,
              AppStylesBig.headline1Bold,
            ].byHeight.copyWith(color: AppColors.black),
          ),
        ),
        const Divider(color: AppColors.greyDC),
        AppListTile(
          title: 'Пол',
          onTap: model.onSexTap,
          // TODO добавить локализацию
          trailing: model.sex.localize ?? 'Не выбрано',
          withBottomDivider: true,
        ),
        AppListTile(
          title: 'Дата рождения',
          onTap: model.onBirthdayTap,
          trailing: model.birthdayString,
          withBottomDivider: true,
        ),
        AppListTile(
          title: 'Часовой пояс',
          onTap: model.onDateZoneTap,
          trailing: model.dateZone?.value ?? 'Не выбрано',
        ),
        const Divider(color: AppColors.greyDC),
      ],
    );
  }
}
