import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/datezone/widgets/search_field.dart';
import 'package:notfiguured/ui/views/diary_exercise/widgets/simple_exercise.dart';
import 'package:notfiguured/ui/widgets/app_bar_flexible.dart';
import 'package:notfiguured/ui/widgets/loading.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:stacked/stacked.dart';

import 'pick_exercise_viewmodel.dart';

class PickExerciseRoute extends MaterialPageRoute<ExerciseSimpleModel> {
  PickExerciseRoute({DiaryDayExercises training})
      : super(builder: (context) => PickExerciseView(training: training));
}

class PickExerciseView extends StatelessWidget {
  const PickExerciseView({this.training});
  final DiaryDayExercises training;
  @override
  Widget build(BuildContext context) {
    const hPadding = AppPaddings.h25;
    return ViewModelBuilder<PickExerciseViewModel>.reactive(
      viewModelBuilder: () => PickExerciseViewModel(context, training: training),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Material(
            child: Stack(
              children: [
                CupertinoPageScaffold(
                  backgroundColor: AppColors.white,
                  child: SafeArea(
                    bottom: false,
                    child: CustomScrollView(
                      slivers: [
                        SliverVisibility(
                          visible: !model.keyboardVisible,
                          sliver: SliverAppBar(
                            elevation: 0,
                            expandedHeight: 80,
                            backgroundColor: AppColors.white,
                            automaticallyImplyLeading: false,
                            flexibleSpace: AppBarFlexible(
                              title: Strings.current.add_exercises,
                              showAction: MediaQuery.of(context).viewInsets.bottom == 0,
                            ),
                          ),
                        ),
                        SliverStickyHeader(
                          header: Padding(
                            padding: EdgeInsets.only(
                                  top: [25.0, 30.0].byHeight,
                                  bottom: [20.0, 25.0].byHeight,
                                ) +
                                hPadding,
                            child: SearchTextField(
                              textEditingController: model.searchController,
                            ),
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) => Padding(
                                padding: const EdgeInsets.only(bottom: 8) + hPadding,
                                child: SimpleExerciseWidget(
                                  exercise: model.foundExercises[index],
                                  onTap: model.onExerciseTap,
                                  searchText: model.searchController.text,
                                  userWeight: model.userWeight,
                                ),
                              ),
                              childCount: model.foundExercises.length,
                            ),
                          ),
                        ),
                        if (model.exercisesNotFound)
                          SliverToBoxAdapter(
                            child: Text(
                              Strings.current.exercises_not_found,
                              style: [
                                AppStylesSmall.body1Regular,
                                AppStylesBig.body1Regular,
                              ].byHeight.copyWith(color: AppColors.grey87),
                              textAlign: TextAlign.center,
                            ),
                          )
                        else if (model.isEmptyList)
                          SliverToBoxAdapter(
                            child: Text(
                              Strings.current.start_fill_exercise_name,
                              style: [
                                AppStylesSmall.body1Regular,
                                AppStylesBig.body1Regular,
                              ].byHeight.copyWith(color: AppColors.grey87),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        const SliverToBoxAdapter(
                          child: SafeArea(
                            top: false,
                            child: SizedBox(height: 120),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                LoadingOverlay(isBusy: model.isBusy),
              ],
            ),
          ),
        );
      },
    );
  }
}
