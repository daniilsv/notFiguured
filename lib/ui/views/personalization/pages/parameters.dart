import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import '../personalization_viewmodel.dart';

class ParamatersInfo extends ViewModelWidget<PersonalizationViewModel> {
  const ParamatersInfo({Key key}) : super(key: key);

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
            'Ваши параметры:',
            style: [
              AppStylesSmall.headline1Bold,
              AppStylesBig.headline1Bold,
            ].byHeight.copyWith(color: AppColors.black),
          ),
        ),
        Padding(
          padding: [AppPaddings.h25, AppPaddings.h30].byHeight,
          child: Text(
            'Можете указать примерно.\n\nВы всегда сможете изменить значения в настройках профиля.',
            style: [AppStylesSmall.body1Regular, AppStylesBig.body1Regular]
                .byHeight
                .copyWith(color: AppColors.greyB8),
          ),
        ),
        const SizedBox(height: 35),
        const Divider(color: AppColors.greyDC),
        AppListTile(
          title: Strings.current.weight,
          onTap: model.onWeightTap,
          trailing: model.weight != null
              ? '${model.weight} ${Strings.current.kg}'
              : 'Не указан',
          withBottomDivider: true,
        ),
        AppListTile(
          title: Strings.current.growth,
          onTap: model.onHeightTap,
          trailing: model.height != null
              ? '${model.height} ${Strings.current.sm}'
              : 'Не указан',
        ),
        const Divider(color: AppColors.greyDC),
      ],
    );
  }
}
