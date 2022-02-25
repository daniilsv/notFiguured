import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'debug_menu_viewmodel.dart';

class DebugMenuRoute extends MaterialPageRoute {
  DebugMenuRoute()
      : super(
          builder: (context) => const DebugMenuView(),
          settings: const RouteSettings(name: 'debug_menu'),
        );
}

class DebugMenuView extends StatelessWidget {
  const DebugMenuView();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DebugMenuViewModel>.reactive(
      viewModelBuilder: () => DebugMenuViewModel(context),
      builder: (context, model, child) {
        return AppScaffold(
            body: Column(
          children: [
            Column(
              children: [
                const Text("Цели"),
                Wrap(
                  children: [
                    FlatButton(
                      onPressed: model.removeMacronutritionGoal,
                      child: const Text("удалить БЖУ"),
                    ),
                    FlatButton(
                      onPressed: model.removeCaloriesGoal,
                      child: const Text("удалить калории"),
                    ),
                    FlatButton(
                      onPressed: model.removeWeughtGoal,
                      child: const Text("удалить вес"),
                    ),
                    FlatButton(
                      onPressed: model.fetchTargets,
                      child: const Text("запросить с бэка все цели"),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const Text("Замеры"),
                Wrap(
                  children: [
                    FlatButton(
                      onPressed: model.clearViewdMeasurements,
                      child: const Text("Отчистить список видимых замеров"),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
          ],
        ));
      },
    );
  }
}
