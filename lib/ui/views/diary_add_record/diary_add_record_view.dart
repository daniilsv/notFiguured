import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary_exercise/training/training_view.dart';
import 'package:notfiguured/ui/views/diary_food/meal/meal_view.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryAddRecordRoute extends MaterialPageRoute {
  DiaryAddRecordRoute({DateTime date})
      : super(builder: (context) => DiaryAddRecordView(date: date));
}

class DiaryAddRecordView extends StatelessWidget {
  const DiaryAddRecordView({this.date});
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Добавить в дневник',
      body: Column(
        children: [
          const SizedBox(height: 24.0),
          CupertinoButton(
            onPressed: () {
              Navigator.push(context, MealRoute(date: date));
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Container(
              height: 210,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    AppColors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: const AssetImage(
                    'assets/images/food.png',
                  ),
                ),
              ),
              child: Text(
                'Приём пищи',
                style: [
                  AppStylesSmall.headline2Bold,
                  AppStylesBig.headline2Bold,
                ].byHeight.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CupertinoButton(
            onPressed: () {
              Navigator.push(context, TrainingRoute(date: date));
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Container(
              height: 210,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    AppColors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: const AssetImage(
                    'assets/images/exercises.png',
                  ),
                ),
              ),
              child: Text(
                'Тренировку',
                style: [
                  AppStylesSmall.headline2Bold,
                  AppStylesBig.headline2Bold,
                ].byHeight.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
