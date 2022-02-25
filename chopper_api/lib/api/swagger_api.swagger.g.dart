// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  return val;
}

TokenResource _$TokenResourceFromJson(Map<String, dynamic> json) {
  return TokenResource(
    token: json['token'] as String,
    expiry: json['expiry'] as int,
  );
}

Map<String, dynamic> _$TokenResourceToJson(TokenResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('expiry', instance.expiry);
  return val;
}

UserAccountData _$UserAccountDataFromJson(Map<String, dynamic> json) {
  return UserAccountData(
    email: json['email'] as String,
    nickName: json['nickName'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    picture: json['picture'] as String,
    sex: sexFromJson(json['sex'] as String),
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$UserAccountDataToJson(UserAccountData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('nickName', instance.nickName);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('picture', instance.picture);
  writeNotNull('sex', sexToJson(instance.sex));
  writeNotNull('birthday', _dateToJson(instance.birthday));
  writeNotNull('timezone', instance.timezone);
  return val;
}

AuthorizationTokens _$AuthorizationTokensFromJson(Map<String, dynamic> json) {
  return AuthorizationTokens(
    accessToken: json['accessToken'] == null
        ? null
        : TokenResource.fromJson(json['accessToken'] as Map<String, dynamic>),
    refreshToken: json['refreshToken'] == null
        ? null
        : TokenResource.fromJson(json['refreshToken'] as Map<String, dynamic>),
    userData: json['userData'] == null
        ? null
        : UserAccountData.fromJson(json['userData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthorizationTokensToJson(AuthorizationTokens instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessToken', instance.accessToken?.toJson());
  writeNotNull('refreshToken', instance.refreshToken?.toJson());
  writeNotNull('userData', instance.userData?.toJson());
  return val;
}

FacebookLogin _$FacebookLoginFromJson(Map<String, dynamic> json) {
  return FacebookLogin(
    facebookToken: json['facebookToken'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$FacebookLoginToJson(FacebookLogin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('facebookToken', instance.facebookToken);
  writeNotNull('timezone', instance.timezone);
  return val;
}

AppleModel _$AppleModelFromJson(Map<String, dynamic> json) {
  return AppleModel(
    uid: json['uid'] as String,
    displayName: json['displayName'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    photoUrl: json['photoUrl'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$AppleModelToJson(AppleModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('email', instance.email);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('photoUrl', instance.photoUrl);
  writeNotNull('timezone', instance.timezone);
  return val;
}

GoogleLogin _$GoogleLoginFromJson(Map<String, dynamic> json) {
  return GoogleLogin(
    googleToken: json['googleToken'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$GoogleLoginToJson(GoogleLogin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('googleToken', instance.googleToken);
  writeNotNull('timezone', instance.timezone);
  return val;
}

VkLogin _$VkLoginFromJson(Map<String, dynamic> json) {
  return VkLogin(
    token: json['token'] as String,
    uId: json['uId'] as String,
    email: json['email'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$VkLoginToJson(VkLogin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('uId', instance.uId);
  writeNotNull('email', instance.email);
  writeNotNull('timezone', instance.timezone);
  return val;
}

OkLogin _$OkLoginFromJson(Map<String, dynamic> json) {
  return OkLogin(
    token: json['token'] as String,
    sessionSecretKey: json['sessionSecretKey'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$OkLoginToJson(OkLogin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('sessionSecretKey', instance.sessionSecretKey);
  writeNotNull('timezone', instance.timezone);
  return val;
}

PasswordResetModel _$PasswordResetModelFromJson(Map<String, dynamic> json) {
  return PasswordResetModel(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$PasswordResetModelToJson(PasswordResetModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}

ResetPasswordConfirmModel _$ResetPasswordConfirmModelFromJson(
    Map<String, dynamic> json) {
  return ResetPasswordConfirmModel(
    token: json['token'] as String,
    newPassword: json['newPassword'] as String,
    confirmPassword: json['confirmPassword'] as String,
  );
}

Map<String, dynamic> _$ResetPasswordConfirmModelToJson(
    ResetPasswordConfirmModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('newPassword', instance.newPassword);
  writeNotNull('confirmPassword', instance.confirmPassword);
  return val;
}

CheckResetPasswordSimpleModel _$CheckResetPasswordSimpleModelFromJson(
    Map<String, dynamic> json) {
  return CheckResetPasswordSimpleModel(
    token: json['token'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$CheckResetPasswordSimpleModelToJson(
    CheckResetPasswordSimpleModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('email', instance.email);
  return val;
}

ResetPasswordSimpleConfirmModel _$ResetPasswordSimpleConfirmModelFromJson(
    Map<String, dynamic> json) {
  return ResetPasswordSimpleConfirmModel(
    token: json['token'] as String,
    newPassword: json['newPassword'] as String,
    confirmPassword: json['confirmPassword'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$ResetPasswordSimpleConfirmModelToJson(
    ResetPasswordSimpleConfirmModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('newPassword', instance.newPassword);
  writeNotNull('confirmPassword', instance.confirmPassword);
  writeNotNull('email', instance.email);
  return val;
}

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    userName: json['userName'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userName', instance.userName);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('timezone', instance.timezone);
  return val;
}

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return UserProfileModel(
    userAccountData: json['userAccountData'] == null
        ? null
        : UserAccountData.fromJson(
            json['userAccountData'] as Map<String, dynamic>),
    height: (json['height'] as num)?.toDouble(),
    weight: (json['weight'] as num)?.toDouble(),
    activity: activityFromJson(json['activity'] as String),
  );
}

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userAccountData', instance.userAccountData?.toJson());
  writeNotNull('height', instance.height);
  writeNotNull('weight', instance.weight);
  writeNotNull('activity', activityToJson(instance.activity));
  return val;
}

TargetCalorieModel _$TargetCalorieModelFromJson(Map<String, dynamic> json) {
  return TargetCalorieModel(
    id: json['id'] as int,
    calories: json['calories'] as int,
    isZigzag: json['isZigzag'] as bool,
    calculationId: json['calculationId'] as int,
    formulaId: caloriesFormulaIdFromJson(json['formulaId'] as String),
    scenarioId: scenarioIdFromJson(json['scenarioId'] as String),
    mo: json['mo'] as int,
    tu: json['tu'] as int,
    we: json['we'] as int,
    th: json['th'] as int,
    fr: json['fr'] as int,
    sa: json['sa'] as int,
    su: json['su'] as int,
    mrCalories: json['mrCalories'] as int,
  );
}

Map<String, dynamic> _$TargetCalorieModelToJson(TargetCalorieModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('calories', instance.calories);
  writeNotNull('isZigzag', instance.isZigzag);
  writeNotNull('calculationId', instance.calculationId);
  writeNotNull('formulaId', caloriesFormulaIdToJson(instance.formulaId));
  writeNotNull('scenarioId', scenarioIdToJson(instance.scenarioId));
  writeNotNull('mo', instance.mo);
  writeNotNull('tu', instance.tu);
  writeNotNull('we', instance.we);
  writeNotNull('th', instance.th);
  writeNotNull('fr', instance.fr);
  writeNotNull('sa', instance.sa);
  writeNotNull('su', instance.su);
  writeNotNull('mrCalories', instance.mrCalories);
  return val;
}

TargetMacroModel _$TargetMacroModelFromJson(Map<String, dynamic> json) {
  return TargetMacroModel(
    id: json['id'] as int,
    protein: (json['protein'] as num)?.toDouble(),
    fat: (json['fat'] as num)?.toDouble(),
    carbon: (json['carbon'] as num)?.toDouble(),
    calculationId: json['calculationId'] as int,
    mealsCount: json['mealsCount'] as int,
  );
}

Map<String, dynamic> _$TargetMacroModelToJson(TargetMacroModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('protein', instance.protein);
  writeNotNull('fat', instance.fat);
  writeNotNull('carbon', instance.carbon);
  writeNotNull('calculationId', instance.calculationId);
  writeNotNull('mealsCount', instance.mealsCount);
  return val;
}

TargetWaterModel _$TargetWaterModelFromJson(Map<String, dynamic> json) {
  return TargetWaterModel(
    id: json['id'] as int,
    water: (json['water'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TargetWaterModelToJson(TargetWaterModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('water', instance.water);
  return val;
}

TargetWeightModel _$TargetWeightModelFromJson(Map<String, dynamic> json) {
  return TargetWeightModel(
    id: json['id'] as int,
    startWeight: (json['startWeight'] as num)?.toDouble(),
    endWeight: (json['endWeight'] as num)?.toDouble(),
    weekly: (json['weekly'] as num)?.toDouble(),
    calculationId: json['calculationId'] as int,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
  );
}

Map<String, dynamic> _$TargetWeightModelToJson(TargetWeightModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('startWeight', instance.startWeight);
  writeNotNull('endWeight', instance.endWeight);
  writeNotNull('weekly', instance.weekly);
  writeNotNull('calculationId', instance.calculationId);
  writeNotNull('startDate', _dateToJson(instance.startDate));
  writeNotNull('endDate', _dateToJson(instance.endDate));
  return val;
}

TargetCurrentFactModel _$TargetCurrentFactModelFromJson(
    Map<String, dynamic> json) {
  return TargetCurrentFactModel(
    weight: (json['weight'] as num)?.toDouble(),
    protein: (json['protein'] as num)?.toDouble(),
    fat: (json['fat'] as num)?.toDouble(),
    carbon: (json['carbon'] as num)?.toDouble(),
    calories: json['calories'] as int,
    water: (json['water'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TargetCurrentFactModelToJson(
    TargetCurrentFactModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('weight', instance.weight);
  writeNotNull('protein', instance.protein);
  writeNotNull('fat', instance.fat);
  writeNotNull('carbon', instance.carbon);
  writeNotNull('calories', instance.calories);
  writeNotNull('water', instance.water);
  return val;
}

TargetCurrentModel _$TargetCurrentModelFromJson(Map<String, dynamic> json) {
  return TargetCurrentModel(
    id: json['id'] as int,
    targetCalorie: json['targetCalorie'] == null
        ? null
        : TargetCalorieModel.fromJson(
            json['targetCalorie'] as Map<String, dynamic>),
    targetMacro: json['targetMacro'] == null
        ? null
        : TargetMacroModel.fromJson(
            json['targetMacro'] as Map<String, dynamic>),
    targetWater: json['targetWater'] == null
        ? null
        : TargetWaterModel.fromJson(
            json['targetWater'] as Map<String, dynamic>),
    targetWeight: json['targetWeight'] == null
        ? null
        : TargetWeightModel.fromJson(
            json['targetWeight'] as Map<String, dynamic>),
    targetCurrentFact: json['targetCurrentFact'] == null
        ? null
        : TargetCurrentFactModel.fromJson(
            json['targetCurrentFact'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TargetCurrentModelToJson(TargetCurrentModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('targetCalorie', instance.targetCalorie?.toJson());
  writeNotNull('targetMacro', instance.targetMacro?.toJson());
  writeNotNull('targetWater', instance.targetWater?.toJson());
  writeNotNull('targetWeight', instance.targetWeight?.toJson());
  writeNotNull('targetCurrentFact', instance.targetCurrentFact?.toJson());
  return val;
}

MeasureModel _$MeasureModelFromJson(Map<String, dynamic> json) {
  return MeasureModel(
    id: json['id'] as int,
    utcDate: json['utcDate'] == null
        ? null
        : DateTime.parse(json['utcDate'] as String),
    localDate: json['localDate'] == null
        ? null
        : DateTime.parse(json['localDate'] as String),
    userId: json['userId'] as int,
    ip: json['ip'] as String,
    chest: (json['chest'] as num)?.toDouble(),
    waist: (json['waist'] as num)?.toDouble(),
    hips: (json['hips'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    wrist: (json['wrist'] as num)?.toDouble(),
    thigh: (json['thigh'] as num)?.toDouble(),
    calf: (json['calf'] as num)?.toDouble(),
    neck: (json['neck'] as num)?.toDouble(),
    weight: (json['weight'] as num)?.toDouble(),
    forearm: (json['forearm'] as num)?.toDouble(),
    age: json['age'] as int,
    activity: activityFromJson(json['activity'] as String),
    sex: sexFromJson(json['sex'] as String),
    fatPercent: (json['fatPercent'] as num)?.toDouble(),
    fatPercentCalculated: (json['fatPercentCalculated'] as num)?.toDouble(),
    biceps: (json['biceps'] as num)?.toDouble(),
    stomach: (json['stomach'] as num)?.toDouble(),
    underChest: (json['underChest'] as num)?.toDouble(),
    ankle: (json['ankle'] as num)?.toDouble(),
    knee: (json['knee'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MeasureModelToJson(MeasureModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('utcDate', _dateToJson(instance.utcDate));
  writeNotNull('localDate', _dateToJson(instance.localDate));
  writeNotNull('userId', instance.userId);
  writeNotNull('ip', instance.ip);
  writeNotNull('chest', instance.chest);
  writeNotNull('waist', instance.waist);
  writeNotNull('hips', instance.hips);
  writeNotNull('height', instance.height);
  writeNotNull('wrist', instance.wrist);
  writeNotNull('thigh', instance.thigh);
  writeNotNull('calf', instance.calf);
  writeNotNull('neck', instance.neck);
  writeNotNull('weight', instance.weight);
  writeNotNull('forearm', instance.forearm);
  writeNotNull('age', instance.age);
  writeNotNull('activity', activityToJson(instance.activity));
  writeNotNull('sex', sexToJson(instance.sex));
  writeNotNull('fatPercent', instance.fatPercent);
  writeNotNull('fatPercentCalculated', instance.fatPercentCalculated);
  writeNotNull('biceps', instance.biceps);
  writeNotNull('stomach', instance.stomach);
  writeNotNull('underChest', instance.underChest);
  writeNotNull('ankle', instance.ankle);
  writeNotNull('knee', instance.knee);
  return val;
}

IdealWeightInputModel _$IdealWeightInputModelFromJson(
    Map<String, dynamic> json) {
  return IdealWeightInputModel(
    measure: json['measure'] == null
        ? null
        : MeasureModel.fromJson(json['measure'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IdealWeightInputModelToJson(
    IdealWeightInputModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('measure', instance.measure?.toJson());
  return val;
}

CalculationAggregates _$CalculationAggregatesFromJson(
    Map<String, dynamic> json) {
  return CalculationAggregates(
    data: json['data'],
    average: json['average'] as String,
    min: json['min'] as String,
    max: json['max'] as String,
    diff: json['diff'] as String,
    diffAbsolute: json['diffAbsolute'] as String,
    precision: json['precision'] as int,
    sizeIn: json['sizeIn'] as String,
    additionalInfo: json['additionalInfo'] as String,
  );
}

Map<String, dynamic> _$CalculationAggregatesToJson(
    CalculationAggregates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('average', instance.average);
  writeNotNull('min', instance.min);
  writeNotNull('max', instance.max);
  writeNotNull('diff', instance.diff);
  writeNotNull('diffAbsolute', instance.diffAbsolute);
  writeNotNull('precision', instance.precision);
  writeNotNull('sizeIn', instance.sizeIn);
  writeNotNull('additionalInfo', instance.additionalInfo);
  return val;
}

MacroProportionModel _$MacroProportionModelFromJson(Map<String, dynamic> json) {
  return MacroProportionModel(
    name: json['name'] as String,
    carbohydratePercent: (json['carbohydratePercent'] as num)?.toDouble(),
    proteinPercent: (json['proteinPercent'] as num)?.toDouble(),
    fatPercent: (json['fatPercent'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MacroProportionModelToJson(
    MacroProportionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('carbohydratePercent', instance.carbohydratePercent);
  writeNotNull('proteinPercent', instance.proteinPercent);
  writeNotNull('fatPercent', instance.fatPercent);
  return val;
}

NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) {
  return NutritionModel(
    calories: json['calories'] as int,
    carbohydratePercent: (json['carbohydratePercent'] as num)?.toDouble(),
    proteinPercent: (json['proteinPercent'] as num)?.toDouble(),
    fatPercent: (json['fatPercent'] as num)?.toDouble(),
    mealsCount: json['mealsCount'] as int,
  );
}

Map<String, dynamic> _$NutritionModelToJson(NutritionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('calories', instance.calories);
  writeNotNull('carbohydratePercent', instance.carbohydratePercent);
  writeNotNull('proteinPercent', instance.proteinPercent);
  writeNotNull('fatPercent', instance.fatPercent);
  writeNotNull('mealsCount', instance.mealsCount);
  return val;
}

Macronutrition _$MacronutritionFromJson(Map<String, dynamic> json) {
  return Macronutrition(
    description: json['description'] as String,
    carbohydrate: (json['carbohydrate'] as num)?.toDouble(),
    protein: (json['protein'] as num)?.toDouble(),
    fat: (json['fat'] as num)?.toDouble(),
    sizeIn: json['sizeIn'] as String,
  );
}

Map<String, dynamic> _$MacronutritionToJson(Macronutrition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('carbohydrate', instance.carbohydrate);
  writeNotNull('protein', instance.protein);
  writeNotNull('fat', instance.fat);
  writeNotNull('sizeIn', instance.sizeIn);
  return val;
}

CaloriesInputModel _$CaloriesInputModelFromJson(Map<String, dynamic> json) {
  return CaloriesInputModel(
    measure: json['measure'] == null
        ? null
        : MeasureModel.fromJson(json['measure'] as Map<String, dynamic>),
    desiredWeight: (json['desiredWeight'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CaloriesInputModelToJson(CaloriesInputModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('measure', instance.measure?.toJson());
  writeNotNull('desiredWeight', instance.desiredWeight);
  return val;
}

CalorieDetails _$CalorieDetailsFromJson(Map<String, dynamic> json) {
  return CalorieDetails(
    calories: json['calories'] as int,
    dailyCalLoss: json['dailyCalLoss'] as int,
    weeklyCalLoss: json['weeklyCalLoss'] as int,
    monthlyCalLoss: json['monthlyCalLoss'] as int,
    dailyKgLoss: (json['dailyKgLoss'] as num)?.toDouble(),
    weeklyKgLoss: (json['weeklyKgLoss'] as num)?.toDouble(),
    monthlyKgLoss: (json['monthlyKgLoss'] as num)?.toDouble(),
    daysCount: json['daysCount'] as int,
    beginDate: json['beginDate'] == null
        ? null
        : DateTime.parse(json['beginDate'] as String),
    finishDate: json['finishDate'] == null
        ? null
        : DateTime.parse(json['finishDate'] as String),
    zigzag: json['zigzag'],
    scenarioId: scenarioIdFromJson(json['scenarioId'] as String),
  );
}

Map<String, dynamic> _$CalorieDetailsToJson(CalorieDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('calories', instance.calories);
  writeNotNull('dailyCalLoss', instance.dailyCalLoss);
  writeNotNull('weeklyCalLoss', instance.weeklyCalLoss);
  writeNotNull('monthlyCalLoss', instance.monthlyCalLoss);
  writeNotNull('dailyKgLoss', instance.dailyKgLoss);
  writeNotNull('weeklyKgLoss', instance.weeklyKgLoss);
  writeNotNull('monthlyKgLoss', instance.monthlyKgLoss);
  writeNotNull('daysCount', instance.daysCount);
  writeNotNull('beginDate', instance.beginDate?.toIso8601String());
  writeNotNull('finishDate', instance.finishDate?.toIso8601String());
  writeNotNull('zigzag', instance.zigzag);
  writeNotNull('scenarioId', scenarioIdToJson(instance.scenarioId));
  return val;
}

CalorieSchedule _$CalorieScheduleFromJson(Map<String, dynamic> json) {
  return CalorieSchedule(
    calories: json['calories'] as int,
    isBelowMinimum: json['isBelowMinimum'] as bool,
    safeCalories: json['safeCalories'] == null
        ? null
        : CalorieDetails.fromJson(json['safeCalories'] as Map<String, dynamic>),
    desiredCalories: json['desiredCalories'] == null
        ? null
        : CalorieDetails.fromJson(
            json['desiredCalories'] as Map<String, dynamic>),
    extremeCalories: json['extremeCalories'] == null
        ? null
        : CalorieDetails.fromJson(
            json['extremeCalories'] as Map<String, dynamic>),
    formulaId: caloriesFormulaIdFromJson(json['formulaId'] as String),
  );
}

Map<String, dynamic> _$CalorieScheduleToJson(CalorieSchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('calories', instance.calories);
  writeNotNull('isBelowMinimum', instance.isBelowMinimum);
  writeNotNull('safeCalories', instance.safeCalories?.toJson());
  writeNotNull('desiredCalories', instance.desiredCalories?.toJson());
  writeNotNull('extremeCalories', instance.extremeCalories?.toJson());
  writeNotNull('formulaId', caloriesFormulaIdToJson(instance.formulaId));
  return val;
}

WaterInputModel _$WaterInputModelFromJson(Map<String, dynamic> json) {
  return WaterInputModel(
    measure: json['measure'] == null
        ? null
        : MeasureModel.fromJson(json['measure'] as Map<String, dynamic>),
    calories: json['calories'] as int,
  );
}

Map<String, dynamic> _$WaterInputModelToJson(WaterInputModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('measure', instance.measure?.toJson());
  writeNotNull('calories', instance.calories);
  return val;
}

MicronutrionInputModel _$MicronutrionInputModelFromJson(
    Map<String, dynamic> json) {
  return MicronutrionInputModel(
    measure: json['measure'] == null
        ? null
        : MeasureModel.fromJson(json['measure'] as Map<String, dynamic>),
    countryId: micronutrientCountryFromJson(json['countryId'] as String),
    womanState: womanStateFromJson(json['womanState'] as String),
    isClimateCold: json['isClimateCold'] as bool,
  );
}

Map<String, dynamic> _$MicronutrionInputModelToJson(
    MicronutrionInputModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('measure', instance.measure?.toJson());
  writeNotNull('countryId', micronutrientCountryToJson(instance.countryId));
  writeNotNull('womanState', womanStateToJson(instance.womanState));
  writeNotNull('isClimateCold', instance.isClimateCold);
  return val;
}

SmallMicroModel _$SmallMicroModelFromJson(Map<String, dynamic> json) {
  return SmallMicroModel(
    min: (json['min'] as num)?.toDouble(),
    max: (json['max'] as num)?.toDouble(),
    size: json['size'] as String,
  );
}

Map<String, dynamic> _$SmallMicroModelToJson(SmallMicroModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('min', instance.min);
  writeNotNull('max', instance.max);
  writeNotNull('size', instance.size);
  return val;
}

MicroDataModel _$MicroDataModelFromJson(Map<String, dynamic> json) {
  return MicroDataModel(
    name: json['name'] as String,
    data: json['data'] == null
        ? null
        : SmallMicroModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MicroDataModelToJson(MicroDataModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('data', instance.data?.toJson());
  return val;
}

MicroCategoryModel _$MicroCategoryModelFromJson(Map<String, dynamic> json) {
  return MicroCategoryModel(
    name: json['name'] as String,
    subcategoryData: (json['subcategoryData'] as List)
            ?.map((e) => e == null
                ? null
                : MicroDataModel.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$MicroCategoryModelToJson(MicroCategoryModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('subcategoryData',
      instance.subcategoryData?.map((e) => e?.toJson())?.toList());
  return val;
}

MicroModel _$MicroModelFromJson(Map<String, dynamic> json) {
  return MicroModel(
    name: json['name'] as String,
    categoryData: (json['categoryData'] as List)
            ?.map((e) => e == null
                ? null
                : MicroCategoryModel.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$MicroModelToJson(MicroModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull(
      'categoryData', instance.categoryData?.map((e) => e?.toJson())?.toList());
  return val;
}

BmiInputModel _$BmiInputModelFromJson(Map<String, dynamic> json) {
  return BmiInputModel(
    measure: json['measure'] == null
        ? null
        : MeasureModel.fromJson(json['measure'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BmiInputModelToJson(BmiInputModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('measure', instance.measure?.toJson());
  return val;
}

BmiValues _$BmiValuesFromJson(Map<String, dynamic> json) {
  return BmiValues(
    bmi: (json['bmi'] as num)?.toDouble(),
    ranges: (json['ranges'] as List)
            ?.map((e) => (e as num)?.toDouble())
            ?.toList() ??
        [],
    category: bmiCategoryFromJson(json['category'] as String),
    weights: (json['weights'] as List)
            ?.map((e) => (e as num)?.toDouble())
            ?.toList() ??
        [],
    difBmiToRanges: (json['difBmiToRanges'] as List)
            ?.map((e) => (e as num)?.toDouble())
            ?.toList() ??
        [],
    difWeightsToRanges: (json['difWeightsToRanges'] as List)
            ?.map((e) => (e as num)?.toDouble())
            ?.toList() ??
        [],
    difBmiToIdeal: (json['difBmiToIdeal'] as List)
            ?.map((e) => (e as num)?.toDouble())
            ?.toList() ??
        [],
    difWeightsToIdeal: (json['difWeightsToIdeal'] as List)
            ?.map((e) => (e as num)?.toDouble())
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$BmiValuesToJson(BmiValues instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bmi', instance.bmi);
  writeNotNull('ranges', instance.ranges);
  writeNotNull('category', bmiCategoryToJson(instance.category));
  writeNotNull('weights', instance.weights);
  writeNotNull('difBmiToRanges', instance.difBmiToRanges);
  writeNotNull('difWeightsToRanges', instance.difWeightsToRanges);
  writeNotNull('difBmiToIdeal', instance.difBmiToIdeal);
  writeNotNull('difWeightsToIdeal', instance.difWeightsToIdeal);
  return val;
}

BmiResult _$BmiResultFromJson(Map<String, dynamic> json) {
  return BmiResult(
    bmi: (json['bmi'] as List)
            ?.map((e) => e == null
                ? null
                : BmiValues.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    measure: json['measure'] == null
        ? null
        : MeasureModel.fromJson(json['measure'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BmiResultToJson(BmiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bmi', instance.bmi?.map((e) => e?.toJson())?.toList());
  writeNotNull('measure', instance.measure?.toJson());
  return val;
}

ReportProblemModel _$ReportProblemModelFromJson(Map<String, dynamic> json) {
  return ReportProblemModel(
    email: json['email'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ReportProblemModelToJson(ReportProblemModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('message', instance.message);
  return val;
}

DiaryChartDataRequestModel _$DiaryChartDataRequestModelFromJson(
    Map<String, dynamic> json) {
  return DiaryChartDataRequestModel(
    fromDate: json['fromDate'] == null
        ? null
        : DateTime.parse(json['fromDate'] as String),
    toDate: json['toDate'] == null
        ? null
        : DateTime.parse(json['toDate'] as String),
    chartTypes: chartsTypeListFromJson(json['chartTypes'] as List),
    interval: intervalTypeFromJson(json['interval'] as String),
  );
}

Map<String, dynamic> _$DiaryChartDataRequestModelToJson(
    DiaryChartDataRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fromDate', _dateToJson(instance.fromDate));
  writeNotNull('toDate', _dateToJson(instance.toDate));
  writeNotNull('chartTypes', chartsTypeListToJson(instance.chartTypes));
  writeNotNull('interval', intervalTypeToJson(instance.interval));
  return val;
}

Spot _$SpotFromJson(Map<String, dynamic> json) {
  return Spot(
    x: (json['x'] as num)?.toDouble(),
    y: (json['y'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SpotToJson(Spot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('x', instance.x);
  writeNotNull('y', instance.y);
  return val;
}

ChartAddition _$ChartAdditionFromJson(Map<String, dynamic> json) {
  return ChartAddition(
    name: chartsAdditionTypeFromJson(json['name'] as String),
    spots: (json['spots'] as List)
            ?.map((e) =>
                e == null ? null : Spot.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$ChartAdditionToJson(ChartAddition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', chartsAdditionTypeToJson(instance.name));
  writeNotNull('spots', instance.spots?.map((e) => e?.toJson())?.toList());
  return val;
}

ChartPlot _$ChartPlotFromJson(Map<String, dynamic> json) {
  return ChartPlot(
    name: chartsTypeFromJson(json['name'] as String),
    spots: (json['spots'] as List)
            ?.map((e) =>
                e == null ? null : Spot.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    chartAdditions: (json['chartAdditions'] as List)
            ?.map((e) => e == null
                ? null
                : ChartAddition.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$ChartPlotToJson(ChartPlot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', chartsTypeToJson(instance.name));
  writeNotNull('spots', instance.spots?.map((e) => e?.toJson())?.toList());
  writeNotNull('chartAdditions',
      instance.chartAdditions?.map((e) => e?.toJson())?.toList());
  return val;
}

ChartDataModel _$ChartDataModelFromJson(Map<String, dynamic> json) {
  return ChartDataModel(
    xAxisType: chartsAxisTypeFromJson(json['xAxisType'] as String),
    yAxisType: chartsAxisTypeFromJson(json['yAxisType'] as String),
    plots: (json['plots'] as List)
            ?.map((e) => e == null
                ? null
                : ChartPlot.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$ChartDataModelToJson(ChartDataModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('xAxisType', chartsAxisTypeToJson(instance.xAxisType));
  writeNotNull('yAxisType', chartsAxisTypeToJson(instance.yAxisType));
  writeNotNull('plots', instance.plots?.map((e) => e?.toJson())?.toList());
  return val;
}

FoodEventModel _$FoodEventModelFromJson(Map<String, dynamic> json) {
  return FoodEventModel(
    diaryId: json['diaryId'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    foodType: foodTypeFromJson(json['foodType'] as String),
    amount: (json['amount'] as num)?.toDouble(),
    productId: json['productId'] as int,
    portionSizeId: json['portionSizeId'] as int,
  );
}

Map<String, dynamic> _$FoodEventModelToJson(FoodEventModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('diaryId', instance.diaryId);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('foodType', foodTypeToJson(instance.foodType));
  writeNotNull('amount', instance.amount);
  writeNotNull('productId', instance.productId);
  writeNotNull('portionSizeId', instance.portionSizeId);
  return val;
}

ExerciseEventModel _$ExerciseEventModelFromJson(Map<String, dynamic> json) {
  return ExerciseEventModel(
    diaryId: json['diaryId'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    amount: (json['amount'] as num)?.toDouble(),
    exerciseId: json['exerciseId'] as int,
  );
}

Map<String, dynamic> _$ExerciseEventModelToJson(ExerciseEventModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('diaryId', instance.diaryId);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('amount', instance.amount);
  writeNotNull('exerciseId', instance.exerciseId);
  return val;
}

RequestByDatesModel _$RequestByDatesModelFromJson(Map<String, dynamic> json) {
  return RequestByDatesModel(
    fromDate: json['fromDate'] == null
        ? null
        : DateTime.parse(json['fromDate'] as String),
    toDate: json['toDate'] == null
        ? null
        : DateTime.parse(json['toDate'] as String),
  );
}

Map<String, dynamic> _$RequestByDatesModelToJson(RequestByDatesModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fromDate', _dateToJson(instance.fromDate));
  writeNotNull('toDate', _dateToJson(instance.toDate));
  return val;
}

DiaryProduct _$DiaryProductFromJson(Map<String, dynamic> json) {
  return DiaryProduct(
    id: json['id'] as int,
    diaryDayId: json['diaryDayId'] as int,
    foodType: foodTypeFromJson(json['foodType'] as String),
    name: json['name'] as String,
    productId: json['productId'] as int,
    amount: (json['amount'] as num)?.toDouble(),
    calorie: (json['calorie'] as num)?.toDouble(),
    fat: (json['fat'] as num)?.toDouble(),
    carb: (json['carb'] as num)?.toDouble(),
    protein: (json['protein'] as num)?.toDouble(),
    portionTypeId: json['portionTypeId'] as int,
    portionTypeName: json['portionTypeName'] as String,
    portionWeight: (json['portionWeight'] as num)?.toDouble(),
    portionSizeId: json['portionSizeId'] as int,
    isCustom: json['isCustom'] as bool,
    isFavorite: json['isFavorite'] as bool,
    categoryName: json['categoryName'] as String,
    categoryId: json['categoryId'] as int,
  );
}

Map<String, dynamic> _$DiaryProductToJson(DiaryProduct instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('diaryDayId', instance.diaryDayId);
  writeNotNull('foodType', foodTypeToJson(instance.foodType));
  writeNotNull('name', instance.name);
  writeNotNull('productId', instance.productId);
  writeNotNull('amount', instance.amount);
  writeNotNull('calorie', instance.calorie);
  writeNotNull('fat', instance.fat);
  writeNotNull('carb', instance.carb);
  writeNotNull('protein', instance.protein);
  writeNotNull('portionTypeId', instance.portionTypeId);
  writeNotNull('portionTypeName', instance.portionTypeName);
  writeNotNull('portionWeight', instance.portionWeight);
  writeNotNull('portionSizeId', instance.portionSizeId);
  writeNotNull('isCustom', instance.isCustom);
  writeNotNull('isFavorite', instance.isFavorite);
  writeNotNull('categoryName', instance.categoryName);
  writeNotNull('categoryId', instance.categoryId);
  return val;
}

FoodContainer _$FoodContainerFromJson(Map<String, dynamic> json) {
  return FoodContainer(
    id: json['id'] as int,
    name: json['name'] as String,
    products: (json['products'] as List)
            ?.map((e) => e == null
                ? null
                : DiaryProduct.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    time: json['time'] as String,
    visible: json['visible'] as bool,
    water: (json['water'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FoodContainerToJson(FoodContainer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull(
      'products', instance.products?.map((e) => e?.toJson())?.toList());
  writeNotNull('time', instance.time);
  writeNotNull('visible', instance.visible);
  writeNotNull('water', instance.water);
  return val;
}

DailySummary _$DailySummaryFromJson(Map<String, dynamic> json) {
  return DailySummary(
    foodCalorie: json['foodCalorie'] as int,
    exerciseCalorie: json['exerciseCalorie'] as int,
    targetCalorie: json['targetCalorie'] as int,
    targetPlusExerciseCalorie: json['targetPlusExerciseCalorie'] as int,
    targetFat: (json['targetFat'] as num)?.toDouble(),
    targetProtein: (json['targetProtein'] as num)?.toDouble(),
    targetCarb: (json['targetCarb'] as num)?.toDouble(),
    weightDifference: (json['weightDifference'] as num)?.toDouble(),
    waistDifference: (json['waistDifference'] as num)?.toDouble(),
    fat: (json['fat'] as num)?.toDouble(),
    protein: (json['protein'] as num)?.toDouble(),
    carb: (json['carb'] as num)?.toDouble(),
    startWeight: (json['startWeight'] as num)?.toDouble(),
    currentWeight: (json['currentWeight'] as num)?.toDouble(),
    targetWeight: (json['targetWeight'] as num)?.toDouble(),
    currentWater: (json['currentWater'] as num)?.toDouble(),
    targetWater: (json['targetWater'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DailySummaryToJson(DailySummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foodCalorie', instance.foodCalorie);
  writeNotNull('exerciseCalorie', instance.exerciseCalorie);
  writeNotNull('targetCalorie', instance.targetCalorie);
  writeNotNull('targetPlusExerciseCalorie', instance.targetPlusExerciseCalorie);
  writeNotNull('targetFat', instance.targetFat);
  writeNotNull('targetProtein', instance.targetProtein);
  writeNotNull('targetCarb', instance.targetCarb);
  writeNotNull('weightDifference', instance.weightDifference);
  writeNotNull('waistDifference', instance.waistDifference);
  writeNotNull('fat', instance.fat);
  writeNotNull('protein', instance.protein);
  writeNotNull('carb', instance.carb);
  writeNotNull('startWeight', instance.startWeight);
  writeNotNull('currentWeight', instance.currentWeight);
  writeNotNull('targetWeight', instance.targetWeight);
  writeNotNull('currentWater', instance.currentWater);
  writeNotNull('targetWater', instance.targetWater);
  return val;
}

DiaryDayModel _$DiaryDayModelFromJson(Map<String, dynamic> json) {
  return DiaryDayModel(
    diaryId: json['diaryId'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    unixDate: json['unixDate'] as int,
    foodContainers: (json['foodContainers'] as List)
            ?.map((e) => e == null
                ? null
                : FoodContainer.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    summary: json['summary'] == null
        ? null
        : DailySummary.fromJson(json['summary'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DiaryDayModelToJson(DiaryDayModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('diaryId', instance.diaryId);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('unixDate', instance.unixDate);
  writeNotNull('foodContainers',
      instance.foodContainers?.map((e) => e?.toJson())?.toList());
  writeNotNull('summary', instance.summary?.toJson());
  return val;
}

DiaryDayExercise _$DiaryDayExerciseFromJson(Map<String, dynamic> json) {
  return DiaryDayExercise(
    id: json['id'] as int,
    name: json['name'] as String,
    exerciseId: json['exerciseId'] as int,
    amount: (json['amount'] as num)?.toDouble(),
    calories: (json['calories'] as num)?.toDouble(),
    isCustom: json['isCustom'] as bool,
    isFavorite: json['isFavorite'] as bool,
  );
}

Map<String, dynamic> _$DiaryDayExerciseToJson(DiaryDayExercise instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('exerciseId', instance.exerciseId);
  writeNotNull('amount', instance.amount);
  writeNotNull('calories', instance.calories);
  writeNotNull('isCustom', instance.isCustom);
  writeNotNull('isFavorite', instance.isFavorite);
  return val;
}

DiaryDayExercises _$DiaryDayExercisesFromJson(Map<String, dynamic> json) {
  return DiaryDayExercises(
    diaryId: json['diaryId'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    unixDate: json['unixDate'] as int,
    exercises: (json['exercises'] as List)
            ?.map((e) => e == null
                ? null
                : DiaryDayExercise.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$DiaryDayExercisesToJson(DiaryDayExercises instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('diaryId', instance.diaryId);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('unixDate', instance.unixDate);
  writeNotNull(
      'exercises', instance.exercises?.map((e) => e?.toJson())?.toList());
  return val;
}

ExerciseSimpleModel _$ExerciseSimpleModelFromJson(Map<String, dynamic> json) {
  return ExerciseSimpleModel(
    id: json['id'] as int,
    name: json['name'] as String,
    categoryId: json['categoryId'] as int,
    caloriesPerKg: (json['caloriesPerKg'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ExerciseSimpleModelToJson(ExerciseSimpleModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('caloriesPerKg', instance.caloriesPerKg);
  return val;
}

ProductSearchModel _$ProductSearchModelFromJson(Map<String, dynamic> json) {
  return ProductSearchModel(
    name: json['name'] as String,
    currentPage: json['currentPage'] as int,
    pageSize: json['pageSize'] as int,
  );
}

Map<String, dynamic> _$ProductSearchModelToJson(ProductSearchModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('currentPage', instance.currentPage);
  writeNotNull('pageSize', instance.pageSize);
  return val;
}

ProductSimpleModel _$ProductSimpleModelFromJson(Map<String, dynamic> json) {
  return ProductSimpleModel(
    id: json['id'] as int,
    name: json['name'] as String,
    protein: (json['protein'] as num)?.toDouble(),
    fat: (json['fat'] as num)?.toDouble(),
    carbon: (json['carbon'] as num)?.toDouble(),
    calorie: (json['calorie'] as num)?.toDouble(),
    categoryId: json['categoryId'] as int,
    categoryName: json['categoryName'] as String,
    portionSizeId: json['portionSizeId'] as int,
    portionSize: (json['portionSize'] as num)?.toDouble(),
    portionTypeName: json['portionTypeName'] as String,
    portionTypeId: json['portionTypeId'] as int,
  );
}

Map<String, dynamic> _$ProductSimpleModelToJson(ProductSimpleModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('protein', instance.protein);
  writeNotNull('fat', instance.fat);
  writeNotNull('carbon', instance.carbon);
  writeNotNull('calorie', instance.calorie);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('categoryName', instance.categoryName);
  writeNotNull('portionSizeId', instance.portionSizeId);
  writeNotNull('portionSize', instance.portionSize);
  writeNotNull('portionTypeName', instance.portionTypeName);
  writeNotNull('portionTypeId', instance.portionTypeId);
  return val;
}

MeasureChartDataRequestModel _$MeasureChartDataRequestModelFromJson(
    Map<String, dynamic> json) {
  return MeasureChartDataRequestModel(
    fromDate: json['fromDate'] == null
        ? null
        : DateTime.parse(json['fromDate'] as String),
    toDate: json['toDate'] == null
        ? null
        : DateTime.parse(json['toDate'] as String),
    chartTypes: chartsTypeListFromJson(json['chartTypes'] as List),
  );
}

Map<String, dynamic> _$MeasureChartDataRequestModelToJson(
    MeasureChartDataRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fromDate', _dateToJson(instance.fromDate));
  writeNotNull('toDate', _dateToJson(instance.toDate));
  writeNotNull('chartTypes', chartsTypeListToJson(instance.chartTypes));
  return val;
}
