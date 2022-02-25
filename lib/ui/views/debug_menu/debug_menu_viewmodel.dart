import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DebugMenuViewModel extends AppViewModel {
  DebugMenuViewModel(this.context) : super(context) {
    measurementsService = context.read<MeasurementsService>();
    diaryService = context.read<DiaryService>();
    api = context.read<Api>();
  }

  BuildContext context;
  DiaryService diaryService;
  MeasurementsService measurementsService;

  Future removeCaloriesGoal() async {
    await api.api.v1TargetDeleteTargetCaloriePost(body: null);
    await diaryService.fetch();
    showTopSnackBar(
      context,
      const CustomSnackBar.success(message: "цель по калориям удалена"),
    );
  }

  Future removeMacronutritionGoal() async {
    await api.api.v1TargetDeleteTargetMacroPost(body: null);
    await diaryService.fetch();
    showTopSnackBar(
      context,
      const CustomSnackBar.success(message: "цель по БЖУ удалена"),
    );
  }

  Future removeWeughtGoal() async {
    await api.api.v1TargetDeleteTargetWeightPost(body: null);
    await diaryService.fetch();
    showTopSnackBar(
      context,
      const CustomSnackBar.success(message: "цель по весу удалена"),
    );
  }

  Future fetchTargets() async {
    await diaryService.fetch();
    showTopSnackBar(
      context,
      const CustomSnackBar.success(message: "цели обновлены"),
    );
  }

  void clearViewdMeasurements() {
    measurementsService.repository.viewedMeasurements.val = null;
    showTopSnackBar(
      context,
      const CustomSnackBar.success(message: "список видимых замеров отчищен"),
    );
  }

  @override
  void errorRequest([int errorStatus]) {}
}
