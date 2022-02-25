import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/checkbox_card.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'settings_measurements_viewmodel.dart';

class SettingsMeasurementsRoute extends MaterialPageRoute {
  SettingsMeasurementsRoute()
      : super(
          builder: (context) => const SettingsMeasurementsView(),
        );
}

class SettingsMeasurementsView extends StatelessWidget {
  const SettingsMeasurementsView();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsMeasurementsViewModel>.reactive(
      viewModelBuilder: () => SettingsMeasurementsViewModel(context),
      builder: (context, model, child) {
        return Stack(
          children: [
            AppScaffold(
              waiting: model.isBusy,
              contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
              title: Strings.current.settings_measurements,
              backgroundColor: AppColors.greyF3,
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      Strings.current.choose_measurements_categories,
                      style: [AppStylesBig.body1Regular, AppStylesSmall.body1Regular]
                          .byHeight
                          .copyWith(color: AppColors.grey87),
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
                  const SizedBox(height: 120),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: AppButton(
                  onPressed: model.selectedMeasurements.isNotEmpty ? model.save : null,
                  text: "${Strings.current.save} (${model.selectedMeasurements.length})",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
