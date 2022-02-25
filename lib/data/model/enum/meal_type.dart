import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:chopper_api/api/swagger_api.enums.swagger.dart';
import 'package:jiffy/jiffy.dart';

enum MealType {
  breakfast,
  secondbreakfast,
  dinner,
  afternoonsnack,
  supper,
  secondsupper,
  snack,
  snack2,
  snack3,
  snack4,
  snack5,
}

extension MealTypeExt on MealType {
  String get title {
    switch (this) {
      case MealType.breakfast:
        return Strings.current.breakfast;
      case MealType.secondbreakfast:
        return Strings.current.second_breakfast;
      case MealType.dinner:
        return Strings.current.dinner;
      case MealType.afternoonsnack:
        return Strings.current.afternoon_snack;
      case MealType.supper:
        return Strings.current.supper;
      case MealType.secondsupper:
        return Strings.current.second_supper;
      case MealType.snack:
        return Strings.current.snack;
      case MealType.snack2:
        return Strings.current.snack2;
      case MealType.snack3:
        return Strings.current.snack3;
      case MealType.snack4:
        return Strings.current.snack4;
      case MealType.snack5:
        return Strings.current.snack5;
      default:
        return "Unknown";
    }
  }

  FoodType get toFoodType {
    switch (this) {
      case MealType.breakfast:
        return FoodType.breakfast;
      case MealType.secondbreakfast:
        return FoodType.secondbreakfast;
      case MealType.dinner:
        return FoodType.dinner;
      case MealType.afternoonsnack:
        return FoodType.afternoonsnack;
      case MealType.supper:
        return FoodType.supper;
      case MealType.secondsupper:
        return FoodType.secondsupper;
      case MealType.snack:
        return FoodType.snack;
      case MealType.snack2:
        return FoodType.snack2;
      case MealType.snack3:
        return FoodType.snack3;
      case MealType.snack4:
        return FoodType.snack4;
      case MealType.snack5:
        return FoodType.snack5;
      default:
        return FoodType.swaggerGeneratedUnknown;
    }
  }
}

MealType mealFromFoodType(FoodType foodType) {
  switch (foodType) {
    case FoodType.breakfast:
      return MealType.breakfast;
    case FoodType.secondbreakfast:
      return MealType.secondbreakfast;
    case FoodType.dinner:
      return MealType.dinner;
    case FoodType.afternoonsnack:
      return MealType.afternoonsnack;
    case FoodType.supper:
      return MealType.supper;
    case FoodType.secondsupper:
      return MealType.secondsupper;
    case FoodType.snack:
      return MealType.snack;
    case FoodType.snack2:
      return MealType.snack2;
    case FoodType.snack3:
      return MealType.snack3;
    case FoodType.snack4:
      return MealType.snack4;
    case FoodType.snack5:
      return MealType.snack5;
    default:
      return MealType.snack;
  }
}

MealType mealFromDateTime(DateTime dateTime) {
  final duration = dateTime.difference(Jiffy(dateTime).startOf(Units.DAY));
  if (duration >= const Duration(hours: 6) && duration <= const Duration(hours: 10))
    return MealType.breakfast;
  else if (duration >= const Duration(hours: 10) && duration <= const Duration(hours: 12))
    return MealType.secondbreakfast;
  else if (duration >= const Duration(hours: 12) && duration <= const Duration(hours: 15))
    return MealType.dinner;
  else if (duration >= const Duration(hours: 15) && duration <= const Duration(hours: 17))
    return MealType.afternoonsnack;
  else if (duration >= const Duration(hours: 17) && duration <= const Duration(hours: 20))
    return MealType.dinner;
  else if (duration >= const Duration(hours: 20) && duration <= const Duration(hours: 21))
    return MealType.secondsupper;
  else
    return MealType.snack;
}
