import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/diary_food/widgets/edit_product_card.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'fill_product_viewmodel.dart';

class FillProductDependency {
  FillProductDependency({
    this.day,
    this.date,
    this.product,
    this.productEdit,
    this.foodType,
  });
  final DiaryDayModel day;
  final DateTime date;
  ProductSimpleModel product;
  final DiaryProduct productEdit;
  final FoodType foodType;
}

class FillProductRoute extends MaterialPageRoute {
  FillProductRoute(FillProductDependency dependency)
      : super(
          builder: (context) => Provider.value(
            value: dependency,
            child: const _FillProductView(),
          ),
        );
}

class _FillProductView extends StatelessWidget {
  const _FillProductView();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FillProductViewModel>.reactive(
      viewModelBuilder: () => FillProductViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: '',
          waiting: model.isBusy,
          backgroundColor: model.isEdit ? AppColors.greyF3 : AppColors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Text(
                model.product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: [
                  AppStylesSmall.headline1Bold,
                  AppStylesBig.headline1Bold,
                ].byHeight,
              ),
              const SizedBox(height: 30.0),
              EditProductCard(
                controller: model.controller,
                product: model.product,
              ),
            ],
          ),
          footer: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (model.isEdit)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: AppButton(
                    onPressed: model.onDeleteTap,
                    text: Strings.current.delete_product,
                    color: AppColors.white,
                    style: [
                      AppStylesSmall.button1Regular,
                      AppStylesBig.button1Regular,
                    ].byHeight.copyWith(color: AppColors.error),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: AppButton(
                  onPressed: model.onSaveTap,
                  text: Strings.current.save,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
