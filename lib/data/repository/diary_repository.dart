import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:get_storage/get_storage.dart';

class DiaryRepository {
  final weight = ReadWriteValue<TargetWeightModel>(
    'target_weight',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : TargetWeightModel.fromJson(json),
  );
  final calories = ReadWriteValue<TargetCalorieModel>(
    'target_calories',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : TargetCalorieModel.fromJson(json),
  );
  final macro = ReadWriteValue<TargetMacroModel>(
    'target_macro',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : TargetMacroModel.fromJson(json),
  );
  final current = ReadWriteValue<TargetCurrentFactModel>(
    'target_current',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : TargetCurrentFactModel.fromJson(json),
  );

  void clean() {
    calories.val = null;
    macro.val = null;
    weight.val = null;
    current.val = null;
    print('DiaryRepository clean');
  }
}
