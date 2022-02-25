import 'package:notfiguured/data/model/enum/measurements.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/input_card.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:notfiguured/ui/widgets/property_value.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';

import 'add_measurement_viewmodel.dart';

class AddMeasurementRoute extends MaterialPageRoute {
  AddMeasurementRoute(MeasurementType measurementType,
      {Color color = AppColors.primary, DateTime date})
      : super(
          builder: (context) => AddMeasurementView(
            measurementType: measurementType,
            mainColor: color,
            date: date,
          ),
        );
}

class AddMeasurementView extends StatelessWidget {
  final MeasurementType measurementType;
  final Color mainColor;
  final DateTime date;

  const AddMeasurementView({
    @required this.measurementType,
    this.mainColor = AppColors.primary,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddMeasurementViewModel>.reactive(
      viewModelBuilder: () => AddMeasurementViewModel(context, measurementType, date),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: "${Strings.current.renewed} ${measurementType.name.toLowerCase()}",
          waiting: model.isBusy,
          body: Column(
            children: [
              const SizedBox(height: 30.0),
              PickerCard(
                title: '${Strings.current.date_of_measurement}:',
                value: Jiffy(model.selectedDate).format("dd.MM.yyyy"),
                onPressed: model.selectDate,
              ),
              InputCard(
                title: '${measurementType.name}:',
                value: Utils.numToFixStr(model.currentValue, 1),
                units: measurementType.units,
                editable: true,
                onTextChange: model.onValueChanged,
              ),
              PropertyValue(
                "${Strings.current.last_measurement}:",
                model.currentValueInUnits,
                highlightedValue: false,
              ),
            ],
          ),
          footer: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  onPressed: model.save,
                  text: Strings.current.save,
                  color: mainColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
