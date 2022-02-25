import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/datezone/widgets/search_field.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'datezone_viewmodel.dart';
import 'widgets/search_list_tile.dart';

class DatezoneRoute extends MaterialPageRoute<MapEntry<String, String>> {
  DatezoneRoute()
      : super(
          builder: (context) => DatezoneView(),
          settings: const RouteSettings(name: 'datezone'),
        );
}

class DatezoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: ViewModelBuilder<DatezoneViewModel>.reactive(
        viewModelBuilder: () => DatezoneViewModel(context),
        builder: (context, model, child) {
          return Material(
            color: AppColors.white,
            child: Column(
              children: [
                const SafeArea(child: SizedBox(height: 25)),
                Padding(
                  padding: [
                    AppPaddings.h25,
                    AppPaddings.h30,
                  ].byHeight,
                  child: SearchTextField(
                    textEditingController: model.searchController,
                  ),
                ),
                const SizedBox(height: 25),
                if (model.filteredKeys.isEmpty)
                  Padding(
                    padding: [
                      AppPaddings.h25,
                      AppPaddings.h30,
                    ].byHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            Strings.current.search_empty,
                            style: [
                              AppStylesSmall.body1Regular,
                              AppStylesBig.body1Regular,
                            ].byHeight.copyWith(
                                  color: AppColors.grey87,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                else ...[
                  const Divider(color: AppColors.greyDC),
                  Expanded(
                    child: ListView.separated(
                      padding: AppPaddings.b20t10,
                      itemBuilder: (context, index) => SearchListTile(
                        title: model.filteredTimezones[model.filteredKeys[index]],
                        searchValue: model.search,
                        onTap: () => model.done(model.filteredKeys[index]),
                      ),
                      separatorBuilder: (context, index) => Padding(
                        padding: [
                          AppPaddings.h25,
                          AppPaddings.h30,
                        ].byHeight,
                        child: const Divider(color: AppColors.greyDC),
                      ),
                      itemCount: model.filteredKeys.length,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
