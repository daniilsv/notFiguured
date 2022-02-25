import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/slider.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:chopper_api/extensions/activity.dart';

import '../personalization_viewmodel.dart';

class ActivityLevelInfo extends ViewModelWidget<PersonalizationViewModel> {
  const ActivityLevelInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, PersonalizationViewModel model) {
    return Padding(
      padding: [AppPaddings.h25, AppPaddings.h30].byHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: [35.0, 45.0].byHeight),
          Text(
            'Каков Ваш уровень активности?',
            style: [
              AppStylesSmall.headline1Bold,
              AppStylesBig.headline1Bold,
            ].byHeight.copyWith(color: AppColors.black),
          ),
          SizedBox(height: [20.0, 30.0].byHeight),
          Text(
            'Выберите вариант, который лучше всего Вас описывает:',
            style: [
              AppStylesSmall.body1Regular,
              AppStylesBig.body1Regular,
            ].byHeight.copyWith(color: AppColors.greyB8),
          ),
          SizedBox(height: [20.0, 35.0].byHeight),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  AppColors.black.withOpacity(0.7),
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
                image: const AssetImage(
                  'assets/images/activity_level.png',
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 37,
                vertical: 30,
              ),
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Text(
                      model.activityType.title,
                      style: [
                        AppStylesSmall.headline2Bold,
                        AppStylesBig.headline2Bold,
                      ].byHeight.copyWith(color: AppColors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: AutoSizeText(
                        model.activityType.description,
                        style: [
                          AppStylesSmall.body2Regular,
                          AppStylesBig.body2Regular,
                        ].byHeight.copyWith(color: AppColors.greyB8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: [28.0, 43.0].byHeight),
          if (model.activityType != null) ...[
            AppSlider(
              onChange: model.onActivityChange,
              currentMin: model.currentIndex,
              max: Activity.values.length - 1.0,
              jump: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Низкий',
                  style: [
                    AppStylesSmall.body3Regular,
                    AppStylesBig.body3Regular,
                  ].byHeight.copyWith(color: AppColors.greyB8),
                ),
                Text(
                  'Высокий',
                  style: [
                    AppStylesSmall.body3Regular,
                    AppStylesBig.body3Regular,
                  ].byHeight.copyWith(color: AppColors.greyB8),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
