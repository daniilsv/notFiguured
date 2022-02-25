import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/checkbox_card.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'first_start_measurements_viewmodel.dart';

class FirsStartMeasurementsView extends StatelessWidget {
  const FirsStartMeasurementsView();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FirsStartMeasurementsViewModel>.reactive(
      viewModelBuilder: () => FirsStartMeasurementsViewModel(context),
      builder: (context, model, child) {
        return AppScaffold(
          automaticallyImplyLeading: false,
          waiting: model.isBusy,
          contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
          title: Strings.current.measurements,
          backgroundColor: AppColors.greyF3,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: RichText(
                  text: TextSpan(
                      text: Strings.current.measurements_screen_description,
                      style: [AppStylesBig.body1Regular, AppStylesSmall.body1Regular]
                          .byHeight
                          .copyWith(color: AppColors.grey87),
                      children: [
                        const TextSpan(text: "\n\n"),
                        TextSpan(
                          text: Strings.current.choose_measurements_categories,
                          style: const TextStyle(color: AppColors.text),
                        ),
                        const TextSpan(text: " "),
                        TextSpan(text: Strings.current.you_can_change_measurements),
                      ]),
                ),
              ),
              ...MeasurementType.values
                  .map((e) => CheckboxCard(
                        title: e.name,
                        value: model.hasMeasurement(e),
                        onPressed: () =>
                            model.changeSet(e, value: !model.hasMeasurement(e)),
                      ))
                  .toList(),
              const SizedBox(height: 20),
            ],
          ),
          footer: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: AppButton(
              onPressed: model.selectedMeasurements.isNotEmpty ? model.save : null,
              text: Strings.current.save,
            ),
          ),
        );
      },
    );
  }
}
