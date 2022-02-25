import 'package:notfiguured/abs/app_exception.dart';
import 'package:notfiguured/abs/app_viewmodel.dart';
import 'package:notfiguured/data/repository/user_repository.dart';
import 'package:notfiguured/data/services/diary_service.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/pickers/decimal/decimal_view.dart';
import 'package:notfiguured/ui/views/calculator/weight_calculator/weight_calculator_view.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../goal_create.dart';

class WeightGoalCreateViewModel extends AppViewModel {
  WeightGoalCreateViewModel([BuildContext context]) : super(context) {
    predefined = context.read<PredefinedGoalData>();
    final userRepository = context.read<UserRepository>();
    if (userRepository.userModel.val != null)
      now = userRepository.userModel.val.weight ?? 50;
    if (predefined?.goal != null) goal = predefined.goal;
    if (predefined?.weight != null) now = predefined.weight;
    diaryService = context.read<DiaryService>();
  }
  DiaryService diaryService;
  PredefinedGoalData predefined;

  double now = 50;
  double goal = 50;

  Future<void> onReady() async {}

  Future<void> onNowTap() async {
    final ret = await showDecimalPicker(
      navigator.context,
      title: Strings.current.weight,
      suffixText: Strings.current.kg,
      minValue: 20,
      maxValue: 220,
      initialValue: now ?? 50,
    );
    if (ret == null) return;
    now = ret;
    notifyListeners();
  }

  Future<void> onGoalTap() async {
    final ret = await showDecimalPicker(
      navigator.context,
      title: Strings.current.weight,
      suffixText: Strings.current.kg,
      minValue: 20,
      maxValue: 220,
      initialValue: goal ?? 50,
    );
    if (ret == null) return;
    goal = ret;
    notifyListeners();
  }

  Future<void> create() async {
    makeRequest(
        makeRequest: () async {
          final resp1 = await api.api.v1TargetSaveTargetWeightPost(
            body: TargetWeightModel(
              startWeight: now,
              endWeight: goal,
              startDate: DateTime.now(),
              endDate: Jiffy().add(months: 1),
            ),
          );
          if (!resp1.isSuccessful) throw BadRequestException(resp1);
          final resp2 =
              await api.api.v1MeasureSaveMeasurePost(body: MeasureModel(weight: now));
          if (!resp2.isSuccessful) throw BadRequestException(resp2);
          diaryService.saveWeightHeight(now, predefined?.height);
          diaryService.fetch();
          if (predefined?.popAfter ?? false) {
            navigator.pop();
          } else {
            navigator.popUntil((route) {
              return route.settings?.name?.toLowerCase()?.contains('root') ?? false;
            });
          }
        },
        finalFunc: () => setBusy(false));
  }

  Future<void> calculate() async {
    final res = await navigator.push(CalculateWeightRoute(true));
    if (res != null) {
      goal = res;
      notifyListeners();
    }
  }

  @override
  void errorRequest([int errorStatus]) {}
}
