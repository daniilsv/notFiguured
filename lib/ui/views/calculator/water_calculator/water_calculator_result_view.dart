import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/widgets/value_measure_text.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:notfiguured/ui/views/calculator/widgets/calculator_result_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'water_calculator_viewmodel.dart';

class CalculateWaterResultRoute extends MaterialPageRoute {
  CalculateWaterResultRoute(WaterCalculatorViewModel model)
      : super(
          builder: (context) => ChangeNotifierProvider.value(
            value: model,
            child: _WaterCalculatorResultView(),
          ),
          settings: const RouteSettings(name: 'calculate_water_result'),
        );
}

class _WaterCalculatorResultView extends ViewModelWidget<WaterCalculatorViewModel> {
  final Color mainColor = AppColors.lightBlue;

  @override
  Widget build(BuildContext context, WaterCalculatorViewModel model) {
    return CalculatorResultScaffold(
      mainColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 68.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Strings.current.your_water_daily_rate,
                  textAlign: TextAlign.center,
                  style: [
                    AppStylesSmall.headline1Bold,
                    AppStylesBig.headline1Bold,
                  ].byHeight.copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 25),
                Text(
                  "${model.result.average} ${model.result.sizeIn}",
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 72.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ValueMeasureText(
                      value: "${model.result.min} ${model.result.sizeIn}",
                      label: Strings.current.minimum,
                      textAlign: TextAlign.left,
                      withNewLine: true,
                    ),
                    ValueMeasureText(
                      value: "${model.result.max} ${model.result.sizeIn}",
                      label: Strings.current.maximum,
                      textAlign: TextAlign.right,
                      withNewLine: true,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Divider(),
                ),
                Wrap(
                  spacing: 25.0,
                  runSpacing: 18.0,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < model.glassesMaximum; i++)
                      SvgPicture.asset(
                        i < model.glassesCount
                            ? Assets.waterGlass
                            : Assets.waterGlassOutlined,
                      ),
                  ],
                ),
                const SizedBox(height: 25.0),
                Column(
                  children: [
                    Text(
                      "~ ${Strings.current.glasses_count_by_volume(model.glassesCount, Utils.getVolumeStr(model.glassVolume))}",
                      style: [
                        AppStylesSmall.body3Regular,
                        AppStylesBig.body3Regular,
                      ].byHeight.copyWith(color: AppColors.grey87),
                    ),
                    Text(
                      "~ ${Strings.current.bottles_count_by_volume(model.bottlesCount, Utils.getVolumeStr(model.bottleVolume))}",
                      style: [
                        AppStylesSmall.body3Regular,
                        AppStylesBig.body3Regular,
                      ].byHeight.copyWith(color: AppColors.grey87),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
