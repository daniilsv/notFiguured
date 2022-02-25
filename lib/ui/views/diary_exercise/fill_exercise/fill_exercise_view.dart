import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary_exercise/widgets/edit_exercise_card.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'fill_exercise_viewmodel.dart';

class FillExerciseDependency {
  FillExerciseDependency(
      {this.training, this.exercise, this.exerciseEdit, this.dateTime});
  final DiaryDayExercises training;
  final ExerciseSimpleModel exercise;
  final DiaryDayExercise exerciseEdit;
  final DateTime dateTime;
}

class FillExerciseRoute extends MaterialPageRoute<DiaryDayExercise> {
  FillExerciseRoute(FillExerciseDependency dependency)
      : super(
          builder: (context) => Provider.value(
            value: dependency,
            child: const _FillExerciseView(),
          ),
        );
}

class _FillExerciseView extends StatelessWidget {
  const _FillExerciseView();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FillExerciseViewModel>.reactive(
      viewModelBuilder: () => FillExerciseViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: '',
          waiting: model.isBusy,
          backgroundColor: model.isEdit ? AppColors.greyF3 : AppColors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Text(
                model.exercise.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight,
              ),
              const SizedBox(height: 30.0),
              EditExerciseCard(
                controller: model.controller,
                exercise: model.exercise,
                userWeight: model.userWeight,
              ),
            ],
          ),
          footer: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (model.isEdit)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: AppButton(
                    onPressed: model.onDeleteTap,
                    text: Strings.current.delete_exercise,
                    color: AppColors.white,
                    style: [
                      AppStylesSmall.button1Regular,
                      AppStylesBig.button1Regular,
                    ].byHeight.copyWith(color: AppColors.error),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: AppButton(
                  onPressed: model.onSaveTap,
                  text: Strings.current.save,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
