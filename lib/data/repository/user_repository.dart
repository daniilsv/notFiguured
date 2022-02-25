import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository {
  final userModel = ReadWriteValue<UserProfileModel>(
    'user',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : UserProfileModel.fromJson(json),
  );
  final showGoalOnboarding = ReadWriteValue<bool>(
    'showGoalOnboarding',
    true,
    encoder: (model) => model ?? true,
    decoder: (_json) => _json ?? true,
  );

  void updateUserAccountData(
      UserAccountData data, double height, double weight, Activity activity) {
    userModel.val = userModel.val.copyWith(
        userAccountData: data, height: height, weight: weight, activity: activity);
  }

  void updateUserAccountDataField(
      {String email,
      String nickName,
      String firstName,
      String lastName,
      String picture,
      Sex sex,
      DateTime birthday,
      String timezone,
      double height,
      double weight,
      Activity activity}) {
    final u = userModel.val.userAccountData;
    updateUserAccountData(
        userModel.val.userAccountData.copyWith(), height, weight, activity);
    userModel.val = userModel.val.copyWith(
        userAccountData: UserAccountData(
          birthday: birthday ?? u.birthday,
          email: email ?? u.email,
          firstName: firstName ?? u.firstName,
          lastName: lastName ?? u.lastName,
          nickName: nickName ?? u.nickName,
          picture: picture ?? u.picture,
          sex: sex ?? u.sex,
          timezone: timezone ?? u.timezone,
        ),
        height: height,
        weight: weight,
        activity: activity);
  }

  void clean() {
    userModel.val = null;
    showGoalOnboarding.val = null;
    print('UserRepository clean');
  }
}
