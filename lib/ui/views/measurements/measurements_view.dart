import 'package:auto_size_text/auto_size_text.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/measurements/first_start/first_start_measurements_view.dart';
import 'package:notfiguured/ui/widgets/calendar_rolling_strip.dart';
import 'package:notfiguured/ui/widgets/inline_button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/value_measure_card.dart';
import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'measurements_viewmodel.dart';

class MeasurementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeasurementsViewModel>.reactive(
      viewModelBuilder: () => MeasurementsViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        if (!model.hasChoosenMeasurements)
          return const FirsStartMeasurementsView();
        else
          return GestureDetector(
            child: AppScaffold(
              title: Strings.current.measurements,
              waiting: model.isBusy,
              appBarAction: AppInlineButton(
                text: Strings.current.settings,
                onTap: model.toSettingsMeasurement,
              ),
              stickyHeader: CalendarRollingStrip(
                height: 88.0,
                from: model.minRollingDate,
                to: model.maxRollingDate,
                value: model.currentRollingDate,
                onChange: model.changeDate,
                markedDates: model.markedDates,
              ),
              body: Column(
                children: model.viewedMeasurements
                    .map(
                      (measurement) => ValueMeasureCard(
                        label: measurement.name,
                        value: measurement.getValueInUnits(model.currentMeasurements),
                        valueColor: AppColors.primary,
                        onPressed: () => model.toDetailMeasurement(measurement),
                      ),
                    )
                    .toList(),
              ),
              footer: model.hasNoChoosenMeasurements
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          CupertinoButton(
                            onPressed: model.toSettingsMeasurement,
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            child: DottedBorder(
                              dashPattern: const [6, 6],
                              strokeWidth: 2,
                              color: AppColors.greyB8,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15.0),
                              padding: const EdgeInsets.symmetric(
                                vertical: 25.0,
                                horizontal: 38.0,
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 22,
                                  child: AutoSizeText(
                                    Strings.current.add_measurement_category,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    stepGranularity: 0.1,
                                    style: [
                                      AppStylesSmall.button1Regular,
                                      AppStylesBig.button1Regular,
                                    ].byHeight.copyWith(color: AppColors.greyB8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          );
      },
    );
  }
}
