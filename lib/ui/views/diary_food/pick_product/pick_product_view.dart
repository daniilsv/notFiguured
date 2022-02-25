import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/datezone/widgets/search_field.dart';
import 'package:notfiguured/ui/views/diary_food/fill_product/fill_product_view.dart';
import 'package:notfiguured/ui/views/diary_food/widgets/simple_product.dart';
import 'package:notfiguured/ui/widgets/app_bar_flexible.dart';
import 'package:notfiguured/ui/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:stacked/stacked.dart';

import 'pick_product_viewmodel.dart';

class PickProductRoute extends MaterialPageRoute {
  PickProductRoute(FillProductDependency dep)
      : super(builder: (context) => PickProductView(dep: dep));
}

class PickProductView extends StatelessWidget {
  final FillProductDependency dep;

  const PickProductView({
    @required this.dep,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const hPadding = AppPaddings.h25;
    return ViewModelBuilder<PickProductViewModel>.reactive(
      viewModelBuilder: () => PickProductViewModel(context, dep),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Material(
            child: Stack(
              children: [
                CupertinoPageScaffold(
                  backgroundColor: AppColors.white,
                  child: SafeArea(
                    bottom: false,
                    child: CustomScrollView(
                      slivers: [
                        SliverVisibility(
                          visible: !model.keyboardVisible,
                          sliver: SliverAppBar(
                            elevation: 0,
                            expandedHeight: 100,
                            backgroundColor: AppColors.white,
                            automaticallyImplyLeading: false,
                            flexibleSpace: AppBarFlexible(
                              title: Strings.current.add_products,
                              showAction: MediaQuery.of(context).viewInsets.bottom == 0,
                            ),
                          ),
                        ),
                        SliverStickyHeader(
                          header: Padding(
                            padding: EdgeInsets.only(
                                  top: [25.0, 30.0].byHeight,
                                  bottom: [20.0, 25.0].byHeight,
                                ) +
                                hPadding,
                            child: SearchTextField(
                              textEditingController: model.searchController,
                            ),
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) => Padding(
                                padding: const EdgeInsets.only(bottom: 8) + hPadding,
                                child: SimpleProductWidget(
                                  product: model.foundProducts[index],
                                  onTap: model.onProductTap,
                                  searchText: model.searchController.text,
                                ),
                              ),
                              childCount: model.foundProducts.length,
                            ),
                          ),
                        ),
                        SliverVisibility(
                          visible: model.showLastProducts,
                          sliver: SliverStickyHeader(
                            sticky: model.keyboardVisible,
                            header: Padding(
                              padding: const EdgeInsets.only(bottom: 15) + hPadding,
                              child: Text(
                                Strings.current.last_adding,
                                style: [
                                  AppStylesSmall.body3Medium,
                                  AppStylesBig.body3Medium,
                                ].byHeight.copyWith(color: AppColors.grey87),
                              ),
                            ),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8) + hPadding,
                                  child: SimpleProductWidget(
                                    product: model.lastProducts[index],
                                    onTap: model.onProductTap,
                                  ),
                                ),
                                childCount: model.lastProducts.length,
                              ),
                            ),
                          ),
                        ),
                        if (model.productsNotFound)
                          SliverToBoxAdapter(
                            child: Text(
                              Strings.current.products_not_found,
                              style: [
                                AppStylesSmall.body1Regular,
                                AppStylesBig.body1Regular,
                              ].byHeight.copyWith(color: AppColors.grey87),
                              textAlign: TextAlign.center,
                            ),
                          )
                        else if (model.isEmptyList)
                          SliverToBoxAdapter(
                            child: Text(
                              Strings.current.start_fill_product_name,
                              style: [
                                AppStylesSmall.body1Regular,
                                AppStylesBig.body1Regular,
                              ].byHeight.copyWith(color: AppColors.grey87),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        const SliverToBoxAdapter(
                          child: SafeArea(
                            top: false,
                            child: SizedBox(height: 120),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                LoadingOverlay(isBusy: model.isBusy),
              ],
            ),
          ),
        );
      },
    );
  }
}
