import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'macro_proportions_view.dart';

class MacroProportionsViewModel extends AppViewModel {
  String initMacroProportion;
  MacroProportionModel selectedMacroProportion;
  List<MacroProportionModel> macroProportions;

  MacroProportionsViewModel([BuildContext context]) : super(context) {
    final dep = context.read<MacroProportionsRouteDependency>();
    initMacroProportion = dep?.initMacroProportion;
  }

  Future<void> onReady() async {
    makeRequest(
      makeRequest: () async {
        final res = await api.api.v1CalculatorGetMacroProportionsPost(body: null);
        macroProportions = res.body;
        selectedMacroProportion = macroProportions.firstWhere(
          (e) => e.name == initMacroProportion,
          orElse: () => null,
        );
        notifyListeners();
      },
    );
  }

  void setMacroProportion(MacroProportionModel model) {
    selectedMacroProportion = model;
    notifyListeners();
  }

  void done() => navigator.pop<MacroProportionModel>(selectedMacroProportion);

  @override
  void errorRequest([int errorStatus]) {}
}
