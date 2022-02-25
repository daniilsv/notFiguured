import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/calculator/calculator_view.dart';
import 'package:notfiguured/ui/views/diary/diary_view.dart';
import 'package:notfiguured/ui/views/measurements/measurements_view.dart';
import 'package:notfiguured/ui/views/profile/profile_view.dart';
import 'package:notfiguured/ui/views/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'root_viewmodel.dart';

class RootViewRoute extends MaterialPageRoute {
  RootViewRoute()
      : super(
          builder: (context) => RootView(),
          settings: const RouteSettings(name: 'RootViewRoute'),
        );
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _RootView();
    // return MultiProvider(
    //   providers: [
    //     // Provider(create: (c) => RootRepository()),
    //   ],
    //   child: _RootView(),
    // );
  }
}

class _RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      viewModelBuilder: () => RootViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Scaffold(
          body: IndexedStack(
            index: model.index,
            sizing: StackFit.expand,
            children: (model.isLoggedIn
                    ? [
                        DiaryView(),
                        CalculatorView(),
                        MeasurementsView(),
                        ProfileView(),
                      ]
                    : [
                        const SplashScreen(),
                        CalculatorView(),
                        const SplashScreen(),
                        const SplashScreen(),
                      ])
                .map((e) => Column(children: [Expanded(child: e)]))
                .toList(),
          ),
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: model.index,
            onTap: model.changePage,
            iconSize: 20,
            border: const Border(top: BorderSide(color: AppColors.greyDC)),
            backgroundColor: Colors.white.withOpacity(.9),
            activeColor: AppColors.black,
            inactiveColor: AppColors.greyB8,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.diary,
                  color: model.index == 0 ? AppColors.black : AppColors.greyB8,
                ),
                label: 'Дневник',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.calculator,
                  color: model.index == 1 ? AppColors.black : AppColors.greyB8,
                ),
                label: 'Калькуляторы',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.measurements,
                  color: model.index == 2 ? AppColors.black : AppColors.greyB8,
                ),
                label: 'Замеры',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.profile,
                  color: model.index == 3 ? AppColors.black : AppColors.greyB8,
                ),
                label: 'Профиль',
              ),
            ],
          ),
        );
      },
    );
  }
}
