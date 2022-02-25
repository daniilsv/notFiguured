import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'swagger_api.enums.swagger.dart' as enums;
export 'swagger_api.enums.swagger.dart';

part 'swagger_api.swagger.chopper.dart';
part 'swagger_api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class SwaggerApi extends ChopperService {
  static SwaggerApi create([ChopperClient client]) {
    if (client != null) {
      return _$SwaggerApi(client);
    }

    final newClient = ChopperClient(
        services: [_$SwaggerApi()],
        converter: JsonSerializableConverter(),
        baseUrl: 'https://null');
    return _$SwaggerApi(newClient);
  }

  ///Осуществляет вход пользователя через email и пароль
  ///@param body

  @Post(path: '/v1/Account/Login')
  Future<chopper.Response<AuthorizationTokens>> v1AccountLoginPost(
      {@Body() @required LoginModel body});

  ///Осуществляет вход пользователя через Facebook. Если пользователь не был ранее зарегистрирован, проводится регистрация.  Проверить токен можно здесь   https://graph.facebook.com/me?fields=id,first_name,last_name,email,birthday,gender,picture.width(100).height(100)&access_token=XYZ123
  ///@param body

  @Post(path: '/v1/Account/FacebookLogin')
  Future<chopper.Response<AuthorizationTokens>> v1AccountFacebookLoginPost(
      {@Body() @required FacebookLogin body});

  ///Осуществляет вход пользователя через Apple. Если пользователь не был ранее зарегистрирован, проводится регистрация.
  ///@param body

  @Post(path: '/v1/Account/AppleLogin')
  Future<chopper.Response<AuthorizationTokens>> v1AccountAppleLoginPost(
      {@Body() @required AppleModel body});

  ///Осуществляет вход пользователя через Google. Если пользователь не был ранее зарегистрирован, проводится регистрация.  Проверить токен можно здесь   https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=XYZ123.  Проверить дополнительные поля Birthday и Gender можно здесь  https://people.googleapis.com/v1/people/XYZ?personFields=photos,names,birthdays,genders&access_token=XYZ123.
  ///@param body

  @Post(path: '/v1/Account/GoogleLogin')
  Future<chopper.Response<AuthorizationTokens>> v1AccountGoogleLoginPost(
      {@Body() @required GoogleLogin body});

  ///Осуществляет вход пользователя через VKontakte с запросом дополнительных прав email. Если пользователь не был ранее зарегистрирован, проводится регистрация.   https://oauth.vk.com/authorize?client_id=XXX&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=email&response_type=token&v=5.126.  Есть 2 способа авторизации - через code и callback на сервер или через токен. Данный метод реализован через токен.
  ///@param body

  @Post(path: '/v1/Account/VKontakteLogin')
  Future<chopper.Response<AuthorizationTokens>> v1AccountVkontakteLoginPost(
      {@Body() @required VkLogin body});

  ///Осуществляет вход пользователя через Одноклассники с запросом дополнительных прав GET_EMAIL, LONG_ACCESS_TOKEN. Если пользователь не был ранее зарегистрирован, проводится регистрация.   https://connect.ok.ru/oauth/authorize?client_id={clientId}&scope={scope}&response_type=token&redirect_uri={redirectUri}&layout={layout}&state={state}.
  ///@param body

  @Post(path: '/v1/Account/OdnoklassnikiLogin')
  Future<chopper.Response<AuthorizationTokens>> v1AccountOdnoklassnikiLoginPost(
      {@Body() @required OkLogin body});

  ///Позволяет восстановить пароль. Если пользователь найден в базе данных, то ему отправляется письмо со ссылкой для восстановления пароля через хэшированный токен
  ///@param body

  @Post(path: '/v1/Account/ForgotPassword')
  Future<chopper.Response<dynamic>> v1AccountForgotPasswordPost(
      {@Body() @required PasswordResetModel body});

  ///Позволяет восстановить пароль. Если пользователь найден в базе данных, то ему отправляется письмо с комбинацией цифр для восстановления пароля
  ///@param body

  @Post(path: '/v1/Account/ForgotPasswordSimple')
  Future<chopper.Response<dynamic>> v1AccountForgotPasswordSimplePost(
      {@Body() @required PasswordResetModel body});

  ///Сохраняет обновленные данные пользователя и возвращает обновленные авторизационные токены
  ///@param body

  @Post(path: '/v1/Account/UpdateUser')
  Future<chopper.Response<AuthorizationTokens>> v1AccountUpdateUserPost(
      {@Body() @required UserAccountData body});

  ///Позволяет восстановить пароль по токену из письмо со ссылкой для восстановления пароля
  ///@param body

  @Post(path: '/v1/Account/ResetPassword')
  Future<chopper.Response<dynamic>> v1AccountResetPasswordPost(
      {@Body() @required ResetPasswordConfirmModel body});

  ///Проверяет 5-значный токен из письма для восстановления пароля
  ///@param body

  @Post(path: '/v1/Account/CheckResetPasswordSimpleCode')
  Future<chopper.Response<dynamic>> v1AccountCheckResetPasswordSimpleCodePost(
      {@Body() @required CheckResetPasswordSimpleModel body});

  ///Позволяет восстановить пароль по 5-значному токену из письма
  ///@param body

  @Post(path: '/v1/Account/ResetPasswordSimple')
  Future<chopper.Response<dynamic>> v1AccountResetPasswordSimplePost(
      {@Body() @required ResetPasswordSimpleConfirmModel body});

  ///Регистрирует пользователя и осуществляет вход
  ///@param body

  @Post(path: '/v1/Account/Register')
  Future<chopper.Response<AuthorizationTokens>> v1AccountRegisterPost(
      {@Body() @required RegisterModel body});

  ///Возвращает профиль пользователя
  ///@param body

  @Post(path: '/v1/UserProfile/GetUserProfile')
  Future<chopper.Response<UserProfileModel>> v1UserProfileGetUserProfilePost(
      {@Body() @required Object body});

  ///Сохраняет профиль пользователя, возвращает заполненный объект, включая поля по умолчанию
  ///@param body

  @Post(path: '/v1/UserProfile/SaveUserProfile')
  Future<chopper.Response<UserProfileModel>> v1UserProfileSaveUserProfilePost(
      {@Body() @required UserProfileModel body});

  ///Возвращает текущие цели пользователя
  ///@param body

  @Post(path: '/v1/Target/GetCurrentTargets')
  Future<chopper.Response<TargetCurrentModel>> v1TargetGetCurrentTargetsPost(
      {@Body() @required Object body});

  ///Сохраняет цель по калориям
  ///@param body

  @Post(path: '/v1/Target/SaveTargetCalorie')
  Future<chopper.Response<TargetCalorieModel>> v1TargetSaveTargetCaloriePost(
      {@Body() @required TargetCalorieModel body});

  ///Сохраняет цель по БЖУ
  ///@param body

  @Post(path: '/v1/Target/SaveTargetMacro')
  Future<chopper.Response<TargetMacroModel>> v1TargetSaveTargetMacroPost(
      {@Body() @required TargetMacroModel body});

  ///Сохраняет цель по весу
  ///@param body

  @Post(path: '/v1/Target/SaveTargetWeight')
  Future<chopper.Response<TargetWeightModel>> v1TargetSaveTargetWeightPost(
      {@Body() @required TargetWeightModel body});

  ///Сохраняет цель по воде
  ///@param body

  @Post(path: '/v1/Target/SaveTargetWater')
  Future<chopper.Response<TargetWaterModel>> v1TargetSaveTargetWaterPost(
      {@Body() @required TargetWaterModel body});

  ///Удаляет цель по БЖУ
  ///@param body

  @Post(path: '/v1/Target/DeleteTargetMacro')
  Future<chopper.Response> v1TargetDeleteTargetMacroPost(
      {@Body() @required Object body});

  ///Удаляет цель по калориям
  ///@param body

  @Post(path: '/v1/Target/DeleteTargetCalorie')
  Future<chopper.Response> v1TargetDeleteTargetCaloriePost(
      {@Body() @required Object body});

  ///Удаляет цель по воде
  ///@param body

  @Post(path: '/v1/Target/DeleteTargetWater')
  Future<chopper.Response> v1TargetDeleteTargetWaterPost(
      {@Body() @required Object body});

  ///Удаляет цель по весу
  ///@param body

  @Post(path: '/v1/Target/DeleteTargetWeight')
  Future<chopper.Response> v1TargetDeleteTargetWeightPost(
      {@Body() @required Object body});

  ///Рассчитывает идеальный вес несколькими методами по замерам пользователя
  ///@param saveMeasureToProfile Требуется ли сохранить данные замеров в замеры пользователя при расчете
  ///@param body

  @Post(path: '/v1/Calculator/CalculateIdealWeight')
  Future<chopper.Response<CalculationAggregates>>
      v1CalculatorCalculateIdealWeightPost(
          {@Query('saveMeasureToProfile') bool saveMeasureToProfile,
          @Body() @required IdealWeightInputModel body});

  ///Возвращает список пропорций для БЖУ
  ///@param body

  @Post(path: '/v1/Calculator/GetMacroProportions')
  Future<chopper.Response<List<MacroProportionModel>>>
      v1CalculatorGetMacroProportionsPost({@Body() @required Object body});

  ///Рассчитывает БЖУ по данным пользователя
  ///@param saveMeasureToProfile Требуется ли сохранить данные замеров в замеры пользователя при расчете
  ///@param body

  @Post(path: '/v1/Calculator/CalculateMacronutrition')
  Future<chopper.Response<List<Macronutrition>>>
      v1CalculatorCalculateMacronutritionPost(
          {@Query('saveMeasureToProfile') bool saveMeasureToProfile,
          @Body() @required NutritionModel body});

  ///Рассчитывает норму калорий
  ///@param saveMeasureToProfile Требуется ли сохранить данные замеров в замеры пользователя при расчете
  ///@param body

  @Post(path: '/v1/Calculator/CalculateCalories')
  Future<chopper.Response<CalorieSchedule>> v1CalculatorCalculateCaloriesPost(
      {@Query('saveMeasureToProfile') bool saveMeasureToProfile,
      @Body() @required CaloriesInputModel body});

  ///Рассчитывает норму воды, в дополнительном поле детализация информации (с учетом воды в еде и напитках или просто вода)  по каждому методу в виде json
  ///@param saveMeasureToProfile Требуется ли сохранить данные замеров в замеры пользователя при расчете
  ///@param body

  @Post(path: '/v1/Calculator/CalculateWater')
  Future<chopper.Response<CalculationAggregates>>
      v1CalculatorCalculateWaterPost(
          {@Query('saveMeasureToProfile') bool saveMeasureToProfile,
          @Body() @required WaterInputModel body});

  ///Рассчитывает норму витаминов
  ///@param saveMeasureToProfile Требуется ли сохранить данные замеров в замеры пользователя при расчете
  ///@param body

  @Post(path: '/v1/Calculator/CalculateMicronutrition')
  Future<chopper.Response<List<MicroModel>>>
      v1CalculatorCalculateMicronutritionPost(
          {@Query('saveMeasureToProfile') bool saveMeasureToProfile,
          @Body() @required MicronutrionInputModel body});

  ///Рассчитывает индекс массы тела (BMI) (ИМТ) несколькими методами по замерам пользователя
  ///@param saveMeasureToProfile Требуется ли сохранить данные замеров в замеры пользователя при расчете
  ///@param body

  @Post(path: '/v1/Calculator/CalculateBMI')
  Future<chopper.Response<BmiResult>> v1CalculatorCalculateBmipost(
      {@Query('saveMeasureToProfile') bool saveMeasureToProfile,
      @Body() @required BmiInputModel body});

  ///Сохраняет сообщение лога
  ///@param logMessage сообщение для сохранения
  ///@param body

  @Post(path: '/v1/Common/LogMessage')
  Future<chopper.Response> v1CommonLogMessagePost(
      {@Query('logMessage') String logMessage, @Body() @required Object body});

  ///Сообщает о проблеме пользователя
  ///@param body

  @Post(path: '/v1/Common/ReportProblem')
  Future<chopper.Response> v1CommonReportProblemPost(
      {@Body() @required ReportProblemModel body});

  ///Возвращает список таймзон, словарь, содержащий текстовый ключ и текстовое описание временной зоны
  ///@param body

  @Post(path: '/v1/Common/GetTimezones')
  Future<chopper.Response<Object>> v1CommonGetTimezonesPost(
      {@Body() @required Object body});

  ///@param body

  @Post(path: '/v1/Diary/GetMacronutritionChartData')
  Future<chopper.Response<List<ChartDataModel>>>
      v1DiaryGetMacronutritionChartDataPost(
          {@Body() @required DiaryChartDataRequestModel body});

  ///Сохраняет запись о питании
  ///@param body

  @Post(path: '/v1/Diary/AddFoodEvent')
  Future<chopper.Response> v1DiaryAddFoodEventPost(
      {@Body() @required FoodEventModel body});

  ///Сохраняет запись о питании
  ///@param body

  @Post(path: '/v1/Diary/AddFoodEvents')
  Future<chopper.Response> v1DiaryAddFoodEventsPost(
      {@Body() @required List<FoodEventModel> body});

  ///Сохраняет запись о тренировке
  ///@param body

  @Post(path: '/v1/Diary/AddExerciseEvent')
  Future<chopper.Response> v1DiaryAddExerciseEventPost(
      {@Body() @required ExerciseEventModel body});

  ///Удаляет записи о питании
  ///@param body

  @Post(path: '/v1/Diary/RemoveFoodEvents')
  Future<chopper.Response> v1DiaryRemoveFoodEventsPost(
      {@Body() @required Object body});

  ///Удаляет записи о тренировке
  ///@param body

  @Post(path: '/v1/Diary/RemoveExerciseEvents')
  Future<chopper.Response> v1DiaryRemoveExerciseEventsPost(
      {@Body() @required Object body});

  ///Возвращает данные дневника по питанию за период
  ///@param body

  @Post(path: '/v1/Diary/GetDiary')
  Future<chopper.Response<List<DiaryDayModel>>> v1DiaryGetDiaryPost(
      {@Body() @required RequestByDatesModel body});

  ///Возвращает данные дневника тренировок за период
  ///@param body

  @Post(path: '/v1/Diary/GetActivityDiary')
  Future<chopper.Response<List<DiaryDayExercises>>> v1DiaryGetActivityDiaryPost(
      {@Body() @required RequestByDatesModel body});

  ///Возвращает данные об упражнении
  ///@param name данные для поиска
  ///@param body

  @Post(path: '/v1/Exercise/FindExercise')
  Future<chopper.Response<List<ExerciseSimpleModel>>>
      v1ExerciseFindExercisePost(
          {@Query('name') String name, @Body() @required Object body});

  ///Возвращает данные о продукте
  ///@param body

  @Post(path: '/v1/Food/FindProduct')
  Future<chopper.Response<List<ProductSimpleModel>>> v1FoodFindProductPost(
      {@Body() @required ProductSearchModel body});

  ///@param body

  @Post(path: '/v1/Measure/GetMeasuresChartData')
  Future<chopper.Response<List<ChartDataModel>>>
      v1MeasureGetMeasuresChartDataPost(
          {@Body() @required MeasureChartDataRequestModel body});

  ///@param date За какой день требуется вернуть данные
  ///@param body

  @Post(path: '/v1/Measure/GetMeasure')
  Future<chopper.Response<MeasureModel>> v1MeasureGetMeasurePost(
      {@Query('date') String date, @Body() @required Object body});

  ///Возвращает данные замеров по датам, последний замер за день
  ///@param body

  @Post(path: '/v1/Measure/GetMeasures')
  Future<chopper.Response<List<MeasureModel>>> v1MeasureGetMeasuresPost(
      {@Body() @required RequestByDatesModel body});

  ///Сохраняет данные замеров на дату
  ///@param body

  @Post(path: '/v1/Measure/SaveMeasure')
  Future<chopper.Response<MeasureModel>> v1MeasureSaveMeasurePost(
      {@Body() @required MeasureModel body});
}

