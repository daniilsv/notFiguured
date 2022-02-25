import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary_exercise/widgets/dismissible_exercise.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/inline_button.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/tappable_area.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'training_viewmodel.dart';

class TrainingRoute extends MaterialPageRoute {
  TrainingRoute({DateTime date})
      : super(
          builder: (context) => TrainingView(date: date),
        );
}

class TrainingView extends StatelessWidget {
  final DateTime date;

  const TrainingView({this.date});

  @override
  Widget build(BuildContext context) {
    final textStyle = [
      AppStylesBig.body3Medium,
      AppStylesSmall.body3Medium,
    ].byHeight;
    final textStyleGreen =
        textStyle.copyWith(color: AppColors.green, fontWeight: FontWeight.w700);
    return ViewModelBuilder<TrainingViewModel>.reactive(
      viewModelBuilder: () => TrainingViewModel(context, date: date),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: model.training == null ? 'Ваша тренировка' : 'Тренировка',
          appBarAction: model.training == null
              ? null
              : AppInlineButton(
                  onTap: model.cancel,
                  text: 'Удалить',
                ),
          automaticallyImplyLeading: model.training == null,
          waiting: model.isBusy,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24.0),
              PickerCard(
                title: '${Strings.current.date}:',
                value: model.dateString,
                fullValueText: true,
                onPressed: model.onDateTap,
              ),
              if (model.training != null) ...[
                const Divider(
                  height: 50,
                  color: AppColors.greyDC,
                  thickness: 1,
                ),
                Text(
                  'Ваши упражнения:',
                  style: [
                    AppStylesBig.headline2Bold,
                    AppStylesSmall.headline2Bold,
                  ].byHeight,
                ),
                const SizedBox(height: 20.0),
                for (final exercise in model.training.exercises)
                  ExerciseDismissibleCard(
                    exercise: exercise,
                    onTap: model.onExerciseTap,
                    onDelete: model.onExerciseDelete,
                    userWeight: model.userWeight,
                  ),
                const Divider(
                  height: 50,
                  color: AppColors.greyDC,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'За тренировку Вы сожгли:',
                        style: textStyle,
                      ),
                    ),
                    Text(
                      Utils.getKaloriesStr(model.totalBurn),
                      style: textStyleGreen,
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                TappableArea(
                  onTap: model.addProducts,
                  label: Strings.current.add_exercise,
                  color: AppColors.primary,
                ),
              ],
            ],
          ),
          footer: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: AppButton(
                  onPressed: model.training == null ? model.addProducts : model.save,
                  text: model.training == null
                      ? Strings.current.add_exercises
                      : Strings.current.save,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
