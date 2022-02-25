import 'package:flutter/material.dart';
import 'package:notfiguured/ui/theme/assets.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'widgets/percent_input.dart';

class MacronutritionInputComponent extends StatefulWidget {
  const MacronutritionInputComponent({
    Key key,
    this.onChange,
    this.initProtein = 20,
    this.initFat = 30,
    this.initCarbohydrates = 50,
  }) : super(key: key);
  final void Function(
    double protein,
    double fat,
    double carbohydrates,
  ) onChange;
  final double initProtein;
  final double initFat;
  final double initCarbohydrates;

  @override
  _MacronutritionInputComponentState createState() =>
      _MacronutritionInputComponentState();
}

class _MacronutritionInputComponentState extends State<MacronutritionInputComponent> {
  final proteinFocusNode = FocusNode();
  final fatFocusNode = FocusNode();
  final carbohydratesFocusNode = FocusNode();

  TextEditingController proteinController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController carbohydratesController = TextEditingController();

  double get protein => double.tryParse(proteinController.text) ?? 0;
  double get fat => double.tryParse(fatController.text) ?? 0;
  double get carbohydrates => double.tryParse(carbohydratesController.text) ?? 0;

  List<PieChartItem> get pieData => [
        PieChartItem(percent: protein, color: AppColors.primary),
        PieChartItem(percent: fat, color: AppColors.lightPink),
        PieChartItem(percent: carbohydrates, color: AppColors.yellow),
      ];

  bool get hasInputError =>
      (protein + fat + carbohydrates) != 100 ||
      protein < 0 ||
      fat < 0 ||
      carbohydrates < 0;

  Color get proteinUnitsColor =>
      proteinFocusNode.hasFocus ? AppColors.black : AppColors.greyDC;
  Color get fatUnitsColor => fatFocusNode.hasFocus ? AppColors.black : AppColors.greyDC;
  Color get carbohydratesUnitsColor =>
      carbohydratesFocusNode.hasFocus ? AppColors.black : AppColors.greyDC;

  @override
  void initState() {
    setInitValues();
    proteinController.addListener(notify);
    fatController.addListener(notify);
    carbohydratesController.addListener(notify);
    proteinFocusNode.addListener(() => setState(() {}));
    fatFocusNode.addListener(() => setState(() {}));
    carbohydratesFocusNode.addListener(() => setState(() {}));
    super.initState();
  }

  void notify() {
    widget.onChange(protein, fat, carbohydrates);
    setState(() {});
  }

  void setInitValues() {
    proteinController =
        TextEditingController(text: widget.initProtein.floor()?.toString() ?? '');
    fatController = TextEditingController(text: widget.initFat.floor()?.toString() ?? '');
    carbohydratesController =
        TextEditingController(text: widget.initCarbohydrates.floor()?.toString() ?? '');
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant MacronutritionInputComponent oldWidget) {
    if (oldWidget.initProtein != widget.initProtein ||
        oldWidget.initFat != widget.initFat ||
        oldWidget.initCarbohydrates != widget.initCarbohydrates) {
      setInitValues();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    proteinController.dispose();
    fatController.dispose();
    carbohydratesController.dispose();
    proteinFocusNode.dispose();
    fatFocusNode.dispose();
    carbohydratesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        CupertinoButton(
          color: AppColors.white,
          disabledColor: AppColors.white,
          pressedOpacity: 0.7,
          onPressed: () {},
          minSize: 0,
          padding: AppPaddings.v35h30,
          borderRadius: AppBorderRadius.calculatorCard,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 150,
                        maxHeight: 150,
                      ),
                      child: PieChartWidget(
                        pieData: pieData,
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
                children: [
                  PercentInputWidget(
                    controller: proteinController,
                    focusNode: proteinFocusNode,
                    pointColor: AppColors.primary,
                    unitsColor: proteinUnitsColor,
                    title: 'Белков',
                    hasError: hasInputError,
                  ),
                  const SizedBox(height: 15),
                  PercentInputWidget(
                    controller: fatController,
                    focusNode: fatFocusNode,
                    pointColor: AppColors.lightPink,
                    unitsColor: fatUnitsColor,
                    title: 'Жиров',
                    hasError: hasInputError,
                  ),
                  const SizedBox(height: 15),
                  PercentInputWidget(
                    controller: carbohydratesController,
                    focusNode: carbohydratesFocusNode,
                    pointColor: AppColors.yellow,
                    unitsColor: carbohydratesUnitsColor,
                    title: 'Углеводов',
                    hasError: hasInputError,
                  ),
                ],
              ),
            ],
          ),
        ),
        if (hasInputError) ...[
          const SizedBox(height: 25),
          Text(
            'Сумма процентов белков, жиров, углеводов должна составлять 100%.',
            textAlign: TextAlign.center,
            style: [
              AppStylesSmall.body3Regular,
              AppStylesBig.body3Regular,
            ].byHeight.copyWith(color: AppColors.error),
          ),
          const SizedBox(height: 20),
        ],
        const SizedBox(height: 5),
      ],
    );
  }
}