final Map<Type, Object Function(Map<String, dynamic>)>
    SwaggerApiJsonDecoderMappings = {
  LoginModel: LoginModel.fromJsonFactory,
  TokenResource: TokenResource.fromJsonFactory,
  UserAccountData: UserAccountData.fromJsonFactory,
  AuthorizationTokens: AuthorizationTokens.fromJsonFactory,
  FacebookLogin: FacebookLogin.fromJsonFactory,
  AppleModel: AppleModel.fromJsonFactory,
  GoogleLogin: GoogleLogin.fromJsonFactory,
  VkLogin: VkLogin.fromJsonFactory,
  OkLogin: OkLogin.fromJsonFactory,
  PasswordResetModel: PasswordResetModel.fromJsonFactory,
  ResetPasswordConfirmModel: ResetPasswordConfirmModel.fromJsonFactory,
  CheckResetPasswordSimpleModel: CheckResetPasswordSimpleModel.fromJsonFactory,
  ResetPasswordSimpleConfirmModel:
      ResetPasswordSimpleConfirmModel.fromJsonFactory,
  RegisterModel: RegisterModel.fromJsonFactory,
  UserProfileModel: UserProfileModel.fromJsonFactory,
  TargetCalorieModel: TargetCalorieModel.fromJsonFactory,
  TargetMacroModel: TargetMacroModel.fromJsonFactory,
  TargetWaterModel: TargetWaterModel.fromJsonFactory,
  TargetWeightModel: TargetWeightModel.fromJsonFactory,
  TargetCurrentFactModel: TargetCurrentFactModel.fromJsonFactory,
  TargetCurrentModel: TargetCurrentModel.fromJsonFactory,
  MeasureModel: MeasureModel.fromJsonFactory,
  IdealWeightInputModel: IdealWeightInputModel.fromJsonFactory,
  CalculationAggregates: CalculationAggregates.fromJsonFactory,
  MacroProportionModel: MacroProportionModel.fromJsonFactory,
  NutritionModel: NutritionModel.fromJsonFactory,
  Macronutrition: Macronutrition.fromJsonFactory,
  CaloriesInputModel: CaloriesInputModel.fromJsonFactory,
  CalorieDetails: CalorieDetails.fromJsonFactory,
  CalorieSchedule: CalorieSchedule.fromJsonFactory,
  WaterInputModel: WaterInputModel.fromJsonFactory,
  MicronutrionInputModel: MicronutrionInputModel.fromJsonFactory,
  SmallMicroModel: SmallMicroModel.fromJsonFactory,
  MicroDataModel: MicroDataModel.fromJsonFactory,
  MicroCategoryModel: MicroCategoryModel.fromJsonFactory,
  MicroModel: MicroModel.fromJsonFactory,
  BmiInputModel: BmiInputModel.fromJsonFactory,
  BmiValues: BmiValues.fromJsonFactory,
  BmiResult: BmiResult.fromJsonFactory,
  ReportProblemModel: ReportProblemModel.fromJsonFactory,
  DiaryChartDataRequestModel: DiaryChartDataRequestModel.fromJsonFactory,
  Spot: Spot.fromJsonFactory,
  ChartAddition: ChartAddition.fromJsonFactory,
  ChartPlot: ChartPlot.fromJsonFactory,
  ChartDataModel: ChartDataModel.fromJsonFactory,
  FoodEventModel: FoodEventModel.fromJsonFactory,
  ExerciseEventModel: ExerciseEventModel.fromJsonFactory,
  RequestByDatesModel: RequestByDatesModel.fromJsonFactory,
  DiaryProduct: DiaryProduct.fromJsonFactory,
  FoodContainer: FoodContainer.fromJsonFactory,
  DailySummary: DailySummary.fromJsonFactory,
  DiaryDayModel: DiaryDayModel.fromJsonFactory,
  DiaryDayExercise: DiaryDayExercise.fromJsonFactory,
  DiaryDayExercises: DiaryDayExercises.fromJsonFactory,
  ExerciseSimpleModel: ExerciseSimpleModel.fromJsonFactory,
  ProductSearchModel: ProductSearchModel.fromJsonFactory,
  ProductSimpleModel: ProductSimpleModel.fromJsonFactory,
  MeasureChartDataRequestModel: MeasureChartDataRequestModel.fromJsonFactory,
};

@JsonSerializable(explicitToJson: true)
class LoginModel {
  LoginModel({
    this.email,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'password', includeIfNull: false)
  final String password;
  static const fromJsonFactory = _$LoginModelFromJson;
  static const toJsonFactory = _$LoginModelToJson;
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

extension $LoginModelExtension on LoginModel {
  LoginModel copyWith({String email, String password}) {
    return LoginModel(
        email: email ?? this.email, password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class TokenResource {
  TokenResource({
    this.token,
    this.expiry,
  });

  factory TokenResource.fromJson(Map<String, dynamic> json) =>
      _$TokenResourceFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false)
  final String token;
  @JsonKey(name: 'expiry', includeIfNull: false)
  final int expiry;
  static const fromJsonFactory = _$TokenResourceFromJson;
  static const toJsonFactory = _$TokenResourceToJson;
  Map<String, dynamic> toJson() => _$TokenResourceToJson(this);
}

extension $TokenResourceExtension on TokenResource {
  TokenResource copyWith({String token, int expiry}) {
    return TokenResource(
        token: token ?? this.token, expiry: expiry ?? this.expiry);
  }
}

@JsonSerializable(explicitToJson: true)
class UserAccountData {
  UserAccountData({
    this.email,
    this.nickName,
    this.firstName,
    this.lastName,
    this.picture,
    this.sex,
    this.birthday,
    this.timezone,
  });

  factory UserAccountData.fromJson(Map<String, dynamic> json) =>
      _$UserAccountDataFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'nickName', includeIfNull: false)
  final String nickName;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String lastName;
  @JsonKey(name: 'picture', includeIfNull: false)
  final String picture;
  @JsonKey(
      name: 'sex',
      includeIfNull: false,
      toJson: sexToJson,
      fromJson: sexFromJson)
  final enums.Sex sex;
  @JsonKey(name: 'birthday', includeIfNull: false, toJson: _dateToJson)
  final DateTime birthday;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final String timezone;
  static const fromJsonFactory = _$UserAccountDataFromJson;
  static const toJsonFactory = _$UserAccountDataToJson;
  Map<String, dynamic> toJson() => _$UserAccountDataToJson(this);
}

extension $UserAccountDataExtension on UserAccountData {
  UserAccountData copyWith(
      {String email,
      String nickName,
      String firstName,
      String lastName,
      String picture,
      enums.Sex sex,
      DateTime birthday,
      String timezone}) {
    return UserAccountData(
        email: email ?? this.email,
        nickName: nickName ?? this.nickName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        picture: picture ?? this.picture,
        sex: sex ?? this.sex,
        birthday: birthday ?? this.birthday,
        timezone: timezone ?? this.timezone);
  }
}

@JsonSerializable(explicitToJson: true)
class AuthorizationTokens {
  AuthorizationTokens({
    this.accessToken,
    this.refreshToken,
    this.userData,
  });

  factory AuthorizationTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationTokensFromJson(json);

  @JsonKey(name: 'accessToken', includeIfNull: false)
  final TokenResource accessToken;
  @JsonKey(name: 'refreshToken', includeIfNull: false)
  final TokenResource refreshToken;
  @JsonKey(name: 'userData', includeIfNull: false)
  final UserAccountData userData;
  static const fromJsonFactory = _$AuthorizationTokensFromJson;
  static const toJsonFactory = _$AuthorizationTokensToJson;
  Map<String, dynamic> toJson() => _$AuthorizationTokensToJson(this);
}

extension $AuthorizationTokensExtension on AuthorizationTokens {
  AuthorizationTokens copyWith(
      {TokenResource accessToken,
      TokenResource refreshToken,
      UserAccountData userData}) {
    return AuthorizationTokens(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        userData: userData ?? this.userData);
  }
}

@JsonSerializable(explicitToJson: true)
class FacebookLogin {
  FacebookLogin({
    this.facebookToken,
    this.timezone,
  });

  factory FacebookLogin.fromJson(Map<String, dynamic> json) =>
      _$FacebookLoginFromJson(json);

  @JsonKey(name: 'facebookToken', includeIfNull: false)
  final String facebookToken;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final String timezone;
  static const fromJsonFactory = _$FacebookLoginFromJson;
  static const toJsonFactory = _$FacebookLoginToJson;
  Map<String, dynamic> toJson() => _$FacebookLoginToJson(this);
}

extension $FacebookLoginExtension on FacebookLogin {
  FacebookLogin copyWith({String facebookToken, String timezone}) {
    return FacebookLogin(
        facebookToken: facebookToken ?? this.facebookToken,
        timezone: timezone ?? this.timezone);
  }
}

@JsonSerializable(explicitToJson: true)
class AppleModel {
  AppleModel({
    this.uid,
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.timezone,
  });

  factory AppleModel.fromJson(Map<String, dynamic> json) =>
      _$AppleModelFromJson(json);

  @JsonKey(name: 'uid', includeIfNull: false)
  final String uid;
  @JsonKey(name: 'displayName', includeIfNull: false)
  final String displayName;
  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String phoneNumber;
  @JsonKey(name: 'photoUrl', includeIfNull: false)
  final String photoUrl;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final String timezone;
  static const fromJsonFactory = _$AppleModelFromJson;
  static const toJsonFactory = _$AppleModelToJson;
  Map<String, dynamic> toJson() => _$AppleModelToJson(this);
}

extension $AppleModelExtension on AppleModel {
  AppleModel copyWith(
      {String uid,
      String displayName,
      String email,
      String phoneNumber,
      String photoUrl,
      String timezone}) {
    return AppleModel(
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoUrl: photoUrl ?? this.photoUrl,
        timezone: timezone ?? this.timezone);
  }
}

@JsonSerializable(explicitToJson: true)
class GoogleLogin {
  GoogleLogin({
    this.googleToken,
    this.timezone,
  });

  factory GoogleLogin.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginFromJson(json);

  @JsonKey(name: 'googleToken', includeIfNull: false)
  final String googleToken;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final String timezone;
  static const fromJsonFactory = _$GoogleLoginFromJson;
  static const toJsonFactory = _$GoogleLoginToJson;
  Map<String, dynamic> toJson() => _$GoogleLoginToJson(this);
}

extension $GoogleLoginExtension on GoogleLogin {
  GoogleLogin copyWith({String googleToken, String timezone}) {
    return GoogleLogin(
        googleToken: googleToken ?? this.googleToken,
        timezone: timezone ?? this.timezone);
  }
}

@JsonSerializable(explicitToJson: true)
class VkLogin {
  VkLogin({
    this.token,
    this.uId,
    this.email,
    this.timezone,
  });

  factory VkLogin.fromJson(Map<String, dynamic> json) =>
      _$VkLoginFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false)
  final String token;
  @JsonKey(name: 'uId', includeIfNull: false)
  final String uId;
  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final String timezone;
  static const fromJsonFactory = _$VkLoginFromJson;
  static const toJsonFactory = _$VkLoginToJson;
  Map<String, dynamic> toJson() => _$VkLoginToJson(this);
}

extension $VkLoginExtension on VkLogin {
  VkLogin copyWith({String token, String uId, String email, String timezone}) {
    return VkLogin(
        token: token ?? this.token,
        uId: uId ?? this.uId,
        email: email ?? this.email,
        timezone: timezone ?? this.timezone);
  }
}

@JsonSerializable(explicitToJson: true)
class OkLogin {
  OkLogin({
    this.token,
    this.sessionSecretKey,
    this.timezone,
  });

  factory OkLogin.fromJson(Map<String, dynamic> json) =>
      _$OkLoginFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false)
  final String token;
  @JsonKey(name: 'sessionSecretKey', includeIfNull: false)
  final String sessionSecretKey;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final String timezone;
  static const fromJsonFactory = _$OkLoginFromJson;
  static const toJsonFactory = _$OkLoginToJson;
  Map<String, dynamic> toJson() => _$OkLoginToJson(this);
}

extension $OkLoginExtension on OkLogin {
  OkLogin copyWith({String token, String sessionSecretKey, String timezone}) {
    return OkLogin(
        token: token ?? this.token,
        sessionSecretKey: sessionSecretKey ?? this.sessionSecretKey,
        timezone: timezone ?? this.timezone);
  }
}

@JsonSerializable(explicitToJson: true)
class PasswordResetModel {
  PasswordResetModel({
    this.email,
  });

