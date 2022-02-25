import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'macro_proportions_viewmodel.dart';

class MacroProportionsRouteDependency {
  MacroProportionsRouteDependency({
    this.initMacroProportion,
  });
  final String initMacroProportion;
}

class MacroProportionsRoute<MacroProportionModel>
    extends MaterialPageRoute<MacroProportionModel> {
  MacroProportionsRoute({MacroProportionsRouteDependency dependency})
      : super(
          builder: (context) => Provider.value(
            value: dependency,
            child: MacroProportionsView(),
          ),
          settings: const RouteSettings(name: 'macro_proportions'),
        );
}

class MacroProportionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MacroProportionsViewModel>.reactive(
      viewModelBuilder: () => MacroProportionsViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: 'Соотношение БЖУ',
          waiting: model.isBusy,
          expandedAppBarHeight: 96,
          contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
          onBackButton: () => Navigator.pop(context),
          body: Padding(
            padding: const EdgeInsets.only(top: 43, bottom: 30),
            child: Column(
              children: List.generate(
                model.macroProportions?.length ?? 0,
                (index) {
                  final MacroProportionModel mp = model.macroProportions[index];
                  final bool isSelected = mp == model.selectedMacroProportion;
                  return Padding(
                    padding: AppPaddings.v5,
                    child: CupertinoButton(
                      onPressed: () => model.setMacroProportion(mp),
                      color: isSelected ? AppColors.primary : AppColors.greyF3,
                      padding: const EdgeInsets.symmetric(
                        vertical: 27,
                        horizontal: 23,
                      ),
                      child: Row(
                        children: [
                          if (isSelected)
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            )
                          else
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.greyB8,
                                ),
                              ),
                            ),
                          const SizedBox(width: 20),
                          Flexible(
                            child: Text(
                              mp.name,
                              style: [
                                AppStylesSmall.body3Medium,
                                AppStylesBig.body3Medium,
                              ].byHeight.copyWith(
                                    color: isSelected ? AppColors.white : AppColors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          footer: SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  onPressed: model.done,
                  text: Strings.current.save,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
