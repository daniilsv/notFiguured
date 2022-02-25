import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary_food/widgets/dismissible_product.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/inline_button.dart';
import 'package:notfiguured/ui/widgets/macronutrition_strip.dart';
import 'package:notfiguured/ui/widgets/picker_card.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/tappable_area.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'meal_viewmodel.dart';

class MealRoute extends MaterialPageRoute {
  MealRoute({DateTime date}) : super(builder: (context) => MealView(date: date));
}

class MealView extends StatelessWidget {
  final DateTime date;

  const MealView({this.date});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealViewModel>.reactive(
      viewModelBuilder: () => MealViewModel(context, date: date),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: model.container == null ? Strings.current.new_meal : 'Изменить запись',
          appBarAction: model.container == null
              ? null
              : AppInlineButton(onTap: model.cancel, text: 'Удалить'),
          automaticallyImplyLeading: model.container == null,
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
              PickerCard(
                title: "${Strings.current.time}:",
                value: model.timeString,
                onPressed: model.onTimeTap,
              ),
              PickerCard(
                title: "${Strings.current.meal}:",
                value: model.foodTypeString,
                onPressed: model.onFoodTypeTap,
              ),
              if (model.container?.products?.isNotEmpty ?? false) ...[
                const Divider(
                  height: 50,
                  color: AppColors.greyDC,
                  thickness: 1,
                ),
                Text(
                  'Ваши продукты:',
                  style: [
                    AppStylesBig.headline2Bold,
                    AppStylesSmall.headline2Bold,
                  ].byHeight,
                ),
                const SizedBox(height: 20.0),
                for (final product in model.container?.products ?? [])
                  ProductDismissibleCard(
                    product: product,
                    onTap: model.onProductTap,
                    onDelete: model.onProductDelete,
                  ),
                const Divider(
                  height: 50,
                  color: AppColors.greyDC,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: MacronutritionStrip(
                    calories: model.calorieTotal,
                    protein: model.proteinTotal,
                    fat: model.fatTotal,
                    carb: model.carbTotal,
                  ),
                ),
                const SizedBox(height: 35),
                TappableArea(
                  onTap: model.addProducts,
                  label: Strings.current.add_product,
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
                  onPressed: model.container == null ? model.addProducts : model.save,
                  text: model.container == null
                      ? Strings.current.add_products
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
