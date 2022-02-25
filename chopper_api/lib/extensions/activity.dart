import 'package:chopper_api/api/swagger_api.swagger.dart';

extension ActivityExt on Activity {
  String get title {
    switch (this) {
      case Activity.sedentary:
        return 'Отсутствие нагрузки';
      case Activity.lightlyactive:
        return 'Очень низкий уровень активности';
      case Activity.active:
        return 'Низкий уровень активности';
      case Activity.moderatelyactive:
        return 'Умеренный уровень активности';
      case Activity.veryactive:
        return 'Средний уровень активности';
      case Activity.extraactive:
        return 'Высокая активность';
      case Activity.extremelyactive:
        return 'Экстремальная активность';
      default:
        return '';
    }
  }

  String get description {
    switch (this) {
      case Activity.sedentary:
        return 'Сидячая работа, отсутствие физической нагрузки или небольшая легкая нагрузка';
      case Activity.lightlyactive:
        return 'Интенсивные упражнения не менее 20 минут от 1 до 3 раз в неделю';
      case Activity.active:
        return 'Выполнение легких упражнений не менее 20 минут от 3 до 5 раз в неделю';
      case Activity.moderatelyactive:
        return 'Интенсивные упражнения от 30 до 60 минут от 3 до 5 раз в неделю';
      case Activity.veryactive:
        return 'Выполнение упражнений не менее 60 минут от 5 до 7 дней в неделю';
      case Activity.extraactive:
        return 'Выполнение интенсивных упражнений не менее 60 минут от 5 до 7 дней в неделю или занятия 2 раза в день';
      case Activity.extremelyactive:
        return '7 или более часов в неделю очень интенсивных упражнений';
      default:
        return '';
    }
  }
}
