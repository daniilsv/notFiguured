import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/widgets/pie_chart.dart';
import 'package:notfiguured/ui/widgets/value_measure_text.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MacronutrionView extends StatelessWidget {
  final Macronutrition data;

  const MacronutrionView(
    this.data, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 180,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .4,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                    maxHeight: 150,
                  ),
                  child: PieChartWidget(
                    pieData: [
                      PieChartItem(
                        percent: data.protein,
                        color: AppColors.primary,
                      ),
                      PieChartItem(
                        percent: data.fat,
                        color: AppColors.lightPink,
                      ),
                      PieChartItem(
                        percent: data.carbohydrate,
                        color: AppColors.yellow,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  Assets.macronutrion,
                  height: 30,
                  width: 30,
                  color: AppColors.greyDC,
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueMeasureText(
                value: "${Utils.numToFixStr(data.protein)} ${data.sizeIn}",
                label: Strings.current.of_protein,
                withNewLine: true,
                textAlign: TextAlign.start,
                valueColor: AppColors.primary,
                valueTextStyle: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.primary),
              ),
              ValueMeasureText(
                value: "${Utils.numToFixStr(data.fat)} ${data.sizeIn}",
                label: Strings.current.of_fat,
                withNewLine: true,
                textAlign: TextAlign.start,
                valueColor: AppColors.lightPink,
                valueTextStyle: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.lightPink),
              ),
              ValueMeasureText(
                value: "${Utils.numToFixStr(data.carbohydrate)} ${data.sizeIn}",
                label: Strings.current.of_carbohydrate,
                withNewLine: true,
                textAlign: TextAlign.start,
                valueColor: AppColors.yellow,
                valueTextStyle: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight.copyWith(color: AppColors.yellow),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
