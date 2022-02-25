import 'package:chopper_api/api/swagger_api.swagger.dart';

extension UserUpExtension on UserAccountData {
  UserAccountData copyWith({
    String email,
    String nickName,
    String firstName,
    String lastName,
    String picture,
    String sex,
    DateTime birthday,
    String timezone,
  }) {
    final t = this;
    return UserAccountData(
      birthday: birthday ?? t.birthday,
      email: email ?? t.email,
      firstName: firstName ?? t.firstName,
      lastName: lastName ?? t.lastName,
      nickName: nickName ?? t.nickName,
      picture: picture ?? t.picture,
      sex: sex ?? t.sex,
      timezone: timezone ?? t.timezone,
    );
  }
}
