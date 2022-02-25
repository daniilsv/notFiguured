// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(howMany, volume) =>
      "${Intl.plural(howMany, one: '1 бутылка на ${volume}', few: '${howMany} бутылки по ${volume}', other: '${howMany} бутылок по ${volume}')}";

  static String m1(howMany) =>
      "${Intl.plural(howMany, one: 'за ${howMany} день', few: 'за ${howMany} дня', other: 'за ${howMany} дней')}";

  static String m2(howMany, volume) =>
      "${Intl.plural(howMany, one: '1 стакан на ${volume}', few: '${howMany} стакана по ${volume}', other: '${howMany} стаканов по ${volume}')}";

  static String m3(value) => "${value} см";

  static String m4(value) => "${value} рамм";

  static String m5(value) => "${value} г / неделю";

  static String m6(value) => "${value} г";

  static String m7(value) => "${value} килограмм";

  static String m8(value) => "${value} кг";

  static String m9(value) => "${value} ккал / день";

  static String m10(value) => "${value} литров";

  static String m11(value) => "${value} л";

  static String m12(value) => "${value} миллилитров";

  static String m13(value) => "${value} мл";

  static String m14(time) => "(через ${time})";

  static String m15(index) => "Вариант ${index}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_app": MessageLookupByLibrary.simpleMessage("О приложении"),
        "accept_and_close":
            MessageLookupByLibrary.simpleMessage("Принять и закрыть"),
        "accountExit":
            MessageLookupByLibrary.simpleMessage("Выйти из аккаунта"),
        "achievement_date":
            MessageLookupByLibrary.simpleMessage("Дата достижения"),
        "activity": MessageLookupByLibrary.simpleMessage("Активность"),
        "add_exercise":
            MessageLookupByLibrary.simpleMessage("Добавить упражнения"),
        "add_exercises":
            MessageLookupByLibrary.simpleMessage("Добавить упражнения"),
        "add_goal": MessageLookupByLibrary.simpleMessage("Добавить в цель"),
        "add_measurement":
            MessageLookupByLibrary.simpleMessage("Добавить замер"),
        "add_measurement_category":
            MessageLookupByLibrary.simpleMessage("Добавить категорию замеров"),
        "add_product": MessageLookupByLibrary.simpleMessage("Добавить продукт"),
        "add_products":
            MessageLookupByLibrary.simpleMessage("Добавить продукты"),
        "add_record": MessageLookupByLibrary.simpleMessage("Добавить запись"),
        "afternoon_snack": MessageLookupByLibrary.simpleMessage("Полдник"),
        "app_title": MessageLookupByLibrary.simpleMessage("notfiguured"),
        "auth_error":
            MessageLookupByLibrary.simpleMessage("Ошибка авторизации"),
        "back": MessageLookupByLibrary.simpleMessage("Назад"),
        "bottles_count_by_volume": m0,
        "breakfast": MessageLookupByLibrary.simpleMessage("Завтрак"),
        "by_count_days": m1,
        "calculate_again":
            MessageLookupByLibrary.simpleMessage("Посчитать заново"),
        "calculate_ideal_macronutrition": MessageLookupByLibrary.simpleMessage(
            "Рассчитайте её в нашем\nкалькуляторе нормы БЖУ\nи создайте цель."),
        "calculate_ideal_weight": MessageLookupByLibrary.simpleMessage(
            "Рассчитайте его в нашем калькуляторе идеального веса и создайте цель."),
        "calculate_rate":
            MessageLookupByLibrary.simpleMessage("Рассчитать норму"),
        "calculate_weight":
            MessageLookupByLibrary.simpleMessage("Рассчитать вес"),
        "calculator_water_consume": MessageLookupByLibrary.simpleMessage(
            "Калькулятор\nпотребления воды"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "carbo_character": MessageLookupByLibrary.simpleMessage("У"),
        "changes_history":
            MessageLookupByLibrary.simpleMessage("История изменений"),
        "chart_period_all": MessageLookupByLibrary.simpleMessage("Всё время"),
        "chart_period_month": MessageLookupByLibrary.simpleMessage("За месяц"),
        "chart_period_week": MessageLookupByLibrary.simpleMessage("За неделю"),
        "chest": MessageLookupByLibrary.simpleMessage("Обхват груди"),
        "choose_goal": MessageLookupByLibrary.simpleMessage("Выберите цель"),
        "choose_goal_description": MessageLookupByLibrary.simpleMessage(
            "Мы помогаем людям контролировать свой вес, калории, соотношение БЖУ и, самое главное, достигать поставленных целей!"),
        "choose_measurements_categories": MessageLookupByLibrary.simpleMessage(
            "Выберите нужные вам категории замеров."),
        "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "consume_mode_by_day": MessageLookupByLibrary.simpleMessage("На сутки"),
        "consume_mode_by_meal":
            MessageLookupByLibrary.simpleMessage("На приём пищи"),
        "consuming": MessageLookupByLibrary.simpleMessage("Потребляя"),
        "control_calories":
            MessageLookupByLibrary.simpleMessage("Контроль калорий"),
        "control_macronutrition":
            MessageLookupByLibrary.simpleMessage("Контроль БЖУ"),
        "control_weight": MessageLookupByLibrary.simpleMessage("Контроль веса"),
        "current_weight": MessageLookupByLibrary.simpleMessage("Текущий вес"),
        "date": MessageLookupByLibrary.simpleMessage("Дата"),
        "dateOfBirs": MessageLookupByLibrary.simpleMessage("Дата рождения"),
        "date_of_measurement":
            MessageLookupByLibrary.simpleMessage("Дата замера"),
        "day_diary_is_empty": MessageLookupByLibrary.simpleMessage(
            "За этот день Вы ещё не заполняли свой дневник питания."),
        "day_exercise_diary_is_empty": MessageLookupByLibrary.simpleMessage(
            "За этот день Вы ещё не заполняли свой дневник упражнений."),
        "delete_exercise":
            MessageLookupByLibrary.simpleMessage("Удалить упражнение"),
        "delete_product":
            MessageLookupByLibrary.simpleMessage("Удалить продукт"),
        "deviation": MessageLookupByLibrary.simpleMessage("Отклонение"),
        "dinner": MessageLookupByLibrary.simpleMessage("Обед"),
        "do_registration":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "done": MessageLookupByLibrary.simpleMessage("Готово"),
        "dont_have_account":
            MessageLookupByLibrary.simpleMessage("Ещё нет аккаунта?"),
        "eat_per_day": MessageLookupByLibrary.simpleMessage("Съедаю в день"),
        "edit_shortly": MessageLookupByLibrary.simpleMessage("Ред."),
        "email_error":
            MessageLookupByLibrary.simpleMessage("E-mail введён неверно"),
        "email_or_password_not_valid":
            MessageLookupByLibrary.simpleMessage("Неверный E-mail или пароль"),
        "email_required":
            MessageLookupByLibrary.simpleMessage("Требуется E-mail"),
        "energy_value":
            MessageLookupByLibrary.simpleMessage("Энергетическая ценность"),
        "enter_code": MessageLookupByLibrary.simpleMessage("Введите код"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "exercise_diary":
            MessageLookupByLibrary.simpleMessage("Дневник упражнений"),
        "exercise_diary_adding_title":
            MessageLookupByLibrary.simpleMessage("Ваша тренировка"),
        "exercises_not_found": MessageLookupByLibrary.simpleMessage(
            "Упражнений по Вашему\nзапросу не найдено."),
        "fact": MessageLookupByLibrary.simpleMessage("Факт"),
        "fat_character": MessageLookupByLibrary.simpleMessage("Ж"),
        "fat_percent": MessageLookupByLibrary.simpleMessage("Процент жира"),
        "food_diary": MessageLookupByLibrary.simpleMessage("Дневник питания"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "friday": MessageLookupByLibrary.simpleMessage("пятница"),
        "g": MessageLookupByLibrary.simpleMessage("г"),
        "girth_ankle": MessageLookupByLibrary.simpleMessage("Обхват щиколотки"),
        "girth_biceps": MessageLookupByLibrary.simpleMessage("Обхват бицепса"),
        "girth_calf": MessageLookupByLibrary.simpleMessage("Обхват голени"),
        "girth_chest": MessageLookupByLibrary.simpleMessage("Обхват груди"),
        "girth_forearm":
            MessageLookupByLibrary.simpleMessage("Обхват предплечья"),
        "girth_hips": MessageLookupByLibrary.simpleMessage("Обхват бёдер"),
        "girth_neck": MessageLookupByLibrary.simpleMessage("Обхват шеи"),
        "girth_stomach": MessageLookupByLibrary.simpleMessage("Обхват живота"),
        "girth_thigh": MessageLookupByLibrary.simpleMessage("Обхват бедра"),
        "girth_under_chest":
            MessageLookupByLibrary.simpleMessage("Обхват под грудью"),
        "girth_upper_knee":
            MessageLookupByLibrary.simpleMessage("Обхват над коленом"),
        "girth_waist": MessageLookupByLibrary.simpleMessage("Обхват талии"),
        "girth_wrist": MessageLookupByLibrary.simpleMessage("Обхват запястья"),
        "glasses_count_by_volume": m2,
        "goal": MessageLookupByLibrary.simpleMessage("Цель"),
        "goal_hardlevel_extream":
            MessageLookupByLibrary.simpleMessage("Экстремальная"),
        "goal_hardlevel_optionality":
            MessageLookupByLibrary.simpleMessage("По вашему выбору"),
        "goal_hardlevel_safety":
            MessageLookupByLibrary.simpleMessage("Безопасная"),
        "goal_met_by":
            MessageLookupByLibrary.simpleMessage("Цель выполнена на"),
        "goal_onboarding_fill_later":
            MessageLookupByLibrary.simpleMessage("Заполнить позже"),
        "goal_onboarding_fill_now":
            MessageLookupByLibrary.simpleMessage("Заполнить сейчас"),
        "goal_onboarding_say_about_you": MessageLookupByLibrary.simpleMessage(
            "\n\n\nРасскажите нам о себе, чтобы получить персонализированные рекомендации и отслеживать прогресс.\n\nПоверьте, это не займет много времени. Начнём?"),
        "goal_onboarding_title":
            MessageLookupByLibrary.simpleMessage("Рады знакомству,\n"),
        "goal_weight": MessageLookupByLibrary.simpleMessage("Желаемый вес"),
        "good_password":
            MessageLookupByLibrary.simpleMessage("Отличный пароль!"),
        "growth": MessageLookupByLibrary.simpleMessage("Рост"),
        "has_account_already":
            MessageLookupByLibrary.simpleMessage("Уже есть аккаунт?"),
        "i_agree_with": MessageLookupByLibrary.simpleMessage("Согласен с"),
        "inputed_fraction_not_correct":
            MessageLookupByLibrary.simpleMessage("Доля введена некооректно!"),
        "join": MessageLookupByLibrary.simpleMessage("Присоединиться"),
        "kK": MessageLookupByLibrary.simpleMessage("кК"),
        "kalories_character": MessageLookupByLibrary.simpleMessage("К"),
        "kg": MessageLookupByLibrary.simpleMessage("кг"),
        "kkal": MessageLookupByLibrary.simpleMessage("ккал"),
        "kkal_carbohyd": MessageLookupByLibrary.simpleMessage("ккал углеводов"),
        "kkal_fat": MessageLookupByLibrary.simpleMessage("ккал жиров"),
        "kkal_protain": MessageLookupByLibrary.simpleMessage("ккал белков"),
        "last_adding":
            MessageLookupByLibrary.simpleMessage("Вы недавно добавляли"),
        "last_measurement":
            MessageLookupByLibrary.simpleMessage("Последний замер"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "make_up_nickname":
            MessageLookupByLibrary.simpleMessage("Придумайте никнейм"),
        "maximum": MessageLookupByLibrary.simpleMessage("Максимум"),
        "meal": MessageLookupByLibrary.simpleMessage("Приём пищи"),
        "measure_girth": m3,
        "measure_gram": m4,
        "measure_gram_per_week": m5,
        "measure_gram_short": m6,
        "measure_kilogram": m7,
        "measure_kilogram_short": m8,
        "measure_kkal_per_day": m9,
        "measure_liters": m10,
        "measure_liters_short": m11,
        "measure_milliliters": m12,
        "measure_milliliters_short": m13,
        "measurements": MessageLookupByLibrary.simpleMessage("Замеры"),
        "measurements_screen_description": MessageLookupByLibrary.simpleMessage(
            "Замеры позволяют отслеживать выбранные показатели и их прогресс."),
        "message_sended":
            MessageLookupByLibrary.simpleMessage("Сообщение отправлено"),
        "method_not_found":
            MessageLookupByLibrary.simpleMessage("Данный метод отсутствует"),
        "minimum": MessageLookupByLibrary.simpleMessage("Минимум"),
        "monday": MessageLookupByLibrary.simpleMessage("понедельник"),
        "myProfile": MessageLookupByLibrary.simpleMessage("Мой профиль"),
        "new_goal": MessageLookupByLibrary.simpleMessage("Новая цель"),
        "new_goal_description": MessageLookupByLibrary.simpleMessage(
            "Мы рекомендуем использовать комплексный подход и учитывать сразу все показатели."),
        "new_meal": MessageLookupByLibrary.simpleMessage("Новый приём пищи"),
        "new_password": MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "new_password_hint": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, придумайте новый пароль для входа в аккаунт."),
        "next_step": MessageLookupByLibrary.simpleMessage("Следующий шаг"),
        "nickname": MessageLookupByLibrary.simpleMessage("Никнейм"),
        "norma_calories": MessageLookupByLibrary.simpleMessage("Норма калорий"),
        "not_enough_rights": MessageLookupByLibrary.simpleMessage(
            "Нет прав для выполнения данного действия"),
        "not_indicated": MessageLookupByLibrary.simpleMessage("Не указано"),
        "not_same_passwords":
            MessageLookupByLibrary.simpleMessage("Пароли не совпадают"),
        "of_calories": MessageLookupByLibrary.simpleMessage("Калорий"),
        "of_carbohydrate": MessageLookupByLibrary.simpleMessage("Углеводов"),
        "of_fat": MessageLookupByLibrary.simpleMessage("Жиров"),
        "of_protein": MessageLookupByLibrary.simpleMessage("Белков"),
        "or_login_with":
            MessageLookupByLibrary.simpleMessage("Или войдите через"),
        "or_sign_up_from":
            MessageLookupByLibrary.simpleMessage("Или зарегистрируйтесь через"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "password_repeat":
            MessageLookupByLibrary.simpleMessage("Повторите пароль"),
        "password_required":
            MessageLookupByLibrary.simpleMessage("Требуется пароль"),
        "percent_of_fat": MessageLookupByLibrary.simpleMessage("Процент жира"),
        "personalization_next":
            MessageLookupByLibrary.simpleMessage("Следующий шаг"),
        "plan": MessageLookupByLibrary.simpleMessage("План"),
        "plan_daily": MessageLookupByLibrary.simpleMessage("План на сегодня"),
        "plan_weight": MessageLookupByLibrary.simpleMessage("Прогноз"),
        "politics_contacts_content_3_1": MessageLookupByLibrary.simpleMessage(
            "3.1. Направить соответствующее обращение в рамках реализации прав Пользователя в отношении своих Персональных данных или оставить свои комментарии и предложения относительно условий настоящей Политики можно посредством отправки сообщения на адрес электронной почты cs@foodcards.ru или письма на адрес Обработчика: 127287, г. Москва, ул. 2-я Хуторская, д. 38А, корп.9, офис 107."),
        "politics_contacts_title_3":
            MessageLookupByLibrary.simpleMessage("3. Контакты"),
        "politics_content": MessageLookupByLibrary.simpleMessage(
            "Настоящая политика конфиденциальности (далее – «Политика») действует в отношении всей информации, которую Обработчик может получить о Пользователе во время посещения им Сайта. Использование Сайта означает безоговорочное согласие Пользователя с настоящей Политикой и указанными в ней условиями обработки его персональных данных. В случае несогласия с этими условиями, Пользователь должен воздержаться от использования Сайта.\n\nВ Политике используются следующие основные понятия:"),
        "politics_general_provisions_content_1_1":
            MessageLookupByLibrary.simpleMessage(
                "1.1. Настоящая Политика определяет политику Обработчика в отношении обработки Персональных данных Пользователей Сайта, обрабатываемых по поручению Оператора, а также содержит сведения о реализуемых Обработчиком требованиях к защите Персональных данных Пользователей Сайта."),
        "politics_general_provisions_content_1_2":
            MessageLookupByLibrary.simpleMessage(
                "1.2. В целях, указанных в пунктах 2.1 Политики, Обработчик по поручению Оператора также обрабатывает данные, не являющиеся Персональными данными:"),
        "politics_general_provisions_title_1":
            MessageLookupByLibrary.simpleMessage("1. Общие положения"),
        "politics_handler_content": MessageLookupByLibrary.simpleMessage(
            "Означает Общество с ограниченной ответственностью «ФУД СЕРВИС ВОСТОК», ИНН 7725799866 расположенное по адресу: 127287, г. Москва, ул. 2-я Хуторская, д. 38А, корп.15, осуществляющее обработку\nПерсональных данных по поручению Оператора в соответствии с заключенным между ними договором."),
        "politics_handler_subtitle":
            MessageLookupByLibrary.simpleMessage("Обработчик"),
        "politics_operator_content": MessageLookupByLibrary.simpleMessage(
            "Означает лицо, передавшее Обработчику Персональные данные и поручившее Обработчику обработку переданных Персональных данных, а также определяющее цели обработки Персональных данных, состав Персональных данных, подлежащих обработке, действия (операции), совершаемые с Персональными данными."),
        "politics_operator_provisions_title_2":
            MessageLookupByLibrary.simpleMessage(
                "2. Персональные данные, которые собирает и обрабатывает оператор.\n\nЦели обработки персональных данных."),
        "politics_operator_subtitle":
            MessageLookupByLibrary.simpleMessage("Оператор"),
        "politics_purposes_processing_data_content_2_1":
            MessageLookupByLibrary.simpleMessage(
                "2.1. Настоящая Политика определяет политику Обработчика в отношении обработки Персональных данных Пользователей Сайта, обрабатываемых по поручению Оператора, а также содержит сведения о реализуемых Обработчиком требованиях к защите Персональных данных Пользователей Сайта."),
        "politics_purposes_processing_data_content_2_2":
            MessageLookupByLibrary.simpleMessage(
                "2.2. Настоящая Политика публикуется Обработчиком во исполнение норм действующего законодательства Российской Федерации, в том числе статьи 18.1 Закона"),
        "politics_purposes_processing_data_content_2_2_item_1":
            MessageLookupByLibrary.simpleMessage(
                "стандартные технические и иные данные, автоматически получаемые Обработчиком при доступе Пользователя к Сайту и последующих действиях Пользователя, на Сайте (месторасположение в определенный момент времени, IP-адрес, вид операционной системы устройства Пользователя, разделы Сайта, посещаемые Пользователем)."),
        "politics_purposes_processing_data_content_2_2_item_2":
            MessageLookupByLibrary.simpleMessage(
                "стандартные технические и иные данные, автоматически получаемые Обработчиком при доступе Пользователя к Сайту и последующих действиях Пользователя, на Сайте (месторасположение в определенный момент времени, IP-адрес, вид операционной системы устройства Пользователя, разделы Сайта, посещаемые Пользователем)."),
        "politics_short_title":
            MessageLookupByLibrary.simpleMessage("Политика конфиденциальности"),
        "politics_title": MessageLookupByLibrary.simpleMessage(
            "Условия обработки персональных данных"),
        "portion": MessageLookupByLibrary.simpleMessage("Порция"),
        "prediction": MessageLookupByLibrary.simpleMessage("Прогноз"),
        "private_policy": MessageLookupByLibrary.simpleMessage(
            "Политикой конфиденциальности"),
        "products_not_found": MessageLookupByLibrary.simpleMessage(
            "Продуктов и блюд по Вашему\nзапросу не найдено."),
        "proteins_character": MessageLookupByLibrary.simpleMessage("Б"),
        "reach_goal": MessageLookupByLibrary.simpleMessage("Достигнете цели"),
        "receive_code": MessageLookupByLibrary.simpleMessage("Получить код"),
        "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "remaining_to_goal":
            MessageLookupByLibrary.simpleMessage("Осталось до цели"),
        "renewed": MessageLookupByLibrary.simpleMessage("Новый"),
        "report_problem":
            MessageLookupByLibrary.simpleMessage("Сообщите о проблеме"),
        "report_problem_email_access": MessageLookupByLibrary.simpleMessage(
            "к которому у Вас есть доступ."),
        "report_problem_response": MessageLookupByLibrary.simpleMessage(
            "\n\nМы свяжемся с Вами в течение суток."),
        "report_problem_tryed": MessageLookupByLibrary.simpleMessage(
            "Вы попытались восстановить пароль несколько раз, но письмо так и не пришло?\n\nОставьте свой E-mail, "),
        "require_8_not_less_symbols":
            MessageLookupByLibrary.simpleMessage("Не менее 8-ми символов"),
        "required_not_empty_field":
            MessageLookupByLibrary.simpleMessage("Поле не должно быть пустым!"),
        "restore_password":
            MessageLookupByLibrary.simpleMessage("Восстановить пароль"),
        "restore_password_code_sent_end": MessageLookupByLibrary.simpleMessage(
            ".\n\nПожалуйста, проверьте почту и введите код."),
        "restore_password_code_sent_start":
            MessageLookupByLibrary.simpleMessage(
                "Мы отправили код для смены пароля на "),
        "restore_password_hint": MessageLookupByLibrary.simpleMessage(
            "Укажите E-mail, на который зарегистрирован Ваш аккаунт.\n\nНа него мы пришлем код для смены пароля."),
        "restore_password_resend_end": m14,
        "restore_password_resent_end": MessageLookupByLibrary.simpleMessage(
            ".\n\nПожалуйста, проверьте почту и введите код.\n\nВозможно, письмо оказалось в папке "),
        "restore_password_resent_start": MessageLookupByLibrary.simpleMessage(
            "Мы ещё раз отправили код для смены пароля на "),
        "restore_password_still_no_code":
            MessageLookupByLibrary.simpleMessage("Так и не получили письмо?"),
        "restore_password_token_expired":
            MessageLookupByLibrary.simpleMessage("Проверочный код устарел."),
        "restore_password_wrong_code":
            MessageLookupByLibrary.simpleMessage("Код введён с ошибкой"),
        "saturday": MessageLookupByLibrary.simpleMessage("суббота"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "save_and_signin":
            MessageLookupByLibrary.simpleMessage("Сохранить и войти"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "search_empty":
            MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
        "second_breakfast": MessageLookupByLibrary.simpleMessage("2-й Завтрак"),
        "second_supper": MessageLookupByLibrary.simpleMessage("2-й Ужин"),
        "send": MessageLookupByLibrary.simpleMessage("Отправить"),
        "send_again":
            MessageLookupByLibrary.simpleMessage("Отправить повторно"),
        "server_error": MessageLookupByLibrary.simpleMessage("Ошибка сервера"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "settings_measurements":
            MessageLookupByLibrary.simpleMessage("Настройки замеров"),
        "sex": MessageLookupByLibrary.simpleMessage("Пол"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Вход"),
        "skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
        "sm": MessageLookupByLibrary.simpleMessage("см"),
        "snack": MessageLookupByLibrary.simpleMessage("Перекус"),
        "snack2": MessageLookupByLibrary.simpleMessage("2-й Перекус"),
        "snack3": MessageLookupByLibrary.simpleMessage("3-й Перекус"),
        "snack4": MessageLookupByLibrary.simpleMessage("4-й Перекус"),
        "snack5": MessageLookupByLibrary.simpleMessage("5-й Перекус"),
        "spam": MessageLookupByLibrary.simpleMessage("спам"),
        "splash_hint": MessageLookupByLibrary.simpleMessage(
            "Зарегистрируйтесь или войдите в свой аккаунт.\n\nРегистрация позволит вам создавать цели, отслеживать их прогресс, вносить замеры и следить за изменениями."),
        "start": MessageLookupByLibrary.simpleMessage("Старт"),
        "start_fill_exercise_name": MessageLookupByLibrary.simpleMessage(
            "Начните вводить название\nупражнения."),
        "start_fill_product_name": MessageLookupByLibrary.simpleMessage(
            "Начните вводить название\nпродукта или блюда."),
        "success_do_last_step": MessageLookupByLibrary.simpleMessage(
            "Отлично!\nОстался последний шаг."),
        "such_user_not_found": MessageLookupByLibrary.simpleMessage(
            "Такой E-mail не зарегистрирован"),
        "sunday": MessageLookupByLibrary.simpleMessage("воскресенье"),
        "supper": MessageLookupByLibrary.simpleMessage("Ужин"),
        "thursday": MessageLookupByLibrary.simpleMessage("четверг"),
        "time": MessageLookupByLibrary.simpleMessage("Время"),
        "timeLine": MessageLookupByLibrary.simpleMessage("Часовой пояс"),
        "to_cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "today_burn":
            MessageLookupByLibrary.simpleMessage("Сожженно ккал за сегодня:"),
        "today_eat":
            MessageLookupByLibrary.simpleMessage("Употреблено ккал за день:"),
        "today_ex": MessageLookupByLibrary.simpleMessage("Итого за день:"),
        "total_daily": MessageLookupByLibrary.simpleMessage("Итого за сегодня"),
        "tuesday": MessageLookupByLibrary.simpleMessage("вторник"),
        "unknown_error":
            MessageLookupByLibrary.simpleMessage("Неизвестная ошибка"),
        "user_not_found":
            MessageLookupByLibrary.simpleMessage("Пользователь не найден"),
        "variant_index": m15,
        "want_to_know_your_ideal_macronutrition":
            MessageLookupByLibrary.simpleMessage(
                "Хотите узнать Вашу норму БЖУ?"),
        "want_to_know_your_ideal_weight": MessageLookupByLibrary.simpleMessage(
            "Хотите узнать Ваш идеальный вес?"),
        "we_are_already_working": MessageLookupByLibrary.simpleMessage(
            "Мы уже работаем над Вашей проблемой."),
        "wednesday": MessageLookupByLibrary.simpleMessage("среда"),
        "weight": MessageLookupByLibrary.simpleMessage("Вес"),
        "weight_now": MessageLookupByLibrary.simpleMessage("Вес сейчас"),
        "will_lose": MessageLookupByLibrary.simpleMessage("Будете терять"),
        "wrist": MessageLookupByLibrary.simpleMessage("Обхват запястья"),
        "wrong_data_format":
            MessageLookupByLibrary.simpleMessage("Неверный формат данных"),
        "you_can_change_measurements": MessageLookupByLibrary.simpleMessage(
            "Вы всегда сможете их дополнить или удалить ненужные."),
        "yourNickname": MessageLookupByLibrary.simpleMessage("Ваш никнейм"),
        "your_email": MessageLookupByLibrary.simpleMessage("Ваш E-mail"),
        "your_email_hint":
            MessageLookupByLibrary.simpleMessage("youremail@mail.com"),
        "your_ideal_weight":
            MessageLookupByLibrary.simpleMessage("Ваш идеальный вес"),
        "your_norma_macronutrition":
            MessageLookupByLibrary.simpleMessage("Ваша норма БЖУ"),
        "your_sex": MessageLookupByLibrary.simpleMessage("Ваш пол"),
        "your_water_daily_rate":
            MessageLookupByLibrary.simpleMessage("Ваша суточная\nнорма воды")
      };
}