  factory PasswordResetModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetModelFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  static const fromJsonFactory = _$PasswordResetModelFromJson;
  static const toJsonFactory = _$PasswordResetModelToJson;
  Map<String, dynamic> toJson() => _$PasswordResetModelToJson(this);
}

extension $PasswordResetModelExtension on PasswordResetModel {
  PasswordResetModel copyWith({String email}) {
    return PasswordResetModel(email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class ResetPasswordConfirmModel {
  ResetPasswordConfirmModel({
    this.token,
    this.newPassword,
    this.confirmPassword,
  });

  factory ResetPasswordConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordConfirmModelFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false)
  final String token;
  @JsonKey(name: 'newPassword', includeIfNull: false)
  final String newPassword;
  @JsonKey(name: 'confirmPassword', includeIfNull: false)
  final String confirmPassword;
  static const fromJsonFactory = _$ResetPasswordConfirmModelFromJson;
  static const toJsonFactory = _$ResetPasswordConfirmModelToJson;
  Map<String, dynamic> toJson() => _$ResetPasswordConfirmModelToJson(this);
}

extension $ResetPasswordConfirmModelExtension on ResetPasswordConfirmModel {
  ResetPasswordConfirmModel copyWith(
      {String token, String newPassword, String confirmPassword}) {
    return ResetPasswordConfirmModel(
        token: token ?? this.token,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }
}

@JsonSerializable(explicitToJson: true)
class CheckResetPasswordSimpleModel {
  CheckResetPasswordSimpleModel({
    this.token,
    this.email,
  });

  factory CheckResetPasswordSimpleModel.fromJson(Map<String, dynamic> json) =>
      _$CheckResetPasswordSimpleModelFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false)
  final String token;
  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  static const fromJsonFactory = _$CheckResetPasswordSimpleModelFromJson;
  static const toJsonFactory = _$CheckResetPasswordSimpleModelToJson;
  Map<String, dynamic> toJson() => _$CheckResetPasswordSimpleModelToJson(this);
}

extension $CheckResetPasswordSimpleModelExtension
    on CheckResetPasswordSimpleModel {
  CheckResetPasswordSimpleModel copyWith({String token, String email}) {
    return CheckResetPasswordSimpleModel(
        token: token ?? this.token, email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class ResetPasswordSimpleConfirmModel {
  ResetPasswordSimpleConfirmModel({
    this.token,
    this.newPassword,
    this.confirmPassword,
    this.email,
  });

  factory ResetPasswordSimpleConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordSimpleConfirmModelFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false)
  final String token;
  @JsonKey(name: 'newPassword', includeIfNull: false)
  final String newPassword;
  @JsonKey(name: 'confirmPassword', includeIfNull: false)
  final String confirmPassword;
  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  static const fromJsonFactory = _$ResetPasswordSimpleConfirmModelFromJson;
  static const toJsonFactory = _$ResetPasswordSimpleConfirmModelToJson;
  Map<String, dynamic> toJson() =>
      _$ResetPasswordSimpleConfirmModelToJson(this);
}

extension $ResetPasswordSimpleConfirmModelExtension
    on ResetPasswordSimpleConfirmModel {
  ResetPasswordSimpleConfirmModel copyWith(
      {String token,
      String newPassword,
      String confirmPassword,
      String email}) {
    return ResetPasswordSimpleConfirmModel(
        token: token ?? this.token,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class RegisterModel {
  RegisterModel({
    this.userName,
    this.email,
    this.password,
    this.timezone,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  @JsonKey(name: 'userName', includeIfNull: false)
  final String userName;
  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'password', includeIfNull: false)
  final String password;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final String timezone;
  static const fromJsonFactory = _$RegisterModelFromJson;
  static const toJsonFactory = _$RegisterModelToJson;
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

extension $RegisterModelExtension on RegisterModel {
  RegisterModel copyWith(
      {String userName, String email, String password, String timezone}) {
    return RegisterModel(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        timezone: timezone ?? this.timezone);
  }
}

@JsonSerializable(explicitToJson: true)
class UserProfileModel {
  UserProfileModel({
    this.userAccountData,
    this.height,
    this.weight,
    this.activity,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  @JsonKey(name: 'userAccountData', includeIfNull: false)
  final UserAccountData userAccountData;
  @JsonKey(name: 'height', includeIfNull: false)
  final double height;
  @JsonKey(name: 'weight', includeIfNull: false)
  final double weight;
  @JsonKey(
      name: 'activity',
      includeIfNull: false,
      toJson: activityToJson,
      fromJson: activityFromJson)
  final enums.Activity activity;
  static const fromJsonFactory = _$UserProfileModelFromJson;
  static const toJsonFactory = _$UserProfileModelToJson;
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

extension $UserProfileModelExtension on UserProfileModel {
  UserProfileModel copyWith(
      {UserAccountData userAccountData,
      double height,
      double weight,
      enums.Activity activity}) {
    return UserProfileModel(
        userAccountData: userAccountData ?? this.userAccountData,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        activity: activity ?? this.activity);
  }
}

@JsonSerializable(explicitToJson: true)
class TargetCalorieModel {
  TargetCalorieModel({
    this.id,
    this.calories,
    this.isZigzag,
    this.calculationId,
    this.formulaId,
    this.scenarioId,
    this.mo,
    this.tu,
    this.we,
    this.th,
    this.fr,
    this.sa,
    this.su,
    this.mrCalories,
  });

  factory TargetCalorieModel.fromJson(Map<String, dynamic> json) =>
      _$TargetCalorieModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'calories', includeIfNull: false)
  final int calories;
  @JsonKey(name: 'isZigzag', includeIfNull: false)
  final bool isZigzag;
  @JsonKey(name: 'calculationId', includeIfNull: false)
  final int calculationId;
  @JsonKey(
      name: 'formulaId',
      includeIfNull: false,
      toJson: caloriesFormulaIdToJson,
      fromJson: caloriesFormulaIdFromJson)
  final enums.CaloriesFormulaId formulaId;
  @JsonKey(
      name: 'scenarioId',
      includeIfNull: false,
      toJson: scenarioIdToJson,
      fromJson: scenarioIdFromJson)
  final enums.ScenarioId scenarioId;
  @JsonKey(name: 'mo', includeIfNull: false)
  final int mo;
  @JsonKey(name: 'tu', includeIfNull: false)
  final int tu;
  @JsonKey(name: 'we', includeIfNull: false)
  final int we;
  @JsonKey(name: 'th', includeIfNull: false)
  final int th;
  @JsonKey(name: 'fr', includeIfNull: false)
  final int fr;
  @JsonKey(name: 'sa', includeIfNull: false)
  final int sa;
  @JsonKey(name: 'su', includeIfNull: false)
  final int su;
  @JsonKey(name: 'mrCalories', includeIfNull: false)
  final int mrCalories;
  static const fromJsonFactory = _$TargetCalorieModelFromJson;
  static const toJsonFactory = _$TargetCalorieModelToJson;
  Map<String, dynamic> toJson() => _$TargetCalorieModelToJson(this);
}

extension $TargetCalorieModelExtension on TargetCalorieModel {
  TargetCalorieModel copyWith(
      {int id,
      int calories,
      bool isZigzag,
      int calculationId,
      enums.CaloriesFormulaId formulaId,
      enums.ScenarioId scenarioId,
      int mo,
      int tu,
      int we,
      int th,
      int fr,
      int sa,
      int su,
      int mrCalories}) {
    return TargetCalorieModel(
        id: id ?? this.id,
        calories: calories ?? this.calories,
        isZigzag: isZigzag ?? this.isZigzag,
        calculationId: calculationId ?? this.calculationId,
        formulaId: formulaId ?? this.formulaId,
        scenarioId: scenarioId ?? this.scenarioId,
        mo: mo ?? this.mo,
        tu: tu ?? this.tu,
        we: we ?? this.we,
        th: th ?? this.th,
        fr: fr ?? this.fr,
        sa: sa ?? this.sa,
        su: su ?? this.su,
        mrCalories: mrCalories ?? this.mrCalories);
  }
}

@JsonSerializable(explicitToJson: true)
class TargetMacroModel {
  TargetMacroModel({
    this.id,
    this.protein,
    this.fat,
    this.carbon,
    this.calculationId,
    this.mealsCount,
  });

  factory TargetMacroModel.fromJson(Map<String, dynamic> json) =>
      _$TargetMacroModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'protein', includeIfNull: false)
  final double protein;
  @JsonKey(name: 'fat', includeIfNull: false)
  final double fat;
  @JsonKey(name: 'carbon', includeIfNull: false)
  final double carbon;
  @JsonKey(name: 'calculationId', includeIfNull: false)
  final int calculationId;
  @JsonKey(name: 'mealsCount', includeIfNull: false)
  final int mealsCount;
  static const fromJsonFactory = _$TargetMacroModelFromJson;
  static const toJsonFactory = _$TargetMacroModelToJson;
  Map<String, dynamic> toJson() => _$TargetMacroModelToJson(this);
}

extension $TargetMacroModelExtension on TargetMacroModel {
  TargetMacroModel copyWith(
      {int id,
      double protein,
      double fat,
      double carbon,
      int calculationId,
      int mealsCount}) {
    return TargetMacroModel(
        id: id ?? this.id,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbon: carbon ?? this.carbon,
        calculationId: calculationId ?? this.calculationId,
        mealsCount: mealsCount ?? this.mealsCount);
  }
}

@JsonSerializable(explicitToJson: true)
class TargetWaterModel {
  TargetWaterModel({
    this.id,
    this.water,
  });

  factory TargetWaterModel.fromJson(Map<String, dynamic> json) =>
      _$TargetWaterModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'water', includeIfNull: false)
  final double water;
  static const fromJsonFactory = _$TargetWaterModelFromJson;
  static const toJsonFactory = _$TargetWaterModelToJson;
  Map<String, dynamic> toJson() => _$TargetWaterModelToJson(this);
}

extension $TargetWaterModelExtension on TargetWaterModel {
  TargetWaterModel copyWith({int id, double water}) {
    return TargetWaterModel(id: id ?? this.id, water: water ?? this.water);
  }
}

@JsonSerializable(explicitToJson: true)
class TargetWeightModel {
  TargetWeightModel({
    this.id,
    this.startWeight,
    this.endWeight,
    this.weekly,
    this.calculationId,
    this.startDate,
    this.endDate,
  });

  factory TargetWeightModel.fromJson(Map<String, dynamic> json) =>
      _$TargetWeightModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'startWeight', includeIfNull: false)
  final double startWeight;
  @JsonKey(name: 'endWeight', includeIfNull: false)
  final double endWeight;
  @JsonKey(name: 'weekly', includeIfNull: false)
  final double weekly;
  @JsonKey(name: 'calculationId', includeIfNull: false)
  final int calculationId;
  @JsonKey(name: 'startDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime startDate;
  @JsonKey(name: 'endDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime endDate;
  static const fromJsonFactory = _$TargetWeightModelFromJson;
  static const toJsonFactory = _$TargetWeightModelToJson;
  Map<String, dynamic> toJson() => _$TargetWeightModelToJson(this);
}

extension $TargetWeightModelExtension on TargetWeightModel {
  TargetWeightModel copyWith(
      {int id,
      double startWeight,
      double endWeight,
      double weekly,
      int calculationId,
      DateTime startDate,
      DateTime endDate}) {
    return TargetWeightModel(
        id: id ?? this.id,
        startWeight: startWeight ?? this.startWeight,
        endWeight: endWeight ?? this.endWeight,
        weekly: weekly ?? this.weekly,
        calculationId: calculationId ?? this.calculationId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}

@JsonSerializable(explicitToJson: true)
class TargetCurrentFactModel {
  TargetCurrentFactModel({
    this.weight,
    this.protein,
    this.fat,
    this.carbon,
    this.calories,
    this.water,
  });

  factory TargetCurrentFactModel.fromJson(Map<String, dynamic> json) =>
      _$TargetCurrentFactModelFromJson(json);

  @JsonKey(name: 'weight', includeIfNull: false)
  final double weight;
  @JsonKey(name: 'protein', includeIfNull: false)
  final double protein;
  @JsonKey(name: 'fat', includeIfNull: false)
  final double fat;
  @JsonKey(name: 'carbon', includeIfNull: false)
  final double carbon;
  @JsonKey(name: 'calories', includeIfNull: false)
  final int calories;
  @JsonKey(name: 'water', includeIfNull: false)
  final double water;
  static const fromJsonFactory = _$TargetCurrentFactModelFromJson;
  static const toJsonFactory = _$TargetCurrentFactModelToJson;
  Map<String, dynamic> toJson() => _$TargetCurrentFactModelToJson(this);
}

extension $TargetCurrentFactModelExtension on TargetCurrentFactModel {
  TargetCurrentFactModel copyWith(
      {double weight,
      double protein,
      double fat,
      double carbon,
      int calories,
      double water}) {
    return TargetCurrentFactModel(
        weight: weight ?? this.weight,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbon: carbon ?? this.carbon,
        calories: calories ?? this.calories,
        water: water ?? this.water);
  }
}

@JsonSerializable(explicitToJson: true)
class TargetCurrentModel {
  TargetCurrentModel({
    this.id,
    this.targetCalorie,
    this.targetMacro,
    this.targetWater,
    this.targetWeight,
    this.targetCurrentFact,
  });

  factory TargetCurrentModel.fromJson(Map<String, dynamic> json) =>
      _$TargetCurrentModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'targetCalorie', includeIfNull: false)
  final TargetCalorieModel targetCalorie;
  @JsonKey(name: 'targetMacro', includeIfNull: false)
  final TargetMacroModel targetMacro;
  @JsonKey(name: 'targetWater', includeIfNull: false)
  final TargetWaterModel targetWater;
  @JsonKey(name: 'targetWeight', includeIfNull: false)
  final TargetWeightModel targetWeight;
  @JsonKey(name: 'targetCurrentFact', includeIfNull: false)
  final TargetCurrentFactModel targetCurrentFact;
  static const fromJsonFactory = _$TargetCurrentModelFromJson;
  static const toJsonFactory = _$TargetCurrentModelToJson;
  Map<String, dynamic> toJson() => _$TargetCurrentModelToJson(this);
}

extension $TargetCurrentModelExtension on TargetCurrentModel {
  TargetCurrentModel copyWith(
      {int id,
      TargetCalorieModel targetCalorie,
      TargetMacroModel targetMacro,
      TargetWaterModel targetWater,
      TargetWeightModel targetWeight,
      TargetCurrentFactModel targetCurrentFact}) {
    return TargetCurrentModel(
        id: id ?? this.id,
        targetCalorie: targetCalorie ?? this.targetCalorie,
        targetMacro: targetMacro ?? this.targetMacro,
        targetWater: targetWater ?? this.targetWater,
        targetWeight: targetWeight ?? this.targetWeight,
        targetCurrentFact: targetCurrentFact ?? this.targetCurrentFact);
  }
}

@JsonSerializable(explicitToJson: true)
class MeasureModel {
  MeasureModel({
    this.id,
    this.utcDate,
    this.localDate,
    this.userId,
    this.ip,
    this.chest,
    this.waist,
    this.hips,
    this.height,
    this.wrist,
    this.thigh,
    this.calf,
    this.neck,
    this.weight,
    this.forearm,
    this.age,
    this.activity,
    this.sex,
    this.fatPercent,
    this.fatPercentCalculated,
    this.biceps,
    this.stomach,
    this.underChest,
    this.ankle,
    this.knee,
  });

  factory MeasureModel.fromJson(Map<String, dynamic> json) =>
      _$MeasureModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'utcDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime utcDate;
  @JsonKey(name: 'localDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime localDate;
  @JsonKey(name: 'userId', includeIfNull: false)
  final int userId;
  @JsonKey(name: 'ip', includeIfNull: false)
  final String ip;
  @JsonKey(name: 'chest', includeIfNull: false)
  final double chest;
  @JsonKey(name: 'waist', includeIfNull: false)
  final double waist;
  @JsonKey(name: 'hips', includeIfNull: false)
  final double hips;
  @JsonKey(name: 'height', includeIfNull: false)
  final double height;
  @JsonKey(name: 'wrist', includeIfNull: false)
  final double wrist;
  @JsonKey(name: 'thigh', includeIfNull: false)
  final double thigh;
  @JsonKey(name: 'calf', includeIfNull: false)
  final double calf;
  @JsonKey(name: 'neck', includeIfNull: false)
  final double neck;
  @JsonKey(name: 'weight', includeIfNull: false)
  final double weight;
  @JsonKey(name: 'forearm', includeIfNull: false)
  final double forearm;
  @JsonKey(name: 'age', includeIfNull: false)
  final int age;
  @JsonKey(
      name: 'activity',
      includeIfNull: false,
      toJson: activityToJson,
      fromJson: activityFromJson)
  final enums.Activity activity;
  @JsonKey(
      name: 'sex',
      includeIfNull: false,
      toJson: sexToJson,
      fromJson: sexFromJson)
  final enums.Sex sex;
  @JsonKey(name: 'fatPercent', includeIfNull: false)
  final double fatPercent;
  @JsonKey(name: 'fatPercentCalculated', includeIfNull: false)
  final double fatPercentCalculated;
  @JsonKey(name: 'biceps', includeIfNull: false)
  final double biceps;
  @JsonKey(name: 'stomach', includeIfNull: false)
  final double stomach;
  @JsonKey(name: 'underChest', includeIfNull: false)
  final double underChest;
  @JsonKey(name: 'ankle', includeIfNull: false)
  final double ankle;
  @JsonKey(name: 'knee', includeIfNull: false)
  final double knee;
  static const fromJsonFactory = _$MeasureModelFromJson;
  static const toJsonFactory = _$MeasureModelToJson;
  Map<String, dynamic> toJson() => _$MeasureModelToJson(this);
}

extension $MeasureModelExtension on MeasureModel {
  MeasureModel copyWith(
      {int id,
      DateTime utcDate,
      DateTime localDate,
      int userId,
      String ip,
      double chest,
      double waist,
      double hips,
      double height,
      double wrist,
      double thigh,
      double calf,
      double neck,
      double weight,
      double forearm,
      int age,
      enums.Activity activity,
      enums.Sex sex,
      double fatPercent,
      double fatPercentCalculated,
      double biceps,
      double stomach,
      double underChest,
      double ankle,
      double knee}) {
    return MeasureModel(
        id: id ?? this.id,
        utcDate: utcDate ?? this.utcDate,
        localDate: localDate ?? this.localDate,
        userId: userId ?? this.userId,
        ip: ip ?? this.ip,
        chest: chest ?? this.chest,
        waist: waist ?? this.waist,
        hips: hips ?? this.hips,
        height: height ?? this.height,
        wrist: wrist ?? this.wrist,
        thigh: thigh ?? this.thigh,
        calf: calf ?? this.calf,
        neck: neck ?? this.neck,
        weight: weight ?? this.weight,
        forearm: forearm ?? this.forearm,
        age: age ?? this.age,
        activity: activity ?? this.activity,
        sex: sex ?? this.sex,
        fatPercent: fatPercent ?? this.fatPercent,
        fatPercentCalculated: fatPercentCalculated ?? this.fatPercentCalculated,
        biceps: biceps ?? this.biceps,
        stomach: stomach ?? this.stomach,
        underChest: underChest ?? this.underChest,
        ankle: ankle ?? this.ankle,
        knee: knee ?? this.knee);
  }
}

@JsonSerializable(explicitToJson: true)
class IdealWeightInputModel {
  IdealWeightInputModel({
    this.measure,
  });

  factory IdealWeightInputModel.fromJson(Map<String, dynamic> json) =>
      _$IdealWeightInputModelFromJson(json);

  @JsonKey(name: 'measure', includeIfNull: false)
  final MeasureModel measure;
  static const fromJsonFactory = _$IdealWeightInputModelFromJson;
  static const toJsonFactory = _$IdealWeightInputModelToJson;
  Map<String, dynamic> toJson() => _$IdealWeightInputModelToJson(this);
}

extension $IdealWeightInputModelExtension on IdealWeightInputModel {
  IdealWeightInputModel copyWith({MeasureModel measure}) {
    return IdealWeightInputModel(measure: measure ?? this.measure);
  }
}

@JsonSerializable(explicitToJson: true)
class CalculationAggregates {
  CalculationAggregates({
    this.data,
    this.average,
    this.min,
    this.max,
    this.diff,
    this.diffAbsolute,
    this.precision,
    this.sizeIn,
    this.additionalInfo,
  });

  factory CalculationAggregates.fromJson(Map<String, dynamic> json) =>
      _$CalculationAggregatesFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  @JsonKey(name: 'average', includeIfNull: false)
  final String average;
  @JsonKey(name: 'min', includeIfNull: false)
  final String min;
  @JsonKey(name: 'max', includeIfNull: false)
  final String max;
  @JsonKey(name: 'diff', includeIfNull: false)
  final String diff;
  @JsonKey(name: 'diffAbsolute', includeIfNull: false)
  final String diffAbsolute;
  @JsonKey(name: 'precision', includeIfNull: false)
  final int precision;
  @JsonKey(name: 'sizeIn', includeIfNull: false)
  final String sizeIn;
  @JsonKey(name: 'additionalInfo', includeIfNull: false)
  final String additionalInfo;
  static const fromJsonFactory = _$CalculationAggregatesFromJson;
  static const toJsonFactory = _$CalculationAggregatesToJson;
  Map<String, dynamic> toJson() => _$CalculationAggregatesToJson(this);
}

extension $CalculationAggregatesExtension on CalculationAggregates {
  CalculationAggregates copyWith(
      {Object data,
      String average,
      String min,
      String max,
      String diff,
      String diffAbsolute,
      int precision,
      String sizeIn,
      String additionalInfo}) {
    return CalculationAggregates(
        data: data ?? this.data,
        average: average ?? this.average,
        min: min ?? this.min,
        max: max ?? this.max,
        diff: diff ?? this.diff,
        diffAbsolute: diffAbsolute ?? this.diffAbsolute,
        precision: precision ?? this.precision,
        sizeIn: sizeIn ?? this.sizeIn,
        additionalInfo: additionalInfo ?? this.additionalInfo);
  }
}

@JsonSerializable(explicitToJson: true)
class MacroProportionModel {
  MacroProportionModel({
    this.name,
    this.carbohydratePercent,
    this.proteinPercent,
    this.fatPercent,
  });

  factory MacroProportionModel.fromJson(Map<String, dynamic> json) =>
      _$MacroProportionModelFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'carbohydratePercent', includeIfNull: false)
  final double carbohydratePercent;
  @JsonKey(name: 'proteinPercent', includeIfNull: false)
  final double proteinPercent;
  @JsonKey(name: 'fatPercent', includeIfNull: false)
  final double fatPercent;
  static const fromJsonFactory = _$MacroProportionModelFromJson;
  static const toJsonFactory = _$MacroProportionModelToJson;
  Map<String, dynamic> toJson() => _$MacroProportionModelToJson(this);
}

extension $MacroProportionModelExtension on MacroProportionModel {
  MacroProportionModel copyWith(
      {String name,
      double carbohydratePercent,
      double proteinPercent,
      double fatPercent}) {
    return MacroProportionModel(
        name: name ?? this.name,
        carbohydratePercent: carbohydratePercent ?? this.carbohydratePercent,
        proteinPercent: proteinPercent ?? this.proteinPercent,
        fatPercent: fatPercent ?? this.fatPercent);
  }
}

@JsonSerializable(explicitToJson: true)
class NutritionModel {
  NutritionModel({
    this.calories,
    this.carbohydratePercent,
    this.proteinPercent,
    this.fatPercent,
    this.mealsCount,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(json);

  @JsonKey(name: 'calories', includeIfNull: false)
  final int calories;
  @JsonKey(name: 'carbohydratePercent', includeIfNull: false)
  final double carbohydratePercent;
  @JsonKey(name: 'proteinPercent', includeIfNull: false)
  final double proteinPercent;
  @JsonKey(name: 'fatPercent', includeIfNull: false)
  final double fatPercent;
  @JsonKey(name: 'mealsCount', includeIfNull: false)
  final int mealsCount;
  static const fromJsonFactory = _$NutritionModelFromJson;
  static const toJsonFactory = _$NutritionModelToJson;
  Map<String, dynamic> toJson() => _$NutritionModelToJson(this);
}

extension $NutritionModelExtension on NutritionModel {
  NutritionModel copyWith(
      {int calories,
      double carbohydratePercent,
      double proteinPercent,
      double fatPercent,
      int mealsCount}) {
    return NutritionModel(
        calories: calories ?? this.calories,
        carbohydratePercent: carbohydratePercent ?? this.carbohydratePercent,
        proteinPercent: proteinPercent ?? this.proteinPercent,
        fatPercent: fatPercent ?? this.fatPercent,
        mealsCount: mealsCount ?? this.mealsCount);
  }
}

@JsonSerializable(explicitToJson: true)
class Macronutrition {
  Macronutrition({
    this.description,
    this.carbohydrate,
    this.protein,
    this.fat,
    this.sizeIn,
  });

  factory Macronutrition.fromJson(Map<String, dynamic> json) =>
      _$MacronutritionFromJson(json);

  @JsonKey(name: 'description', includeIfNull: false)
  final String description;
  @JsonKey(name: 'carbohydrate', includeIfNull: false)
  final double carbohydrate;
  @JsonKey(name: 'protein', includeIfNull: false)
  final double protein;
  @JsonKey(name: 'fat', includeIfNull: false)
  final double fat;
  @JsonKey(name: 'sizeIn', includeIfNull: false)
  final String sizeIn;
  static const fromJsonFactory = _$MacronutritionFromJson;
  static const toJsonFactory = _$MacronutritionToJson;
  Map<String, dynamic> toJson() => _$MacronutritionToJson(this);
}

extension $MacronutritionExtension on Macronutrition {
  Macronutrition copyWith(
      {String description,
      double carbohydrate,
      double protein,
      double fat,
      String sizeIn}) {
    return Macronutrition(
        description: description ?? this.description,
        carbohydrate: carbohydrate ?? this.carbohydrate,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        sizeIn: sizeIn ?? this.sizeIn);
  }
}

@JsonSerializable(explicitToJson: true)
class CaloriesInputModel {
  CaloriesInputModel({
    this.measure,
    this.desiredWeight,
  });

  factory CaloriesInputModel.fromJson(Map<String, dynamic> json) =>
      _$CaloriesInputModelFromJson(json);

  @JsonKey(name: 'measure', includeIfNull: false)
  final MeasureModel measure;
  @JsonKey(name: 'desiredWeight', includeIfNull: false)
  final double desiredWeight;
  static const fromJsonFactory = _$CaloriesInputModelFromJson;
  static const toJsonFactory = _$CaloriesInputModelToJson;
  Map<String, dynamic> toJson() => _$CaloriesInputModelToJson(this);
}

extension $CaloriesInputModelExtension on CaloriesInputModel {
  CaloriesInputModel copyWith({MeasureModel measure, double desiredWeight}) {
    return CaloriesInputModel(
        measure: measure ?? this.measure,
        desiredWeight: desiredWeight ?? this.desiredWeight);
  }
}

@JsonSerializable(explicitToJson: true)
class CalorieDetails {
  CalorieDetails({
    this.calories,
    this.dailyCalLoss,
    this.weeklyCalLoss,
    this.monthlyCalLoss,
    this.dailyKgLoss,
    this.weeklyKgLoss,
    this.monthlyKgLoss,
    this.daysCount,
    this.beginDate,
    this.finishDate,
    this.zigzag,
    this.scenarioId,
  });

  factory CalorieDetails.fromJson(Map<String, dynamic> json) =>
      _$CalorieDetailsFromJson(json);

  @JsonKey(name: 'calories', includeIfNull: false)
  final int calories;
  @JsonKey(name: 'dailyCalLoss', includeIfNull: false)
  final int dailyCalLoss;
  @JsonKey(name: 'weeklyCalLoss', includeIfNull: false)
  final int weeklyCalLoss;
  @JsonKey(name: 'monthlyCalLoss', includeIfNull: false)
  final int monthlyCalLoss;
  @JsonKey(name: 'dailyKgLoss', includeIfNull: false)
  final double dailyKgLoss;
  @JsonKey(name: 'weeklyKgLoss', includeIfNull: false)
  final double weeklyKgLoss;
  @JsonKey(name: 'monthlyKgLoss', includeIfNull: false)
  final double monthlyKgLoss;
  @JsonKey(name: 'daysCount', includeIfNull: false)
  final int daysCount;
  @JsonKey(name: 'beginDate', includeIfNull: false)
  final DateTime beginDate;
  @JsonKey(name: 'finishDate', includeIfNull: false)
  final DateTime finishDate;
  @JsonKey(name: 'zigzag', includeIfNull: false)
  final Object zigzag;
  @JsonKey(
      name: 'scenarioId',
      includeIfNull: false,
      toJson: scenarioIdToJson,
      fromJson: scenarioIdFromJson)
  final enums.ScenarioId scenarioId;
  static const fromJsonFactory = _$CalorieDetailsFromJson;
  static const toJsonFactory = _$CalorieDetailsToJson;
  Map<String, dynamic> toJson() => _$CalorieDetailsToJson(this);
}

extension $CalorieDetailsExtension on CalorieDetails {
  CalorieDetails copyWith(
      {int calories,
      int dailyCalLoss,
      int weeklyCalLoss,
      int monthlyCalLoss,
      double dailyKgLoss,
      double weeklyKgLoss,
      double monthlyKgLoss,
      int daysCount,
      DateTime beginDate,
      DateTime finishDate,
      Object zigzag,
      enums.ScenarioId scenarioId}) {
    return CalorieDetails(
        calories: calories ?? this.calories,
        dailyCalLoss: dailyCalLoss ?? this.dailyCalLoss,
        weeklyCalLoss: weeklyCalLoss ?? this.weeklyCalLoss,
        monthlyCalLoss: monthlyCalLoss ?? this.monthlyCalLoss,
        dailyKgLoss: dailyKgLoss ?? this.dailyKgLoss,
        weeklyKgLoss: weeklyKgLoss ?? this.weeklyKgLoss,
        monthlyKgLoss: monthlyKgLoss ?? this.monthlyKgLoss,
        daysCount: daysCount ?? this.daysCount,
        beginDate: beginDate ?? this.beginDate,
        finishDate: finishDate ?? this.finishDate,
        zigzag: zigzag ?? this.zigzag,
        scenarioId: scenarioId ?? this.scenarioId);
  }
}

@JsonSerializable(explicitToJson: true)
class CalorieSchedule {
  CalorieSchedule({
    this.calories,
    this.isBelowMinimum,
    this.safeCalories,
    this.desiredCalories,
    this.extremeCalories,
    this.formulaId,
  });

  factory CalorieSchedule.fromJson(Map<String, dynamic> json) =>
      _$CalorieScheduleFromJson(json);

  @JsonKey(name: 'calories', includeIfNull: false)
  final int calories;
  @JsonKey(name: 'isBelowMinimum', includeIfNull: false)
  final bool isBelowMinimum;
  @JsonKey(name: 'safeCalories', includeIfNull: false)
  final CalorieDetails safeCalories;
  @JsonKey(name: 'desiredCalories', includeIfNull: false)
  final CalorieDetails desiredCalories;
  @JsonKey(name: 'extremeCalories', includeIfNull: false)
  final CalorieDetails extremeCalories;
  @JsonKey(
      name: 'formulaId',
      includeIfNull: false,
      toJson: caloriesFormulaIdToJson,
      fromJson: caloriesFormulaIdFromJson)
  final enums.CaloriesFormulaId formulaId;
  static const fromJsonFactory = _$CalorieScheduleFromJson;
  static const toJsonFactory = _$CalorieScheduleToJson;
  Map<String, dynamic> toJson() => _$CalorieScheduleToJson(this);
}

extension $CalorieScheduleExtension on CalorieSchedule {
  CalorieSchedule copyWith(
      {int calories,
      bool isBelowMinimum,
      CalorieDetails safeCalories,
      CalorieDetails desiredCalories,
      CalorieDetails extremeCalories,
      enums.CaloriesFormulaId formulaId}) {
    return CalorieSchedule(
        calories: calories ?? this.calories,
        isBelowMinimum: isBelowMinimum ?? this.isBelowMinimum,
        safeCalories: safeCalories ?? this.safeCalories,
        desiredCalories: desiredCalories ?? this.desiredCalories,
        extremeCalories: extremeCalories ?? this.extremeCalories,
        formulaId: formulaId ?? this.formulaId);
  }
}

@JsonSerializable(explicitToJson: true)
class WaterInputModel {
  WaterInputModel({
    this.measure,
    this.calories,
  });

  factory WaterInputModel.fromJson(Map<String, dynamic> json) =>
      _$WaterInputModelFromJson(json);

  @JsonKey(name: 'measure', includeIfNull: false)
  final MeasureModel measure;
  @JsonKey(name: 'calories', includeIfNull: false)
  final int calories;
  static const fromJsonFactory = _$WaterInputModelFromJson;
  static const toJsonFactory = _$WaterInputModelToJson;
  Map<String, dynamic> toJson() => _$WaterInputModelToJson(this);
}

extension $WaterInputModelExtension on WaterInputModel {
  WaterInputModel copyWith({MeasureModel measure, int calories}) {
    return WaterInputModel(
        measure: measure ?? this.measure, calories: calories ?? this.calories);
  }
}

@JsonSerializable(explicitToJson: true)
class MicronutrionInputModel {
  MicronutrionInputModel({
    this.measure,
    this.countryId,
    this.womanState,
    this.isClimateCold,
  });

  factory MicronutrionInputModel.fromJson(Map<String, dynamic> json) =>
      _$MicronutrionInputModelFromJson(json);

  @JsonKey(name: 'measure', includeIfNull: false)
  final MeasureModel measure;
  @JsonKey(
      name: 'countryId',
      includeIfNull: false,
      toJson: micronutrientCountryToJson,
      fromJson: micronutrientCountryFromJson)
  final enums.MicronutrientCountry countryId;
  @JsonKey(
      name: 'womanState',
      includeIfNull: false,
      toJson: womanStateToJson,
      fromJson: womanStateFromJson)
  final enums.WomanState womanState;
  @JsonKey(name: 'isClimateCold', includeIfNull: false)
  final bool isClimateCold;
  static const fromJsonFactory = _$MicronutrionInputModelFromJson;
  static const toJsonFactory = _$MicronutrionInputModelToJson;
  Map<String, dynamic> toJson() => _$MicronutrionInputModelToJson(this);
}

extension $MicronutrionInputModelExtension on MicronutrionInputModel {
  MicronutrionInputModel copyWith(
      {MeasureModel measure,
      enums.MicronutrientCountry countryId,
      enums.WomanState womanState,
      bool isClimateCold}) {
    return MicronutrionInputModel(
        measure: measure ?? this.measure,
        countryId: countryId ?? this.countryId,
        womanState: womanState ?? this.womanState,
        isClimateCold: isClimateCold ?? this.isClimateCold);
  }
}

@JsonSerializable(explicitToJson: true)
class SmallMicroModel {
  SmallMicroModel({
    this.min,
    this.max,
    this.size,
  });

  factory SmallMicroModel.fromJson(Map<String, dynamic> json) =>
      _$SmallMicroModelFromJson(json);

  @JsonKey(name: 'min', includeIfNull: false)
  final double min;
  @JsonKey(name: 'max', includeIfNull: false)
  final double max;
  @JsonKey(name: 'size', includeIfNull: false)
  final String size;
  static const fromJsonFactory = _$SmallMicroModelFromJson;
  static const toJsonFactory = _$SmallMicroModelToJson;
  Map<String, dynamic> toJson() => _$SmallMicroModelToJson(this);
}

extension $SmallMicroModelExtension on SmallMicroModel {
  SmallMicroModel copyWith({double min, double max, String size}) {
    return SmallMicroModel(
        min: min ?? this.min, max: max ?? this.max, size: size ?? this.size);
  }
}

@JsonSerializable(explicitToJson: true)
class MicroDataModel {
  MicroDataModel({
    this.name,
    this.data,
  });

  factory MicroDataModel.fromJson(Map<String, dynamic> json) =>
      _$MicroDataModelFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'data', includeIfNull: false)
  final SmallMicroModel data;
  static const fromJsonFactory = _$MicroDataModelFromJson;
  static const toJsonFactory = _$MicroDataModelToJson;
  Map<String, dynamic> toJson() => _$MicroDataModelToJson(this);
}

extension $MicroDataModelExtension on MicroDataModel {
  MicroDataModel copyWith({String name, SmallMicroModel data}) {
    return MicroDataModel(name: name ?? this.name, data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MicroCategoryModel {
  MicroCategoryModel({
    this.name,
    this.subcategoryData,
  });

  factory MicroCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MicroCategoryModelFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
      name: 'subcategoryData',
      includeIfNull: false,
      defaultValue: <MicroDataModel>[])
  final List<MicroDataModel> subcategoryData;
  static const fromJsonFactory = _$MicroCategoryModelFromJson;
  static const toJsonFactory = _$MicroCategoryModelToJson;
  Map<String, dynamic> toJson() => _$MicroCategoryModelToJson(this);
}

extension $MicroCategoryModelExtension on MicroCategoryModel {
  MicroCategoryModel copyWith(
      {String name, List<MicroDataModel> subcategoryData}) {
    return MicroCategoryModel(
        name: name ?? this.name,
        subcategoryData: subcategoryData ?? this.subcategoryData);
  }
}

@JsonSerializable(explicitToJson: true)
class MicroModel {
  MicroModel({
    this.name,
    this.categoryData,
  });

  factory MicroModel.fromJson(Map<String, dynamic> json) =>
      _$MicroModelFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
      name: 'categoryData',
      includeIfNull: false,
      defaultValue: <MicroCategoryModel>[])
  final List<MicroCategoryModel> categoryData;
  static const fromJsonFactory = _$MicroModelFromJson;
  static const toJsonFactory = _$MicroModelToJson;
  Map<String, dynamic> toJson() => _$MicroModelToJson(this);
}

extension $MicroModelExtension on MicroModel {
  MicroModel copyWith({String name, List<MicroCategoryModel> categoryData}) {
    return MicroModel(
        name: name ?? this.name,
        categoryData: categoryData ?? this.categoryData);
  }
}

@JsonSerializable(explicitToJson: true)
class BmiInputModel {
  BmiInputModel({
    this.measure,
  });

  factory BmiInputModel.fromJson(Map<String, dynamic> json) =>
      _$BmiInputModelFromJson(json);

  @JsonKey(name: 'measure', includeIfNull: false)
  final MeasureModel measure;
  static const fromJsonFactory = _$BmiInputModelFromJson;
  static const toJsonFactory = _$BmiInputModelToJson;
  Map<String, dynamic> toJson() => _$BmiInputModelToJson(this);
}

extension $BmiInputModelExtension on BmiInputModel {
  BmiInputModel copyWith({MeasureModel measure}) {
    return BmiInputModel(measure: measure ?? this.measure);
  }
}

@JsonSerializable(explicitToJson: true)
class BmiValues {
  BmiValues({
    this.bmi,
    this.ranges,
    this.category,
    this.weights,
    this.difBmiToRanges,
    this.difWeightsToRanges,
    this.difBmiToIdeal,
    this.difWeightsToIdeal,
  });

  factory BmiValues.fromJson(Map<String, dynamic> json) =>
      _$BmiValuesFromJson(json);

  @JsonKey(name: 'bmi', includeIfNull: false)
  final double bmi;
  @JsonKey(name: 'ranges', includeIfNull: false, defaultValue: <double>[])
  final List<double> ranges;
  @JsonKey(
      name: 'category',
      includeIfNull: false,
      toJson: bmiCategoryToJson,
      fromJson: bmiCategoryFromJson)
  final enums.BmiCategory category;
  @JsonKey(name: 'weights', includeIfNull: false, defaultValue: <double>[])
  final List<double> weights;
  @JsonKey(
      name: 'difBmiToRanges', includeIfNull: false, defaultValue: <double>[])
  final List<double> difBmiToRanges;
  @JsonKey(
      name: 'difWeightsToRanges',
      includeIfNull: false,
      defaultValue: <double>[])
  final List<double> difWeightsToRanges;
  @JsonKey(
      name: 'difBmiToIdeal', includeIfNull: false, defaultValue: <double>[])
  final List<double> difBmiToIdeal;
  @JsonKey(
      name: 'difWeightsToIdeal', includeIfNull: false, defaultValue: <double>[])
  final List<double> difWeightsToIdeal;
  static const fromJsonFactory = _$BmiValuesFromJson;
  static const toJsonFactory = _$BmiValuesToJson;
  Map<String, dynamic> toJson() => _$BmiValuesToJson(this);
}

extension $BmiValuesExtension on BmiValues {
  BmiValues copyWith(
      {double bmi,
      List<double> ranges,
      enums.BmiCategory category,
      List<double> weights,
      List<double> difBmiToRanges,
      List<double> difWeightsToRanges,
      List<double> difBmiToIdeal,
      List<double> difWeightsToIdeal}) {
    return BmiValues(
        bmi: bmi ?? this.bmi,
        ranges: ranges ?? this.ranges,
        category: category ?? this.category,
        weights: weights ?? this.weights,
        difBmiToRanges: difBmiToRanges ?? this.difBmiToRanges,
        difWeightsToRanges: difWeightsToRanges ?? this.difWeightsToRanges,
        difBmiToIdeal: difBmiToIdeal ?? this.difBmiToIdeal,
        difWeightsToIdeal: difWeightsToIdeal ?? this.difWeightsToIdeal);
  }
}

@JsonSerializable(explicitToJson: true)
class BmiResult {
  BmiResult({
    this.bmi,
    this.measure,
  });

  factory BmiResult.fromJson(Map<String, dynamic> json) =>
      _$BmiResultFromJson(json);

  @JsonKey(name: 'bmi', includeIfNull: false, defaultValue: <BmiValues>[])
  final List<BmiValues> bmi;
  @JsonKey(name: 'measure', includeIfNull: false)
  final MeasureModel measure;
  static const fromJsonFactory = _$BmiResultFromJson;
  static const toJsonFactory = _$BmiResultToJson;
  Map<String, dynamic> toJson() => _$BmiResultToJson(this);
}

extension $BmiResultExtension on BmiResult {
  BmiResult copyWith({List<BmiValues> bmi, MeasureModel measure}) {
    return BmiResult(bmi: bmi ?? this.bmi, measure: measure ?? this.measure);
  }
}

@JsonSerializable(explicitToJson: true)
class ReportProblemModel {
  ReportProblemModel({
    this.email,
    this.message,
  });

  factory ReportProblemModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemModelFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'message', includeIfNull: false)
  final String message;
  static const fromJsonFactory = _$ReportProblemModelFromJson;
  static const toJsonFactory = _$ReportProblemModelToJson;
  Map<String, dynamic> toJson() => _$ReportProblemModelToJson(this);
}

extension $ReportProblemModelExtension on ReportProblemModel {
  ReportProblemModel copyWith({String email, String message}) {
    return ReportProblemModel(
        email: email ?? this.email, message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class DiaryChartDataRequestModel {
  DiaryChartDataRequestModel({
    this.fromDate,
    this.toDate,
    this.chartTypes,
    this.interval,
  });

  factory DiaryChartDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryChartDataRequestModelFromJson(json);

  @JsonKey(name: 'fromDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime fromDate;
  @JsonKey(name: 'toDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime toDate;
  @JsonKey(
      name: 'chartTypes',
      includeIfNull: false,
      toJson: chartsTypeListToJson,
      fromJson: chartsTypeListFromJson)
  final List<enums.ChartsType> chartTypes;
  @JsonKey(
      name: 'interval',
      includeIfNull: false,
      toJson: intervalTypeToJson,
      fromJson: intervalTypeFromJson)
  final enums.IntervalType interval;
  static const fromJsonFactory = _$DiaryChartDataRequestModelFromJson;
  static const toJsonFactory = _$DiaryChartDataRequestModelToJson;
  Map<String, dynamic> toJson() => _$DiaryChartDataRequestModelToJson(this);
}

extension $DiaryChartDataRequestModelExtension on DiaryChartDataRequestModel {
  DiaryChartDataRequestModel copyWith(
      {DateTime fromDate,
      DateTime toDate,
      List<enums.ChartsType> chartTypes,
      enums.IntervalType interval}) {
    return DiaryChartDataRequestModel(
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        chartTypes: chartTypes ?? this.chartTypes,
        interval: interval ?? this.interval);
  }
}

@JsonSerializable(explicitToJson: true)
class Spot {
  Spot({
    this.x,
    this.y,
  });

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  @JsonKey(name: 'x', includeIfNull: false)
  final double x;
  @JsonKey(name: 'y', includeIfNull: false)
  final double y;
  static const fromJsonFactory = _$SpotFromJson;
  static const toJsonFactory = _$SpotToJson;
  Map<String, dynamic> toJson() => _$SpotToJson(this);
}

extension $SpotExtension on Spot {
  Spot copyWith({double x, double y}) {
    return Spot(x: x ?? this.x, y: y ?? this.y);
  }
}

@JsonSerializable(explicitToJson: true)
class ChartAddition {
  ChartAddition({
    this.name,
    this.spots,
  });

  factory ChartAddition.fromJson(Map<String, dynamic> json) =>
      _$ChartAdditionFromJson(json);

  @JsonKey(
      name: 'name',
      includeIfNull: false,
      toJson: chartsAdditionTypeToJson,
      fromJson: chartsAdditionTypeFromJson)
  final enums.ChartsAdditionType name;
  @JsonKey(name: 'spots', includeIfNull: false, defaultValue: <Spot>[])
  final List<Spot> spots;
  static const fromJsonFactory = _$ChartAdditionFromJson;
  static const toJsonFactory = _$ChartAdditionToJson;
  Map<String, dynamic> toJson() => _$ChartAdditionToJson(this);
}

extension $ChartAdditionExtension on ChartAddition {
  ChartAddition copyWith({enums.ChartsAdditionType name, List<Spot> spots}) {
    return ChartAddition(name: name ?? this.name, spots: spots ?? this.spots);
  }
}

@JsonSerializable(explicitToJson: true)
class ChartPlot {
  ChartPlot({
    this.name,
    this.spots,
    this.chartAdditions,
  });

  factory ChartPlot.fromJson(Map<String, dynamic> json) =>
      _$ChartPlotFromJson(json);

  @JsonKey(
      name: 'name',
      includeIfNull: false,
      toJson: chartsTypeToJson,
      fromJson: chartsTypeFromJson)
  final enums.ChartsType name;
  @JsonKey(name: 'spots', includeIfNull: false, defaultValue: <Spot>[])
  final List<Spot> spots;
  @JsonKey(
      name: 'chartAdditions',
      includeIfNull: false,
      defaultValue: <ChartAddition>[])
  final List<ChartAddition> chartAdditions;
  static const fromJsonFactory = _$ChartPlotFromJson;
  static const toJsonFactory = _$ChartPlotToJson;
  Map<String, dynamic> toJson() => _$ChartPlotToJson(this);
}

extension $ChartPlotExtension on ChartPlot {
  ChartPlot copyWith(
      {enums.ChartsType name,
      List<Spot> spots,
      List<ChartAddition> chartAdditions}) {
    return ChartPlot(
        name: name ?? this.name,
        spots: spots ?? this.spots,
        chartAdditions: chartAdditions ?? this.chartAdditions);
  }
}

@JsonSerializable(explicitToJson: true)
class ChartDataModel {
  ChartDataModel({
    this.xAxisType,
    this.yAxisType,
    this.plots,
  });

  factory ChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChartDataModelFromJson(json);

  @JsonKey(
      name: 'xAxisType',
      includeIfNull: false,
      toJson: chartsAxisTypeToJson,
      fromJson: chartsAxisTypeFromJson)
  final enums.ChartsAxisType xAxisType;
  @JsonKey(
      name: 'yAxisType',
      includeIfNull: false,
      toJson: chartsAxisTypeToJson,
      fromJson: chartsAxisTypeFromJson)
  final enums.ChartsAxisType yAxisType;
  @JsonKey(name: 'plots', includeIfNull: false, defaultValue: <ChartPlot>[])
  final List<ChartPlot> plots;
  static const fromJsonFactory = _$ChartDataModelFromJson;
  static const toJsonFactory = _$ChartDataModelToJson;
  Map<String, dynamic> toJson() => _$ChartDataModelToJson(this);
}

extension $ChartDataModelExtension on ChartDataModel {
  ChartDataModel copyWith(
      {enums.ChartsAxisType xAxisType,
      enums.ChartsAxisType yAxisType,
      List<ChartPlot> plots}) {
    return ChartDataModel(
        xAxisType: xAxisType ?? this.xAxisType,
        yAxisType: yAxisType ?? this.yAxisType,
        plots: plots ?? this.plots);
  }
}

@JsonSerializable(explicitToJson: true)
class FoodEventModel {
  FoodEventModel({
    this.diaryId,
    this.date,
    this.foodType,
    this.amount,
    this.productId,
    this.portionSizeId,
  });

  factory FoodEventModel.fromJson(Map<String, dynamic> json) =>
      _$FoodEventModelFromJson(json);

  @JsonKey(name: 'diaryId', includeIfNull: false)
  final int diaryId;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime date;
  @JsonKey(
      name: 'foodType',
      includeIfNull: false,
      toJson: foodTypeToJson,
      fromJson: foodTypeFromJson)
  final enums.FoodType foodType;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double amount;
  @JsonKey(name: 'productId', includeIfNull: false)
  final int productId;
  @JsonKey(name: 'portionSizeId', includeIfNull: false)
  final int portionSizeId;
  static const fromJsonFactory = _$FoodEventModelFromJson;
  static const toJsonFactory = _$FoodEventModelToJson;
  Map<String, dynamic> toJson() => _$FoodEventModelToJson(this);
}

extension $FoodEventModelExtension on FoodEventModel {
  FoodEventModel copyWith(
      {int diaryId,
      DateTime date,
      enums.FoodType foodType,
      double amount,
      int productId,
      int portionSizeId}) {
    return FoodEventModel(
        diaryId: diaryId ?? this.diaryId,
        date: date ?? this.date,
        foodType: foodType ?? this.foodType,
        amount: amount ?? this.amount,
        productId: productId ?? this.productId,
        portionSizeId: portionSizeId ?? this.portionSizeId);
  }
}

@JsonSerializable(explicitToJson: true)
class ExerciseEventModel {
  ExerciseEventModel({
    this.diaryId,
    this.date,
    this.amount,
    this.exerciseId,
  });

  factory ExerciseEventModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseEventModelFromJson(json);

  @JsonKey(name: 'diaryId', includeIfNull: false)
  final int diaryId;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime date;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double amount;
  @JsonKey(name: 'exerciseId', includeIfNull: false)
  final int exerciseId;
  static const fromJsonFactory = _$ExerciseEventModelFromJson;
  static const toJsonFactory = _$ExerciseEventModelToJson;
  Map<String, dynamic> toJson() => _$ExerciseEventModelToJson(this);
}

extension $ExerciseEventModelExtension on ExerciseEventModel {
  ExerciseEventModel copyWith(
      {int diaryId, DateTime date, double amount, int exerciseId}) {
    return ExerciseEventModel(
        diaryId: diaryId ?? this.diaryId,
        date: date ?? this.date,
        amount: amount ?? this.amount,
        exerciseId: exerciseId ?? this.exerciseId);
  }
}

@JsonSerializable(explicitToJson: true)
class RequestByDatesModel {
  RequestByDatesModel({
    this.fromDate,
    this.toDate,
  });

  factory RequestByDatesModel.fromJson(Map<String, dynamic> json) =>
      _$RequestByDatesModelFromJson(json);

  @JsonKey(name: 'fromDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime fromDate;
  @JsonKey(name: 'toDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime toDate;
  static const fromJsonFactory = _$RequestByDatesModelFromJson;
  static const toJsonFactory = _$RequestByDatesModelToJson;
  Map<String, dynamic> toJson() => _$RequestByDatesModelToJson(this);
}

extension $RequestByDatesModelExtension on RequestByDatesModel {
  RequestByDatesModel copyWith({DateTime fromDate, DateTime toDate}) {
    return RequestByDatesModel(
        fromDate: fromDate ?? this.fromDate, toDate: toDate ?? this.toDate);
  }
}

@JsonSerializable(explicitToJson: true)
class DiaryProduct {
  DiaryProduct({
    this.id,
    this.diaryDayId,
    this.foodType,
    this.name,
    this.productId,
    this.amount,
    this.calorie,
    this.fat,
    this.carb,
    this.protein,
    this.portionTypeId,
    this.portionTypeName,
    this.portionWeight,
    this.portionSizeId,
    this.isCustom,
    this.isFavorite,
    this.categoryName,
    this.categoryId,
  });

  factory DiaryProduct.fromJson(Map<String, dynamic> json) =>
      _$DiaryProductFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'diaryDayId', includeIfNull: false)
  final int diaryDayId;
  @JsonKey(
      name: 'foodType',
      includeIfNull: false,
      toJson: foodTypeToJson,
      fromJson: foodTypeFromJson)
  final enums.FoodType foodType;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'productId', includeIfNull: false)
  final int productId;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double amount;
  @JsonKey(name: 'calorie', includeIfNull: false)
  final double calorie;
  @JsonKey(name: 'fat', includeIfNull: false)
  final double fat;
  @JsonKey(name: 'carb', includeIfNull: false)
  final double carb;
  @JsonKey(name: 'protein', includeIfNull: false)
  final double protein;
  @JsonKey(name: 'portionTypeId', includeIfNull: false)
  final int portionTypeId;
  @JsonKey(name: 'portionTypeName', includeIfNull: false)
  final String portionTypeName;
  @JsonKey(name: 'portionWeight', includeIfNull: false)
  final double portionWeight;
  @JsonKey(name: 'portionSizeId', includeIfNull: false)
  final int portionSizeId;
  @JsonKey(name: 'isCustom', includeIfNull: false)
  final bool isCustom;
  @JsonKey(name: 'isFavorite', includeIfNull: false)
  final bool isFavorite;
  @JsonKey(name: 'categoryName', includeIfNull: false)
  final String categoryName;
  @JsonKey(name: 'categoryId', includeIfNull: false)
  final int categoryId;
  static const fromJsonFactory = _$DiaryProductFromJson;
  static const toJsonFactory = _$DiaryProductToJson;
  Map<String, dynamic> toJson() => _$DiaryProductToJson(this);
}

extension $DiaryProductExtension on DiaryProduct {
  DiaryProduct copyWith(
      {int id,
      int diaryDayId,
      enums.FoodType foodType,
      String name,
      int productId,
      double amount,
      double calorie,
      double fat,
      double carb,
      double protein,
      int portionTypeId,
      String portionTypeName,
      double portionWeight,
      int portionSizeId,
      bool isCustom,
      bool isFavorite,
      String categoryName,
      int categoryId}) {
    return DiaryProduct(
        id: id ?? this.id,
        diaryDayId: diaryDayId ?? this.diaryDayId,
        foodType: foodType ?? this.foodType,
        name: name ?? this.name,
        productId: productId ?? this.productId,
        amount: amount ?? this.amount,
        calorie: calorie ?? this.calorie,
        fat: fat ?? this.fat,
        carb: carb ?? this.carb,
        protein: protein ?? this.protein,
        portionTypeId: portionTypeId ?? this.portionTypeId,
        portionTypeName: portionTypeName ?? this.portionTypeName,
        portionWeight: portionWeight ?? this.portionWeight,
        portionSizeId: portionSizeId ?? this.portionSizeId,
        isCustom: isCustom ?? this.isCustom,
        isFavorite: isFavorite ?? this.isFavorite,
        categoryName: categoryName ?? this.categoryName,
        categoryId: categoryId ?? this.categoryId);
  }
}

@JsonSerializable(explicitToJson: true)
class FoodContainer {
  FoodContainer({
    this.id,
    this.name,
    this.products,
    this.time,
    this.visible,
    this.water,
  });

  factory FoodContainer.fromJson(Map<String, dynamic> json) =>
      _$FoodContainerFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
      name: 'products', includeIfNull: false, defaultValue: <DiaryProduct>[])
  final List<DiaryProduct> products;
  @JsonKey(name: 'time', includeIfNull: false)
  final String time;
  @JsonKey(name: 'visible', includeIfNull: false)
  final bool visible;
  @JsonKey(name: 'water', includeIfNull: false)
  final double water;
  static const fromJsonFactory = _$FoodContainerFromJson;
  static const toJsonFactory = _$FoodContainerToJson;
  Map<String, dynamic> toJson() => _$FoodContainerToJson(this);
}

extension $FoodContainerExtension on FoodContainer {
  FoodContainer copyWith(
      {int id,
      String name,
      List<DiaryProduct> products,
      String time,
      bool visible,
      double water}) {
    return FoodContainer(
        id: id ?? this.id,
        name: name ?? this.name,
        products: products ?? this.products,
        time: time ?? this.time,
        visible: visible ?? this.visible,
        water: water ?? this.water);
  }
}

@JsonSerializable(explicitToJson: true)
class DailySummary {
  DailySummary({
    this.foodCalorie,
    this.exerciseCalorie,
    this.targetCalorie,
    this.targetPlusExerciseCalorie,
    this.targetFat,
    this.targetProtein,
    this.targetCarb,
    this.weightDifference,
    this.waistDifference,
    this.fat,
    this.protein,
    this.carb,
    this.startWeight,
    this.currentWeight,
    this.targetWeight,
    this.currentWater,
    this.targetWater,
  });

  factory DailySummary.fromJson(Map<String, dynamic> json) =>
      _$DailySummaryFromJson(json);

  @JsonKey(name: 'foodCalorie', includeIfNull: false)
  final int foodCalorie;
  @JsonKey(name: 'exerciseCalorie', includeIfNull: false)
  final int exerciseCalorie;
  @JsonKey(name: 'targetCalorie', includeIfNull: false)
  final int targetCalorie;
  @JsonKey(name: 'targetPlusExerciseCalorie', includeIfNull: false)
  final int targetPlusExerciseCalorie;
  @JsonKey(name: 'targetFat', includeIfNull: false)
  final double targetFat;
  @JsonKey(name: 'targetProtein', includeIfNull: false)
  final double targetProtein;
  @JsonKey(name: 'targetCarb', includeIfNull: false)
  final double targetCarb;
  @JsonKey(name: 'weightDifference', includeIfNull: false)
  final double weightDifference;
  @JsonKey(name: 'waistDifference', includeIfNull: false)
  final double waistDifference;
  @JsonKey(name: 'fat', includeIfNull: false)
  final double fat;
  @JsonKey(name: 'protein', includeIfNull: false)
  final double protein;
  @JsonKey(name: 'carb', includeIfNull: false)
  final double carb;
  @JsonKey(name: 'startWeight', includeIfNull: false)
  final double startWeight;
  @JsonKey(name: 'currentWeight', includeIfNull: false)
  final double currentWeight;
  @JsonKey(name: 'targetWeight', includeIfNull: false)
  final double targetWeight;
  @JsonKey(name: 'currentWater', includeIfNull: false)
  final double currentWater;
  @JsonKey(name: 'targetWater', includeIfNull: false)
  final double targetWater;
  static const fromJsonFactory = _$DailySummaryFromJson;
  static const toJsonFactory = _$DailySummaryToJson;
  Map<String, dynamic> toJson() => _$DailySummaryToJson(this);
}

extension $DailySummaryExtension on DailySummary {
  DailySummary copyWith(
      {int foodCalorie,
      int exerciseCalorie,
      int targetCalorie,
      int targetPlusExerciseCalorie,
      double targetFat,
      double targetProtein,
      double targetCarb,
      double weightDifference,
      double waistDifference,
      double fat,
      double protein,
      double carb,
      double startWeight,
      double currentWeight,
      double targetWeight,
      double currentWater,
      double targetWater}) {
    return DailySummary(
        foodCalorie: foodCalorie ?? this.foodCalorie,
        exerciseCalorie: exerciseCalorie ?? this.exerciseCalorie,
        targetCalorie: targetCalorie ?? this.targetCalorie,
        targetPlusExerciseCalorie:
            targetPlusExerciseCalorie ?? this.targetPlusExerciseCalorie,
        targetFat: targetFat ?? this.targetFat,
        targetProtein: targetProtein ?? this.targetProtein,
        targetCarb: targetCarb ?? this.targetCarb,
        weightDifference: weightDifference ?? this.weightDifference,
        waistDifference: waistDifference ?? this.waistDifference,
        fat: fat ?? this.fat,
        protein: protein ?? this.protein,
        carb: carb ?? this.carb,
        startWeight: startWeight ?? this.startWeight,
        currentWeight: currentWeight ?? this.currentWeight,
        targetWeight: targetWeight ?? this.targetWeight,
        currentWater: currentWater ?? this.currentWater,
        targetWater: targetWater ?? this.targetWater);
  }
}

@JsonSerializable(explicitToJson: true)
class DiaryDayModel {
  DiaryDayModel({
    this.diaryId,
    this.date,
    this.unixDate,
    this.foodContainers,
    this.summary,
  });

  factory DiaryDayModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryDayModelFromJson(json);

  @JsonKey(name: 'diaryId', includeIfNull: false)
  final int diaryId;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime date;
  @JsonKey(name: 'unixDate', includeIfNull: false)
  final int unixDate;
  @JsonKey(
      name: 'foodContainers',
      includeIfNull: false,
      defaultValue: <FoodContainer>[])
  final List<FoodContainer> foodContainers;
  @JsonKey(name: 'summary', includeIfNull: false)
  final DailySummary summary;
  static const fromJsonFactory = _$DiaryDayModelFromJson;
  static const toJsonFactory = _$DiaryDayModelToJson;
  Map<String, dynamic> toJson() => _$DiaryDayModelToJson(this);
}

extension $DiaryDayModelExtension on DiaryDayModel {
  DiaryDayModel copyWith(
      {int diaryId,
      DateTime date,
      int unixDate,
      List<FoodContainer> foodContainers,
      DailySummary summary}) {
    return DiaryDayModel(
        diaryId: diaryId ?? this.diaryId,
        date: date ?? this.date,
        unixDate: unixDate ?? this.unixDate,
        foodContainers: foodContainers ?? this.foodContainers,
        summary: summary ?? this.summary);
  }
}

@JsonSerializable(explicitToJson: true)
class DiaryDayExercise {
  DiaryDayExercise({
    this.id,
    this.name,
    this.exerciseId,
    this.amount,
    this.calories,
    this.isCustom,
    this.isFavorite,
  });

  factory DiaryDayExercise.fromJson(Map<String, dynamic> json) =>
      _$DiaryDayExerciseFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'exerciseId', includeIfNull: false)
  final int exerciseId;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double amount;
  @JsonKey(name: 'calories', includeIfNull: false)
  final double calories;
  @JsonKey(name: 'isCustom', includeIfNull: false)
  final bool isCustom;
  @JsonKey(name: 'isFavorite', includeIfNull: false)
  final bool isFavorite;
  static const fromJsonFactory = _$DiaryDayExerciseFromJson;
  static const toJsonFactory = _$DiaryDayExerciseToJson;
  Map<String, dynamic> toJson() => _$DiaryDayExerciseToJson(this);
}

extension $DiaryDayExerciseExtension on DiaryDayExercise {
  DiaryDayExercise copyWith(
      {int id,
      String name,
      int exerciseId,
      double amount,
      double calories,
      bool isCustom,
      bool isFavorite}) {
    return DiaryDayExercise(
        id: id ?? this.id,
        name: name ?? this.name,
        exerciseId: exerciseId ?? this.exerciseId,
        amount: amount ?? this.amount,
        calories: calories ?? this.calories,
        isCustom: isCustom ?? this.isCustom,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}

@JsonSerializable(explicitToJson: true)
class DiaryDayExercises {
  DiaryDayExercises({
    this.diaryId,
    this.date,
    this.unixDate,
    this.exercises,
  });

  factory DiaryDayExercises.fromJson(Map<String, dynamic> json) =>
      _$DiaryDayExercisesFromJson(json);

  @JsonKey(name: 'diaryId', includeIfNull: false)
  final int diaryId;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime date;
  @JsonKey(name: 'unixDate', includeIfNull: false)
  final int unixDate;
  @JsonKey(
      name: 'exercises',
      includeIfNull: false,
      defaultValue: <DiaryDayExercise>[])
  final List<DiaryDayExercise> exercises;
  static const fromJsonFactory = _$DiaryDayExercisesFromJson;
  static const toJsonFactory = _$DiaryDayExercisesToJson;
  Map<String, dynamic> toJson() => _$DiaryDayExercisesToJson(this);
}

extension $DiaryDayExercisesExtension on DiaryDayExercises {
  DiaryDayExercises copyWith(
      {int diaryId,
      DateTime date,
      int unixDate,
      List<DiaryDayExercise> exercises}) {
    return DiaryDayExercises(
        diaryId: diaryId ?? this.diaryId,
        date: date ?? this.date,
        unixDate: unixDate ?? this.unixDate,
        exercises: exercises ?? this.exercises);
  }
}

@JsonSerializable(explicitToJson: true)
class ExerciseSimpleModel {
  ExerciseSimpleModel({
    this.id,
    this.name,
    this.categoryId,
    this.caloriesPerKg,
  });

  factory ExerciseSimpleModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSimpleModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'categoryId', includeIfNull: false)
  final int categoryId;
  @JsonKey(name: 'caloriesPerKg', includeIfNull: false)
  final double caloriesPerKg;
  static const fromJsonFactory = _$ExerciseSimpleModelFromJson;
  static const toJsonFactory = _$ExerciseSimpleModelToJson;
  Map<String, dynamic> toJson() => _$ExerciseSimpleModelToJson(this);
}

extension $ExerciseSimpleModelExtension on ExerciseSimpleModel {
  ExerciseSimpleModel copyWith(
      {int id, String name, int categoryId, double caloriesPerKg}) {
    return ExerciseSimpleModel(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        caloriesPerKg: caloriesPerKg ?? this.caloriesPerKg);
  }
}

@JsonSerializable(explicitToJson: true)
class ProductSearchModel {
  ProductSearchModel({
    this.name,
    this.currentPage,
    this.pageSize,
  });

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchModelFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'currentPage', includeIfNull: false)
  final int currentPage;
  @JsonKey(name: 'pageSize', includeIfNull: false)
  final int pageSize;
  static const fromJsonFactory = _$ProductSearchModelFromJson;
  static const toJsonFactory = _$ProductSearchModelToJson;
  Map<String, dynamic> toJson() => _$ProductSearchModelToJson(this);
}

extension $ProductSearchModelExtension on ProductSearchModel {
  ProductSearchModel copyWith({String name, int currentPage, int pageSize}) {
    return ProductSearchModel(
        name: name ?? this.name,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize);
  }
}

@JsonSerializable(explicitToJson: true)
class ProductSimpleModel {
  ProductSimpleModel({
    this.id,
    this.name,
    this.protein,
    this.fat,
    this.carbon,
    this.calorie,
    this.categoryId,
    this.categoryName,
    this.portionSizeId,
    this.portionSize,
    this.portionTypeName,
    this.portionTypeId,
  });

  factory ProductSimpleModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSimpleModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'protein', includeIfNull: false)
  final double protein;
  @JsonKey(name: 'fat', includeIfNull: false)
  final double fat;
  @JsonKey(name: 'carbon', includeIfNull: false)
  final double carbon;
  @JsonKey(name: 'calorie', includeIfNull: false)
  final double calorie;
  @JsonKey(name: 'categoryId', includeIfNull: false)
  final int categoryId;
  @JsonKey(name: 'categoryName', includeIfNull: false)
  final String categoryName;
  @JsonKey(name: 'portionSizeId', includeIfNull: false)
  final int portionSizeId;
  @JsonKey(name: 'portionSize', includeIfNull: false)
  final double portionSize;
  @JsonKey(name: 'portionTypeName', includeIfNull: false)
  final String portionTypeName;
  @JsonKey(name: 'portionTypeId', includeIfNull: false)
  final int portionTypeId;
  static const fromJsonFactory = _$ProductSimpleModelFromJson;
  static const toJsonFactory = _$ProductSimpleModelToJson;
  Map<String, dynamic> toJson() => _$ProductSimpleModelToJson(this);
}

extension $ProductSimpleModelExtension on ProductSimpleModel {
  ProductSimpleModel copyWith(
      {int id,
      String name,
      double protein,
      double fat,
      double carbon,
      double calorie,
      int categoryId,
      String categoryName,
      int portionSizeId,
      double portionSize,
      String portionTypeName,
      int portionTypeId}) {
    return ProductSimpleModel(
        id: id ?? this.id,
        name: name ?? this.name,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbon: carbon ?? this.carbon,
        calorie: calorie ?? this.calorie,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        portionSizeId: portionSizeId ?? this.portionSizeId,
        portionSize: portionSize ?? this.portionSize,
        portionTypeName: portionTypeName ?? this.portionTypeName,
        portionTypeId: portionTypeId ?? this.portionTypeId);
  }
}

@JsonSerializable(explicitToJson: true)
class MeasureChartDataRequestModel {
  MeasureChartDataRequestModel({
    this.fromDate,
    this.toDate,
    this.chartTypes,
  });

  factory MeasureChartDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MeasureChartDataRequestModelFromJson(json);

  @JsonKey(name: 'fromDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime fromDate;
  @JsonKey(name: 'toDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime toDate;
  @JsonKey(
      name: 'chartTypes',
      includeIfNull: false,
      toJson: chartsTypeListToJson,
      fromJson: chartsTypeListFromJson)
  final List<enums.ChartsType> chartTypes;
  static const fromJsonFactory = _$MeasureChartDataRequestModelFromJson;
  static const toJsonFactory = _$MeasureChartDataRequestModelToJson;
  Map<String, dynamic> toJson() => _$MeasureChartDataRequestModelToJson(this);
}

extension $MeasureChartDataRequestModelExtension
    on MeasureChartDataRequestModel {
  MeasureChartDataRequestModel copyWith(
      {DateTime fromDate, DateTime toDate, List<enums.ChartsType> chartTypes}) {
    return MeasureChartDataRequestModel(
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        chartTypes: chartTypes ?? this.chartTypes);
  }
}

String sexToJson(enums.Sex sex) {
  return enums.$SexMap[sex];
}

enums.Sex sexFromJson(String sex) {
  if (sex == null) {
    return enums.Sex.swaggerGeneratedUnknown;
  }

  return enums.$SexMap.entries
          .firstWhere(
              (element) => element.value.toLowerCase() == sex.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.Sex.swaggerGeneratedUnknown;
}

List<String> sexListToJson(List<enums.Sex> sex) {
  if (sex == null) {
    return null;
  }

  return sex.map((e) => enums.$SexMap[e]).toList();
}

List<enums.Sex> sexListFromJson(List sex) {
  if (sex == null) {
    return [];
  }

  return sex.map((e) => sexFromJson(e.toString())).toList();
}

String activityToJson(enums.Activity activity) {
  return enums.$ActivityMap[activity];
}

enums.Activity activityFromJson(String activity) {
  if (activity == null) {
    return enums.Activity.swaggerGeneratedUnknown;
  }

  return enums.$ActivityMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == activity.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.Activity.swaggerGeneratedUnknown;
}

List<String> activityListToJson(List<enums.Activity> activity) {
  if (activity == null) {
    return null;
  }

  return activity.map((e) => enums.$ActivityMap[e]).toList();
}

List<enums.Activity> activityListFromJson(List activity) {
  if (activity == null) {
    return [];
  }

  return activity.map((e) => activityFromJson(e.toString())).toList();
}

String caloriesFormulaIdToJson(enums.CaloriesFormulaId caloriesFormulaId) {
  return enums.$CaloriesFormulaIdMap[caloriesFormulaId];
}

enums.CaloriesFormulaId caloriesFormulaIdFromJson(String caloriesFormulaId) {
  if (caloriesFormulaId == null) {
    return enums.CaloriesFormulaId.swaggerGeneratedUnknown;
  }

  return enums.$CaloriesFormulaIdMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() ==
                  caloriesFormulaId.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.CaloriesFormulaId.swaggerGeneratedUnknown;
}

List<String> caloriesFormulaIdListToJson(
    List<enums.CaloriesFormulaId> caloriesFormulaId) {
  if (caloriesFormulaId == null) {
    return null;
  }

  return caloriesFormulaId.map((e) => enums.$CaloriesFormulaIdMap[e]).toList();
}

List<enums.CaloriesFormulaId> caloriesFormulaIdListFromJson(
    List caloriesFormulaId) {
  if (caloriesFormulaId == null) {
    return [];
  }

  return caloriesFormulaId
      .map((e) => caloriesFormulaIdFromJson(e.toString()))
      .toList();
}

String scenarioIdToJson(enums.ScenarioId scenarioId) {
  return enums.$ScenarioIdMap[scenarioId];
}

enums.ScenarioId scenarioIdFromJson(String scenarioId) {
  if (scenarioId == null) {
    return enums.ScenarioId.swaggerGeneratedUnknown;
  }

  return enums.$ScenarioIdMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == scenarioId.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.ScenarioId.swaggerGeneratedUnknown;
}

List<String> scenarioIdListToJson(List<enums.ScenarioId> scenarioId) {
  if (scenarioId == null) {
    return null;
  }

  return scenarioId.map((e) => enums.$ScenarioIdMap[e]).toList();
}

List<enums.ScenarioId> scenarioIdListFromJson(List scenarioId) {
  if (scenarioId == null) {
    return [];
  }

  return scenarioId.map((e) => scenarioIdFromJson(e.toString())).toList();
}

String micronutrientCountryToJson(
    enums.MicronutrientCountry micronutrientCountry) {
  return enums.$MicronutrientCountryMap[micronutrientCountry];
}

enums.MicronutrientCountry micronutrientCountryFromJson(
    String micronutrientCountry) {
  if (micronutrientCountry == null) {
    return enums.MicronutrientCountry.swaggerGeneratedUnknown;
  }

  return enums.$MicronutrientCountryMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() ==
                  micronutrientCountry.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.MicronutrientCountry.swaggerGeneratedUnknown;
}

List<String> micronutrientCountryListToJson(
    List<enums.MicronutrientCountry> micronutrientCountry) {
  if (micronutrientCountry == null) {
    return null;
  }

  return micronutrientCountry
      .map((e) => enums.$MicronutrientCountryMap[e])
      .toList();
}

List<enums.MicronutrientCountry> micronutrientCountryListFromJson(
    List micronutrientCountry) {
  if (micronutrientCountry == null) {
    return [];
  }

  return micronutrientCountry
      .map((e) => micronutrientCountryFromJson(e.toString()))
      .toList();
}

String womanStateToJson(enums.WomanState womanState) {
  return enums.$WomanStateMap[womanState];
}

enums.WomanState womanStateFromJson(String womanState) {
  if (womanState == null) {
    return enums.WomanState.swaggerGeneratedUnknown;
  }

  return enums.$WomanStateMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == womanState.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.WomanState.swaggerGeneratedUnknown;
}

List<String> womanStateListToJson(List<enums.WomanState> womanState) {
  if (womanState == null) {
    return null;
  }

  return womanState.map((e) => enums.$WomanStateMap[e]).toList();
}

List<enums.WomanState> womanStateListFromJson(List womanState) {
  if (womanState == null) {
    return [];
  }

  return womanState.map((e) => womanStateFromJson(e.toString())).toList();
}

String bmiCategoryToJson(enums.BmiCategory bmiCategory) {
  return enums.$BmiCategoryMap[bmiCategory];
}

enums.BmiCategory bmiCategoryFromJson(String bmiCategory) {
  if (bmiCategory == null) {
    return enums.BmiCategory.swaggerGeneratedUnknown;
  }

  return enums.$BmiCategoryMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == bmiCategory.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.BmiCategory.swaggerGeneratedUnknown;
}

List<String> bmiCategoryListToJson(List<enums.BmiCategory> bmiCategory) {
  if (bmiCategory == null) {
    return null;
  }

  return bmiCategory.map((e) => enums.$BmiCategoryMap[e]).toList();
}

List<enums.BmiCategory> bmiCategoryListFromJson(List bmiCategory) {
  if (bmiCategory == null) {
    return [];
  }

  return bmiCategory.map((e) => bmiCategoryFromJson(e.toString())).toList();
}

String chartsTypeToJson(enums.ChartsType chartsType) {
  return enums.$ChartsTypeMap[chartsType];
}

enums.ChartsType chartsTypeFromJson(String chartsType) {
  if (chartsType == null) {
    return enums.ChartsType.swaggerGeneratedUnknown;
  }

  return enums.$ChartsTypeMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == chartsType.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.ChartsType.swaggerGeneratedUnknown;
}

List<String> chartsTypeListToJson(List<enums.ChartsType> chartsType) {
  if (chartsType == null) {
    return null;
  }

  return chartsType.map((e) => enums.$ChartsTypeMap[e]).toList();
}

List<enums.ChartsType> chartsTypeListFromJson(List chartsType) {
  if (chartsType == null) {
    return [];
  }

  return chartsType.map((e) => chartsTypeFromJson(e.toString())).toList();
}

String intervalTypeToJson(enums.IntervalType intervalType) {
  return enums.$IntervalTypeMap[intervalType];
}

enums.IntervalType intervalTypeFromJson(String intervalType) {
  if (intervalType == null) {
    return enums.IntervalType.swaggerGeneratedUnknown;
  }

  return enums.$IntervalTypeMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == intervalType.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.IntervalType.swaggerGeneratedUnknown;
}

List<String> intervalTypeListToJson(List<enums.IntervalType> intervalType) {
  if (intervalType == null) {
    return null;
  }

  return intervalType.map((e) => enums.$IntervalTypeMap[e]).toList();
}

List<enums.IntervalType> intervalTypeListFromJson(List intervalType) {
  if (intervalType == null) {
    return [];
  }

  return intervalType.map((e) => intervalTypeFromJson(e.toString())).toList();
}

String chartsAxisTypeToJson(enums.ChartsAxisType chartsAxisType) {
  return enums.$ChartsAxisTypeMap[chartsAxisType];
}

enums.ChartsAxisType chartsAxisTypeFromJson(String chartsAxisType) {
  if (chartsAxisType == null) {
    return enums.ChartsAxisType.swaggerGeneratedUnknown;
  }

  return enums.$ChartsAxisTypeMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == chartsAxisType.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.ChartsAxisType.swaggerGeneratedUnknown;
}

List<String> chartsAxisTypeListToJson(
    List<enums.ChartsAxisType> chartsAxisType) {
  if (chartsAxisType == null) {
    return null;
  }

  return chartsAxisType.map((e) => enums.$ChartsAxisTypeMap[e]).toList();
}

List<enums.ChartsAxisType> chartsAxisTypeListFromJson(List chartsAxisType) {
  if (chartsAxisType == null) {
    return [];
  }

  return chartsAxisType
      .map((e) => chartsAxisTypeFromJson(e.toString()))
      .toList();
}

String chartsAdditionTypeToJson(enums.ChartsAdditionType chartsAdditionType) {
  return enums.$ChartsAdditionTypeMap[chartsAdditionType];
}

enums.ChartsAdditionType chartsAdditionTypeFromJson(String chartsAdditionType) {
  if (chartsAdditionType == null) {
    return enums.ChartsAdditionType.swaggerGeneratedUnknown;
  }

  return enums.$ChartsAdditionTypeMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() ==
                  chartsAdditionType.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.ChartsAdditionType.swaggerGeneratedUnknown;
}

List<String> chartsAdditionTypeListToJson(
    List<enums.ChartsAdditionType> chartsAdditionType) {
  if (chartsAdditionType == null) {
    return null;
  }

  return chartsAdditionType
      .map((e) => enums.$ChartsAdditionTypeMap[e])
      .toList();
}

List<enums.ChartsAdditionType> chartsAdditionTypeListFromJson(
    List chartsAdditionType) {
  if (chartsAdditionType == null) {
    return [];
  }

  return chartsAdditionType
      .map((e) => chartsAdditionTypeFromJson(e.toString()))
      .toList();
}

String foodTypeToJson(enums.FoodType foodType) {
  return enums.$FoodTypeMap[foodType];
}

enums.FoodType foodTypeFromJson(String foodType) {
  if (foodType == null) {
    return enums.FoodType.swaggerGeneratedUnknown;
  }

  return enums.$FoodTypeMap.entries
          .firstWhere(
              (element) =>
                  element.value.toLowerCase() == foodType.toLowerCase(),
              orElse: () => null)
          ?.key ??
      enums.FoodType.swaggerGeneratedUnknown;
}

List<String> foodTypeListToJson(List<enums.FoodType> foodType) {
  if (foodType == null) {
    return null;
  }

  return foodType.map((e) => enums.$FoodTypeMap[e]).toList();
}

List<enums.FoodType> foodTypeListFromJson(List foodType) {
  if (foodType == null) {
    return [];
  }

  return foodType.map((e) => foodTypeFromJson(e.toString())).toList();
}

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class CustomJsonDecoder {
  CustomJsonDecoder(this.factories);

  final Map<Type, JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values) as T;
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final jsonDecoder = CustomJsonDecoder(SwaggerApiJsonDecoderMappings);

String _dateToJson(DateTime date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
