// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$SwaggerApi extends SwaggerApi {
  _$SwaggerApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SwaggerApi;

  @override
  Future<Response<AuthorizationTokens>> v1AccountLoginPost({LoginModel body}) {
    final $url = '/v1/Account/Login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<AuthorizationTokens>> v1AccountFacebookLoginPost(
      {FacebookLogin body}) {
    final $url = '/v1/Account/FacebookLogin';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<AuthorizationTokens>> v1AccountAppleLoginPost(
      {AppleModel body}) {
    final $url = '/v1/Account/AppleLogin';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<AuthorizationTokens>> v1AccountGoogleLoginPost(
      {GoogleLogin body}) {
    final $url = '/v1/Account/GoogleLogin';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<AuthorizationTokens>> v1AccountVkontakteLoginPost(
      {VkLogin body}) {
    final $url = '/v1/Account/VKontakteLogin';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<AuthorizationTokens>> v1AccountOdnoklassnikiLoginPost(
      {OkLogin body}) {
    final $url = '/v1/Account/OdnoklassnikiLogin';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<dynamic>> v1AccountForgotPasswordPost(
      {PasswordResetModel body}) {
    final $url = '/v1/Account/ForgotPassword';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1AccountForgotPasswordSimplePost(
      {PasswordResetModel body}) {
    final $url = '/v1/Account/ForgotPasswordSimple';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AuthorizationTokens>> v1AccountUpdateUserPost(
      {UserAccountData body}) {
    final $url = '/v1/Account/UpdateUser';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<dynamic>> v1AccountResetPasswordPost(
      {ResetPasswordConfirmModel body}) {
    final $url = '/v1/Account/ResetPassword';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1AccountCheckResetPasswordSimpleCodePost(
      {CheckResetPasswordSimpleModel body}) {
    final $url = '/v1/Account/CheckResetPasswordSimpleCode';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1AccountResetPasswordSimplePost(
      {ResetPasswordSimpleConfirmModel body}) {
    final $url = '/v1/Account/ResetPasswordSimple';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AuthorizationTokens>> v1AccountRegisterPost(
      {RegisterModel body}) {
    final $url = '/v1/Account/Register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthorizationTokens, AuthorizationTokens>($request);
  }

  @override
  Future<Response<UserProfileModel>> v1UserProfileGetUserProfilePost(
      {Object body}) {
    final $url = '/v1/UserProfile/GetUserProfile';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserProfileModel, UserProfileModel>($request);
  }

  @override
  Future<Response<UserProfileModel>> v1UserProfileSaveUserProfilePost(
      {UserProfileModel body}) {
    final $url = '/v1/UserProfile/SaveUserProfile';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserProfileModel, UserProfileModel>($request);
  }

  @override
  Future<Response<TargetCurrentModel>> v1TargetGetCurrentTargetsPost(
      {Object body}) {
    final $url = '/v1/Target/GetCurrentTargets';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TargetCurrentModel, TargetCurrentModel>($request);
  }

  @override
  Future<Response<TargetCalorieModel>> v1TargetSaveTargetCaloriePost(
      {TargetCalorieModel body}) {
    final $url = '/v1/Target/SaveTargetCalorie';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TargetCalorieModel, TargetCalorieModel>($request);
  }

  @override
  Future<Response<TargetMacroModel>> v1TargetSaveTargetMacroPost(
      {TargetMacroModel body}) {
    final $url = '/v1/Target/SaveTargetMacro';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TargetMacroModel, TargetMacroModel>($request);
  }

  @override
  Future<Response<TargetWeightModel>> v1TargetSaveTargetWeightPost(
      {TargetWeightModel body}) {
    final $url = '/v1/Target/SaveTargetWeight';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TargetWeightModel, TargetWeightModel>($request);
  }

  @override
  Future<Response<TargetWaterModel>> v1TargetSaveTargetWaterPost(
      {TargetWaterModel body}) {
    final $url = '/v1/Target/SaveTargetWater';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TargetWaterModel, TargetWaterModel>($request);
  }

  @override
  Future<Response<dynamic>> v1TargetDeleteTargetMacroPost({Object body}) {
    final $url = '/v1/Target/DeleteTargetMacro';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1TargetDeleteTargetCaloriePost({Object body}) {
    final $url = '/v1/Target/DeleteTargetCalorie';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1TargetDeleteTargetWaterPost({Object body}) {
    final $url = '/v1/Target/DeleteTargetWater';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1TargetDeleteTargetWeightPost({Object body}) {
    final $url = '/v1/Target/DeleteTargetWeight';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CalculationAggregates>> v1CalculatorCalculateIdealWeightPost(
      {bool saveMeasureToProfile, IdealWeightInputModel body}) {
    final $url = '/v1/Calculator/CalculateIdealWeight';
    final $params = <String, dynamic>{
      'saveMeasureToProfile': saveMeasureToProfile
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<CalculationAggregates, CalculationAggregates>($request);
  }

  @override
  Future<Response<List<MacroProportionModel>>>
      v1CalculatorGetMacroProportionsPost({Object body}) {
    final $url = '/v1/Calculator/GetMacroProportions';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<List<MacroProportionModel>, MacroProportionModel>($request);
  }

  @override
  Future<Response<List<Macronutrition>>>
      v1CalculatorCalculateMacronutritionPost(
          {bool saveMeasureToProfile, NutritionModel body}) {
    final $url = '/v1/Calculator/CalculateMacronutrition';
    final $params = <String, dynamic>{
      'saveMeasureToProfile': saveMeasureToProfile
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<List<Macronutrition>, Macronutrition>($request);
  }

  @override
  Future<Response<CalorieSchedule>> v1CalculatorCalculateCaloriesPost(
      {bool saveMeasureToProfile, CaloriesInputModel body}) {
    final $url = '/v1/Calculator/CalculateCalories';
    final $params = <String, dynamic>{
      'saveMeasureToProfile': saveMeasureToProfile
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<CalorieSchedule, CalorieSchedule>($request);
  }

  @override
  Future<Response<CalculationAggregates>> v1CalculatorCalculateWaterPost(
      {bool saveMeasureToProfile, WaterInputModel body}) {
    final $url = '/v1/Calculator/CalculateWater';
    final $params = <String, dynamic>{
      'saveMeasureToProfile': saveMeasureToProfile
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<CalculationAggregates, CalculationAggregates>($request);
  }

  @override
  Future<Response<List<MicroModel>>> v1CalculatorCalculateMicronutritionPost(
      {bool saveMeasureToProfile, MicronutrionInputModel body}) {
    final $url = '/v1/Calculator/CalculateMicronutrition';
    final $params = <String, dynamic>{
      'saveMeasureToProfile': saveMeasureToProfile
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<List<MicroModel>, MicroModel>($request);
  }

  @override
  Future<Response<BmiResult>> v1CalculatorCalculateBmipost(
      {bool saveMeasureToProfile, BmiInputModel body}) {
    final $url = '/v1/Calculator/CalculateBMI';
    final $params = <String, dynamic>{
      'saveMeasureToProfile': saveMeasureToProfile
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<BmiResult, BmiResult>($request);
  }

  @override
  Future<Response<dynamic>> v1CommonLogMessagePost(
      {String logMessage, Object body}) {
    final $url = '/v1/Common/LogMessage';
    final $params = <String, dynamic>{'logMessage': logMessage};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1CommonReportProblemPost(
      {ReportProblemModel body}) {
    final $url = '/v1/Common/ReportProblem';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Object>> v1CommonGetTimezonesPost({Object body}) {
    final $url = '/v1/Common/GetTimezones';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<List<ChartDataModel>>> v1DiaryGetMacronutritionChartDataPost(
      {DiaryChartDataRequestModel body}) {
    final $url = '/v1/Diary/GetMacronutritionChartData';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<ChartDataModel>, ChartDataModel>($request);
  }

  @override
  Future<Response<dynamic>> v1DiaryAddFoodEventPost({FoodEventModel body}) {
    final $url = '/v1/Diary/AddFoodEvent';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1DiaryAddFoodEventsPost(
      {List<FoodEventModel> body}) {
    final $url = '/v1/Diary/AddFoodEvents';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1DiaryAddExerciseEventPost(
      {ExerciseEventModel body}) {
    final $url = '/v1/Diary/AddExerciseEvent';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1DiaryRemoveFoodEventsPost({Object body}) {
    final $url = '/v1/Diary/RemoveFoodEvents';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> v1DiaryRemoveExerciseEventsPost({Object body}) {
    final $url = '/v1/Diary/RemoveExerciseEvents';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<DiaryDayModel>>> v1DiaryGetDiaryPost(
      {RequestByDatesModel body}) {
    final $url = '/v1/Diary/GetDiary';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<DiaryDayModel>, DiaryDayModel>($request);
  }

  @override
  Future<Response<List<DiaryDayExercises>>> v1DiaryGetActivityDiaryPost(
      {RequestByDatesModel body}) {
    final $url = '/v1/Diary/GetActivityDiary';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<DiaryDayExercises>, DiaryDayExercises>($request);
  }

  @override
  Future<Response<List<ExerciseSimpleModel>>> v1ExerciseFindExercisePost(
      {String name, Object body}) {
    final $url = '/v1/Exercise/FindExercise';
    final $params = <String, dynamic>{'name': name};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client
        .send<List<ExerciseSimpleModel>, ExerciseSimpleModel>($request);
  }

  @override
  Future<Response<List<ProductSimpleModel>>> v1FoodFindProductPost(
      {ProductSearchModel body}) {
    final $url = '/v1/Food/FindProduct';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<ProductSimpleModel>, ProductSimpleModel>($request);
  }

  @override
  Future<Response<List<ChartDataModel>>> v1MeasureGetMeasuresChartDataPost(
      {MeasureChartDataRequestModel body}) {
    final $url = '/v1/Measure/GetMeasuresChartData';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<ChartDataModel>, ChartDataModel>($request);
  }

  @override
  Future<Response<MeasureModel>> v1MeasureGetMeasurePost(
      {String date, Object body}) {
    final $url = '/v1/Measure/GetMeasure';
    final $params = <String, dynamic>{'date': date};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<MeasureModel, MeasureModel>($request);
  }

  @override
  Future<Response<List<MeasureModel>>> v1MeasureGetMeasuresPost(
      {RequestByDatesModel body}) {
    final $url = '/v1/Measure/GetMeasures';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<MeasureModel>, MeasureModel>($request);
  }

  @override
  Future<Response<MeasureModel>> v1MeasureSaveMeasurePost({MeasureModel body}) {
    final $url = '/v1/Measure/SaveMeasure';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<MeasureModel, MeasureModel>($request);
  }
}
