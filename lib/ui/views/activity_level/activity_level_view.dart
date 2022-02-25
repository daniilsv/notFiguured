import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/slider.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:chopper_api/extensions/activity.dart';

import 'activity_level_viewmodel.dart';

class ActivityLevelRoute extends MaterialPageRoute<Activity> {
  ActivityLevelRoute({Color mainColor})
      : super(
          builder: (context) =>
              ActivityLevelView(mainColor: mainColor ?? AppColors.primary),
          settings: const RouteSettings(name: 'activity_level'),
        );
}

class ActivityLevelView extends StatelessWidget {
  const ActivityLevelView({
    Key key,
    this.mainColor = AppColors.primary,
  }) : super(key: key);
  final Color mainColor;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActivityLevelViewModel>.reactive(
      viewModelBuilder: () => ActivityLevelViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          expandedAppBarHeight: 70,
          title: '',
          contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Уровень активности?',
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 37,
                  vertical: 30,
                ),
                height: 210,
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
              SizedBox(height: [28.0, 43.0].byHeight),
              if (model.activityType != null) ...[
                AppSlider(
                  onChange: model.onActivityChange,
                  currentMin: model.currentIndex,
                  max: model.activities.length - 1.0,
                  jump: true,
                  color: mainColor,
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
          footer: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                onPressed: model.done,
                text: Strings.current.save,
                color: mainColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
