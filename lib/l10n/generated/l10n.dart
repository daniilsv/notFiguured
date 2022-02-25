// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `notfiguured`
  String get app_title {
    return Intl.message(
      'notfiguured',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрируйтесь или войдите в свой аккаунт.\n\nРегистрация позволит вам создавать цели, отслеживать их прогресс, вносить замеры и следить за изменениями.`
  String get splash_hint {
    return Intl.message(
      'Зарегистрируйтесь или войдите в свой аккаунт.\n\nРегистрация позволит вам создавать цели, отслеживать их прогресс, вносить замеры и следить за изменениями.',
      name: 'splash_hint',
      desc: '',
      args: [],
    );
  }

  /// `Вход`
  String get sign_in {
    return Intl.message(
      'Вход',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Ваш E-mail`
  String get your_email {
    return Intl.message(
      'Ваш E-mail',
      name: 'your_email',
      desc: '',
      args: [],
    );
  }

  /// `youremail@mail.com`
  String get your_email_hint {
    return Intl.message(
      'youremail@mail.com',
      name: 'your_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `E-mail введён неверно`
  String get email_error {
    return Intl.message(
      'E-mail введён неверно',
      name: 'email_error',
      desc: '',
      args: [],
    );
  }

  /// `Требуется E-mail`
  String get email_required {
    return Intl.message(
      'Требуется E-mail',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Повторите пароль`
  String get password_repeat {
    return Intl.message(
      'Повторите пароль',
      name: 'password_repeat',
      desc: '',
      args: [],
    );
  }

  /// `Требуется пароль`
  String get password_required {
    return Intl.message(
      'Требуется пароль',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Отличный пароль!`
  String get good_password {
    return Intl.message(
      'Отличный пароль!',
      name: 'good_password',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get login {
    return Intl.message(
      'Войти',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Или войдите через`
  String get or_login_with {
    return Intl.message(
      'Или войдите через',
      name: 'or_login_with',
      desc: '',
      args: [],
    );
  }

  /// `Ещё нет аккаунта?`
  String get dont_have_account {
    return Intl.message(
      'Ещё нет аккаунта?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Присоединиться`
  String get join {
    return Intl.message(
      'Присоединиться',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get registration {
    return Intl.message(
      'Регистрация',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get do_registration {
    return Intl.message(
      'Зарегистрироваться',
      name: 'do_registration',
      desc: '',
      args: [],
    );
  }

  /// `Следующий шаг`
  String get next_step {
    return Intl.message(
      'Следующий шаг',
      name: 'next_step',
      desc: '',
      args: [],
    );
  }

  /// `Или зарегистрируйтесь через`
  String get or_sign_up_from {
    return Intl.message(
      'Или зарегистрируйтесь через',
      name: 'or_sign_up_from',
      desc: '',
      args: [],
    );
  }

  /// `Уже есть аккаунт?`
  String get has_account_already {
    return Intl.message(
      'Уже есть аккаунт?',
      name: 'has_account_already',
      desc: '',
      args: [],
    );
  }

  /// `Не менее 8-ми символов`
  String get require_8_not_less_symbols {
    return Intl.message(
      'Не менее 8-ми символов',
      name: 'require_8_not_less_symbols',
      desc: '',
      args: [],
    );
  }

  /// `Забыли пароль?`
  String get forgot_password {
    return Intl.message(
      'Забыли пароль?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Придумайте никнейм`
  String get make_up_nickname {
    return Intl.message(
      'Придумайте никнейм',
      name: 'make_up_nickname',
      desc: '',
      args: [],
    );
  }

  /// `Никнейм`
  String get nickname {
    return Intl.message(
      'Никнейм',
      name: 'nickname',
      desc: '',
      args: [],
    );
  }

  /// `Отлично!\nОстался последний шаг.`
  String get success_do_last_step {
    return Intl.message(
      'Отлично!\nОстался последний шаг.',
      name: 'success_do_last_step',
      desc: '',
      args: [],
    );
  }

  /// `Согласен с`
  String get i_agree_with {
    return Intl.message(
      'Согласен с',
      name: 'i_agree_with',
      desc: '',
      args: [],
    );
  }

  /// `Политикой конфиденциальности`
  String get private_policy {
    return Intl.message(
      'Политикой конфиденциальности',
      name: 'private_policy',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка авторизации`
  String get auth_error {
    return Intl.message(
      'Ошибка авторизации',
      name: 'auth_error',
      desc: '',
      args: [],
    );
  }

  /// `Пользователь не найден`
  String get user_not_found {
    return Intl.message(
      'Пользователь не найден',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get close {
    return Intl.message(
      'Закрыть',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Новая цель`
  String get new_goal {
    return Intl.message(
      'Новая цель',
      name: 'new_goal',
      desc: '',
      args: [],
    );
  }

  /// `Мы рекомендуем использовать комплексный подход и учитывать сразу все показатели.`
  String get new_goal_description {
    return Intl.message(
      'Мы рекомендуем использовать комплексный подход и учитывать сразу все показатели.',
      name: 'new_goal_description',
      desc: '',
      args: [],
    );
  }

  /// `Выберите цель`
  String get choose_goal {
    return Intl.message(
      'Выберите цель',
      name: 'choose_goal',
      desc: '',
      args: [],
    );
  }

  /// `Мы помогаем людям контролировать свой вес, калории, соотношение БЖУ и, самое главное, достигать поставленных целей!`
  String get choose_goal_description {
    return Intl.message(
      'Мы помогаем людям контролировать свой вес, калории, соотношение БЖУ и, самое главное, достигать поставленных целей!',
      name: 'choose_goal_description',
      desc: '',
      args: [],
    );
  }

  /// `Вес сейчас`
  String get weight_now {
    return Intl.message(
      'Вес сейчас',
      name: 'weight_now',
      desc: '',
      args: [],
    );
  }

  /// `Ваш идеальный вес`
  String get your_ideal_weight {
    return Intl.message(
      'Ваш идеальный вес',
      name: 'your_ideal_weight',
      desc: '',
      args: [],
    );
  }

  /// `Хотите узнать Ваш идеальный вес?`
  String get want_to_know_your_ideal_weight {
    return Intl.message(
      'Хотите узнать Ваш идеальный вес?',
      name: 'want_to_know_your_ideal_weight',
      desc: '',
      args: [],
    );
  }

  /// `Хотите узнать Вашу норму БЖУ?`
  String get want_to_know_your_ideal_macronutrition {
    return Intl.message(
      'Хотите узнать Вашу норму БЖУ?',
      name: 'want_to_know_your_ideal_macronutrition',
      desc: '',
      args: [],
    );
  }

  /// `Рассчитайте его в нашем калькуляторе идеального веса и создайте цель.`
  String get calculate_ideal_weight {
    return Intl.message(
      'Рассчитайте его в нашем калькуляторе идеального веса и создайте цель.',
      name: 'calculate_ideal_weight',
      desc: '',
      args: [],
    );
  }

  /// `Рассчитайте её в нашем\nкалькуляторе нормы БЖУ\nи создайте цель.`
  String get calculate_ideal_macronutrition {
    return Intl.message(
      'Рассчитайте её в нашем\nкалькуляторе нормы БЖУ\nи создайте цель.',
      name: 'calculate_ideal_macronutrition',
      desc: '',
      args: [],
    );
  }

  /// `Рассчитать вес`
  String get calculate_weight {
    return Intl.message(
      'Рассчитать вес',
      name: 'calculate_weight',
      desc: '',
      args: [],
    );
  }

  /// `Рассчитать норму`
  String get calculate_rate {
    return Intl.message(
      'Рассчитать норму',
      name: 'calculate_rate',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестная ошибка`
  String get unknown_error {
    return Intl.message(
      'Неизвестная ошибка',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Восстановить пароль`
  String get restore_password {
    return Intl.message(
      'Восстановить пароль',
      name: 'restore_password',
      desc: '',
      args: [],
    );
  }

  /// `Укажите E-mail, на который зарегистрирован Ваш аккаунт.\n\nНа него мы пришлем код для смены пароля.`
  String get restore_password_hint {
    return Intl.message(
      'Укажите E-mail, на который зарегистрирован Ваш аккаунт.\n\nНа него мы пришлем код для смены пароля.',
      name: 'restore_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Введите код`
  String get enter_code {
    return Intl.message(
      'Введите код',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  /// `Сообщите о проблеме`
  String get report_problem {
    return Intl.message(
      'Сообщите о проблеме',
      name: 'report_problem',
      desc: '',
      args: [],
    );
  }

  /// `Вы попытались восстановить пароль несколько раз, но письмо так и не пришло?\n\nОставьте свой E-mail, `
  String get report_problem_tryed {
    return Intl.message(
      'Вы попытались восстановить пароль несколько раз, но письмо так и не пришло?\n\nОставьте свой E-mail, ',
      name: 'report_problem_tryed',
      desc: '',
      args: [],
    );
  }

  /// `к которому у Вас есть доступ.`
  String get report_problem_email_access {
    return Intl.message(
      'к которому у Вас есть доступ.',
      name: 'report_problem_email_access',
      desc: '',
      args: [],
    );
  }

  /// `\n\nМы свяжемся с Вами в течение суток.`
  String get report_problem_response {
    return Intl.message(
      '\n\nМы свяжемся с Вами в течение суток.',
      name: 'report_problem_response',
      desc: '',
      args: [],
    );
  }

  /// `Сообщение отправлено`
  String get message_sended {
    return Intl.message(
      'Сообщение отправлено',
      name: 'message_sended',
      desc: '',
      args: [],
    );
  }

  /// `Мы уже работаем над Вашей проблемой.`
  String get we_are_already_working {
    return Intl.message(
      'Мы уже работаем над Вашей проблемой.',
      name: 'we_are_already_working',
      desc: '',
      args: [],
    );
  }

  /// `Мы отправили код для смены пароля на `
  String get restore_password_code_sent_start {
    return Intl.message(
      'Мы отправили код для смены пароля на ',
      name: 'restore_password_code_sent_start',
      desc: '',
      args: [],
    );
  }

  /// `.\n\nПожалуйста, проверьте почту и введите код.`
  String get restore_password_code_sent_end {
    return Intl.message(
      '.\n\nПожалуйста, проверьте почту и введите код.',
      name: 'restore_password_code_sent_end',
      desc: '',
      args: [],
    );
  }

  /// `Код введён с ошибкой`
  String get restore_password_wrong_code {
    return Intl.message(
      'Код введён с ошибкой',
      name: 'restore_password_wrong_code',
      desc: '',
      args: [],
    );
  }

  /// `Так и не получили письмо?`
  String get restore_password_still_no_code {
    return Intl.message(
      'Так и не получили письмо?',
      name: 'restore_password_still_no_code',
      desc: '',
      args: [],
    );
  }

  /// `(через {time})`
  String restore_password_resend_end(Object time) {
    return Intl.message(
      '(через $time)',
      name: 'restore_password_resend_end',
      desc: '',
      args: [time],
    );
  }

  /// `Проверочный код устарел.`
  String get restore_password_token_expired {
    return Intl.message(
      'Проверочный код устарел.',
      name: 'restore_password_token_expired',
      desc: '',
      args: [],
    );
  }

  /// `Мы ещё раз отправили код для смены пароля на `
  String get restore_password_resent_start {
    return Intl.message(
      'Мы ещё раз отправили код для смены пароля на ',
      name: 'restore_password_resent_start',
      desc: '',
      args: [],
    );
  }

  /// `.\n\nПожалуйста, проверьте почту и введите код.\n\nВозможно, письмо оказалось в папке `
  String get restore_password_resent_end {
    return Intl.message(
      '.\n\nПожалуйста, проверьте почту и введите код.\n\nВозможно, письмо оказалось в папке ',
      name: 'restore_password_resent_end',
      desc: '',
      args: [],
    );
  }

  /// `спам`
  String get spam {
    return Intl.message(
      'спам',
      name: 'spam',
      desc: '',
      args: [],
    );
  }

  /// `Новый`
  String get renewed {
    return Intl.message(
      'Новый',
      name: 'renewed',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Отправить`
  String get send {
    return Intl.message(
      'Отправить',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Отправить повторно`
  String get send_again {
    return Intl.message(
      'Отправить повторно',
      name: 'send_again',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, придумайте новый пароль для входа в аккаунт.`
  String get new_password_hint {
    return Intl.message(
      'Пожалуйста, придумайте новый пароль для входа в аккаунт.',
      name: 'new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get new_password {
    return Intl.message(
      'Новый пароль',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Пароли не совпадают`
  String get not_same_passwords {
    return Intl.message(
      'Пароли не совпадают',
      name: 'not_same_passwords',
      desc: '',
      args: [],
    );
  }

  /// `Получить код`
  String get receive_code {
    return Intl.message(
      'Получить код',
      name: 'receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить и войти`
  String get save_and_signin {
    return Intl.message(
      'Сохранить и войти',
      name: 'save_and_signin',
      desc: '',
      args: [],
    );
  }

  /// `Такой E-mail не зарегистрирован`
  String get such_user_not_found {
    return Intl.message(
      'Такой E-mail не зарегистрирован',
      name: 'such_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Пропустить`
  String get skip {
    return Intl.message(
      'Пропустить',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Неверный E-mail или пароль`
  String get email_or_password_not_valid {
    return Intl.message(
      'Неверный E-mail или пароль',
      name: 'email_or_password_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Неверный формат данных`
  String get wrong_data_format {
    return Intl.message(
      'Неверный формат данных',
      name: 'wrong_data_format',
      desc: '',
      args: [],
    );
  }

  /// `Нет прав для выполнения данного действия`
  String get not_enough_rights {
    return Intl.message(
      'Нет прав для выполнения данного действия',
      name: 'not_enough_rights',
      desc: '',
      args: [],
    );
  }

  /// `Принять и закрыть`
  String get accept_and_close {
    return Intl.message(
      'Принять и закрыть',
      name: 'accept_and_close',
      desc: '',
      args: [],
    );
  }

  /// `Данный метод отсутствует`
  String get method_not_found {
    return Intl.message(
      'Данный метод отсутствует',
      name: 'method_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка сервера`
  String get server_error {
    return Intl.message(
      'Ошибка сервера',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Политика конфиденциальности`
  String get politics_short_title {
    return Intl.message(
      'Политика конфиденциальности',
      name: 'politics_short_title',
      desc: '',
      args: [],
    );
  }

  /// `Условия обработки персональных данных`
  String get politics_title {
    return Intl.message(
      'Условия обработки персональных данных',
      name: 'politics_title',
      desc: '',
      args: [],
    );
  }

  /// `Настоящая политика конфиденциальности (далее – «Политика») действует в отношении всей информации, которую Обработчик может получить о Пользователе во время посещения им Сайта. Использование Сайта означает безоговорочное согласие Пользователя с настоящей Политикой и указанными в ней условиями обработки его персональных данных. В случае несогласия с этими условиями, Пользователь должен воздержаться от использования Сайта.\n\nВ Политике используются следующие основные понятия:`
  String get politics_content {
    return Intl.message(
      'Настоящая политика конфиденциальности (далее – «Политика») действует в отношении всей информации, которую Обработчик может получить о Пользователе во время посещения им Сайта. Использование Сайта означает безоговорочное согласие Пользователя с настоящей Политикой и указанными в ней условиями обработки его персональных данных. В случае несогласия с этими условиями, Пользователь должен воздержаться от использования Сайта.\n\nВ Политике используются следующие основные понятия:',
      name: 'politics_content',
      desc: '',
      args: [],
    );
  }

  /// `Оператор`
  String get politics_operator_subtitle {
    return Intl.message(
      'Оператор',
      name: 'politics_operator_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Означает лицо, передавшее Обработчику Персональные данные и поручившее Обработчику обработку переданных Персональных данных, а также определяющее цели обработки Персональных данных, состав Персональных данных, подлежащих обработке, действия (операции), совершаемые с Персональными данными.`
  String get politics_operator_content {
    return Intl.message(
      'Означает лицо, передавшее Обработчику Персональные данные и поручившее Обработчику обработку переданных Персональных данных, а также определяющее цели обработки Персональных данных, состав Персональных данных, подлежащих обработке, действия (операции), совершаемые с Персональными данными.',
      name: 'politics_operator_content',
      desc: '',
      args: [],
    );
  }

  /// `Обработчик`
  String get politics_handler_subtitle {
    return Intl.message(
      'Обработчик',
      name: 'politics_handler_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Означает Общество с ограниченной ответственностью «ФУД СЕРВИС ВОСТОК», ИНН 7725799866 расположенное по адресу: 127287, г. Москва, ул. 2-я Хуторская, д. 38А, корп.15, осуществляющее обработку\nПерсональных данных по поручению Оператора в соответствии с заключенным между ними договором.`
  String get politics_handler_content {
    return Intl.message(
      'Означает Общество с ограниченной ответственностью «ФУД СЕРВИС ВОСТОК», ИНН 7725799866 расположенное по адресу: 127287, г. Москва, ул. 2-я Хуторская, д. 38А, корп.15, осуществляющее обработку\nПерсональных данных по поручению Оператора в соответствии с заключенным между ними договором.',
      name: 'politics_handler_content',
      desc: '',
      args: [],
    );
  }

  /// `1. Общие положения`
  String get politics_general_provisions_title_1 {
    return Intl.message(
      '1. Общие положения',
      name: 'politics_general_provisions_title_1',
      desc: '',
      args: [],
    );
  }

  /// `1.1. Настоящая Политика определяет политику Обработчика в отношении обработки Персональных данных Пользователей Сайта, обрабатываемых по поручению Оператора, а также содержит сведения о реализуемых Обработчиком требованиях к защите Персональных данных Пользователей Сайта.`
  String get politics_general_provisions_content_1_1 {
    return Intl.message(
      '1.1. Настоящая Политика определяет политику Обработчика в отношении обработки Персональных данных Пользователей Сайта, обрабатываемых по поручению Оператора, а также содержит сведения о реализуемых Обработчиком требованиях к защите Персональных данных Пользователей Сайта.',
      name: 'politics_general_provisions_content_1_1',
      desc: '',
      args: [],
    );
  }

  /// `1.2. В целях, указанных в пунктах 2.1 Политики, Обработчик по поручению Оператора также обрабатывает данные, не являющиеся Персональными данными:`
  String get politics_general_provisions_content_1_2 {
    return Intl.message(
      '1.2. В целях, указанных в пунктах 2.1 Политики, Обработчик по поручению Оператора также обрабатывает данные, не являющиеся Персональными данными:',
      name: 'politics_general_provisions_content_1_2',
      desc: '',
      args: [],
    );
  }

  /// `2. Персональные данные, которые собирает и обрабатывает оператор.\n\nЦели обработки персональных данных.`
  String get politics_operator_provisions_title_2 {
    return Intl.message(
      '2. Персональные данные, которые собирает и обрабатывает оператор.\n\nЦели обработки персональных данных.',
      name: 'politics_operator_provisions_title_2',
      desc: '',
      args: [],
    );
  }

  /// `2.1. Настоящая Политика определяет политику Обработчика в отношении обработки Персональных данных Пользователей Сайта, обрабатываемых по поручению Оператора, а также содержит сведения о реализуемых Обработчиком требованиях к защите Персональных данных Пользователей Сайта.`
  String get politics_purposes_processing_data_content_2_1 {
    return Intl.message(
      '2.1. Настоящая Политика определяет политику Обработчика в отношении обработки Персональных данных Пользователей Сайта, обрабатываемых по поручению Оператора, а также содержит сведения о реализуемых Обработчиком требованиях к защите Персональных данных Пользователей Сайта.',
      name: 'politics_purposes_processing_data_content_2_1',
      desc: '',
      args: [],
    );
  }

  /// `2.2. Настоящая Политика публикуется Обработчиком во исполнение норм действующего законодательства Российской Федерации, в том числе статьи 18.1 Закона`
  String get politics_purposes_processing_data_content_2_2 {
    return Intl.message(
      '2.2. Настоящая Политика публикуется Обработчиком во исполнение норм действующего законодательства Российской Федерации, в том числе статьи 18.1 Закона',
      name: 'politics_purposes_processing_data_content_2_2',
      desc: '',
      args: [],
    );
  }

  /// `стандартные технические и иные данные, автоматически получаемые Обработчиком при доступе Пользователя к Сайту и последующих действиях Пользователя, на Сайте (месторасположение в определенный момент времени, IP-адрес, вид операционной системы устройства Пользователя, разделы Сайта, посещаемые Пользователем).`
  String get politics_purposes_processing_data_content_2_2_item_1 {
    return Intl.message(
      'стандартные технические и иные данные, автоматически получаемые Обработчиком при доступе Пользователя к Сайту и последующих действиях Пользователя, на Сайте (месторасположение в определенный момент времени, IP-адрес, вид операционной системы устройства Пользователя, разделы Сайта, посещаемые Пользователем).',
      name: 'politics_purposes_processing_data_content_2_2_item_1',
      desc: '',
      args: [],
    );
  }

  /// `стандартные технические и иные данные, автоматически получаемые Обработчиком при доступе Пользователя к Сайту и последующих действиях Пользователя, на Сайте (месторасположение в определенный момент времени, IP-адрес, вид операционной системы устройства Пользователя, разделы Сайта, посещаемые Пользователем).`
  String get politics_purposes_processing_data_content_2_2_item_2 {
    return Intl.message(
      'стандартные технические и иные данные, автоматически получаемые Обработчиком при доступе Пользователя к Сайту и последующих действиях Пользователя, на Сайте (месторасположение в определенный момент времени, IP-адрес, вид операционной системы устройства Пользователя, разделы Сайта, посещаемые Пользователем).',
      name: 'politics_purposes_processing_data_content_2_2_item_2',
      desc: '',
      args: [],
    );
  }

  /// `3. Контакты`
  String get politics_contacts_title_3 {
    return Intl.message(
      '3. Контакты',
      name: 'politics_contacts_title_3',
      desc: '',
      args: [],
    );
  }

  /// `3.1. Направить соответствующее обращение в рамках реализации прав Пользователя в отношении своих Персональных данных или оставить свои комментарии и предложения относительно условий настоящей Политики можно посредством отправки сообщения на адрес электронной почты cs@foodcards.ru или письма на адрес Обработчика: 127287, г. Москва, ул. 2-я Хуторская, д. 38А, корп.9, офис 107.`
  String get politics_contacts_content_3_1 {
    return Intl.message(
      '3.1. Направить соответствующее обращение в рамках реализации прав Пользователя в отношении своих Персональных данных или оставить свои комментарии и предложения относительно условий настоящей Политики можно посредством отправки сообщения на адрес электронной почты cs@foodcards.ru или письма на адрес Обработчика: 127287, г. Москва, ул. 2-я Хуторская, д. 38А, корп.9, офис 107.',
      name: 'politics_contacts_content_3_1',
      desc: '',
      args: [],
    );
  }

  /// `Рады знакомству,\n`
  String get goal_onboarding_title {
    return Intl.message(
      'Рады знакомству,\n',
      name: 'goal_onboarding_title',
      desc: '',
      args: [],
    );
  }

  /// `\n\n\nРасскажите нам о себе, чтобы получить персонализированные рекомендации и отслеживать прогресс.\n\nПоверьте, это не займет много времени. Начнём?`
  String get goal_onboarding_say_about_you {
    return Intl.message(
      '\n\n\nРасскажите нам о себе, чтобы получить персонализированные рекомендации и отслеживать прогресс.\n\nПоверьте, это не займет много времени. Начнём?',
      name: 'goal_onboarding_say_about_you',
      desc: '',
      args: [],
    );
  }

  /// `Заполнить сейчас`
  String get goal_onboarding_fill_now {
    return Intl.message(
      'Заполнить сейчас',
      name: 'goal_onboarding_fill_now',
      desc: '',
      args: [],
    );
  }

  /// `Заполнить позже`
  String get goal_onboarding_fill_later {
    return Intl.message(
      'Заполнить позже',
      name: 'goal_onboarding_fill_later',
      desc: '',
      args: [],
    );
  }

  /// `Следующий шаг`
  String get personalization_next {
    return Intl.message(
      'Следующий шаг',
      name: 'personalization_next',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Отменить`
  String get to_cancel {
    return Intl.message(
      'Отменить',
      name: 'to_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get done {
    return Intl.message(
      'Готово',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Вес`
  String get weight {
    return Intl.message(
      'Вес',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `г`
  String get g {
    return Intl.message(
      'г',
      name: 'g',
      desc: '',
      args: [],
    );
  }

  /// `кг`
  String get kg {
    return Intl.message(
      'кг',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `ккал`
  String get kkal {
    return Intl.message(
      'ккал',
      name: 'kkal',
      desc: '',
      args: [],
    );
  }

  /// `кК`
  String get kK {
    return Intl.message(
      'кК',
      name: 'kK',
      desc: '',
      args: [],
    );
  }

  /// `Рост`
  String get growth {
    return Intl.message(
      'Рост',
      name: 'growth',
      desc: '',
      args: [],
    );
  }

  /// `см`
  String get sm {
    return Intl.message(
      'см',
      name: 'sm',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Ничего не найдено`
  String get search_empty {
    return Intl.message(
      'Ничего не найдено',
      name: 'search_empty',
      desc: '',
      args: [],
    );
  }

  /// `Пол`
  String get sex {
    return Intl.message(
      'Пол',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `На сутки`
  String get consume_mode_by_day {
    return Intl.message(
      'На сутки',
      name: 'consume_mode_by_day',
      desc: '',
      args: [],
    );
  }

  /// `На приём пищи`
  String get consume_mode_by_meal {
    return Intl.message(
      'На приём пищи',
      name: 'consume_mode_by_meal',
      desc: '',
      args: [],
    );
  }

  /// `Часовой пояс`
  String get timeLine {
    return Intl.message(
      'Часовой пояс',
      name: 'timeLine',
      desc: '',
      args: [],
    );
  }

  /// `Активность`
  String get activity {
    return Intl.message(
      'Активность',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Дата рождения`
  String get dateOfBirs {
    return Intl.message(
      'Дата рождения',
      name: 'dateOfBirs',
      desc: '',
      args: [],
    );
  }

  /// `Выйти из аккаунта`
  String get accountExit {
    return Intl.message(
      'Выйти из аккаунта',
      name: 'accountExit',
      desc: '',
      args: [],
    );
  }

  /// `Мой профиль`
  String get myProfile {
    return Intl.message(
      'Мой профиль',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Ваш никнейм`
  String get yourNickname {
    return Intl.message(
      'Ваш никнейм',
      name: 'yourNickname',
      desc: '',
      args: [],
    );
  }

  /// `Контроль веса`
  String get control_weight {
    return Intl.message(
      'Контроль веса',
      name: 'control_weight',
      desc: '',
      args: [],
    );
  }

  /// `Текущий вес`
  String get current_weight {
    return Intl.message(
      'Текущий вес',
      name: 'current_weight',
      desc: '',
      args: [],
    );
  }

  /// `Желаемый вес`
  String get goal_weight {
    return Intl.message(
      'Желаемый вес',
      name: 'goal_weight',
      desc: '',
      args: [],
    );
  }

  /// `Контроль калорий`
  String get control_calories {
    return Intl.message(
      'Контроль калорий',
      name: 'control_calories',
      desc: '',
      args: [],
    );
  }

  /// `Контроль БЖУ`
  String get control_macronutrition {
    return Intl.message(
      'Контроль БЖУ',
      name: 'control_macronutrition',
      desc: '',
      args: [],
    );
  }

  /// `О приложении`
  String get about_app {
    return Intl.message(
      'О приложении',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Добавить в цель`
  String get add_goal {
    return Intl.message(
      'Добавить в цель',
      name: 'add_goal',
      desc: '',
      args: [],
    );
  }

  /// `Посчитать заново`
  String get calculate_again {
    return Intl.message(
      'Посчитать заново',
      name: 'calculate_again',
      desc: '',
      args: [],
    );
  }

  /// `Ваша суточная\nнорма воды`
  String get your_water_daily_rate {
    return Intl.message(
      'Ваша суточная\nнорма воды',
      name: 'your_water_daily_rate',
      desc: '',
      args: [],
    );
  }

  /// `Ваша норма БЖУ`
  String get your_norma_macronutrition {
    return Intl.message(
      'Ваша норма БЖУ',
      name: 'your_norma_macronutrition',
      desc: '',
      args: [],
    );
  }

  /// `Минимум`
  String get minimum {
    return Intl.message(
      'Минимум',
      name: 'minimum',
      desc: '',
      args: [],
    );
  }

  /// `Максимум`
  String get maximum {
    return Intl.message(
      'Максимум',
      name: 'maximum',
      desc: '',
      args: [],
    );
  }

  /// `Норма калорий`
  String get norma_calories {
    return Intl.message(
      'Норма калорий',
      name: 'norma_calories',
      desc: '',
      args: [],
    );
  }

  /// `Безопасная`
  String get goal_hardlevel_safety {
    return Intl.message(
      'Безопасная',
      name: 'goal_hardlevel_safety',
      desc: '',
      args: [],
    );
  }

  /// `По вашему выбору`
  String get goal_hardlevel_optionality {
    return Intl.message(
      'По вашему выбору',
      name: 'goal_hardlevel_optionality',
      desc: '',
      args: [],
    );
  }

  /// `Экстремальная`
  String get goal_hardlevel_extream {
    return Intl.message(
      'Экстремальная',
      name: 'goal_hardlevel_extream',
      desc: '',
      args: [],
    );
  }

  /// `Цель`
  String get goal {
    return Intl.message(
      'Цель',
      name: 'goal',
      desc: '',
      args: [],
    );
  }

  /// `Калорий`
  String get of_calories {
    return Intl.message(
      'Калорий',
      name: 'of_calories',
      desc: '',
      args: [],
    );
  }

  /// `Белков`
  String get of_protein {
    return Intl.message(
      'Белков',
      name: 'of_protein',
      desc: '',
      args: [],
    );
  }

  /// `Жиров`
  String get of_fat {
    return Intl.message(
      'Жиров',
      name: 'of_fat',
      desc: '',
      args: [],
    );
  }

  /// `Углеводов`
  String get of_carbohydrate {
    return Intl.message(
      'Углеводов',
      name: 'of_carbohydrate',
      desc: '',
      args: [],
    );
  }

  /// `Потребляя`
  String get consuming {
    return Intl.message(
      'Потребляя',
      name: 'consuming',
      desc: '',
      args: [],
    );
  }

  /// `Будете терять`
  String get will_lose {
    return Intl.message(
      'Будете терять',
      name: 'will_lose',
      desc: '',
      args: [],
    );
  }

  /// `Достигнете цели`
  String get reach_goal {
    return Intl.message(
      'Достигнете цели',
      name: 'reach_goal',
      desc: '',
      args: [],
    );
  }

  /// `Энергетическая ценность`
  String get energy_value {
    return Intl.message(
      'Энергетическая ценность',
      name: 'energy_value',
      desc: '',
      args: [],
    );
  }

  /// `ккал белков`
  String get kkal_protain {
    return Intl.message(
      'ккал белков',
      name: 'kkal_protain',
      desc: '',
      args: [],
    );
  }

  /// `ккал жиров`
  String get kkal_fat {
    return Intl.message(
      'ккал жиров',
      name: 'kkal_fat',
      desc: '',
      args: [],
    );
  }

  /// `ккал углеводов`
  String get kkal_carbohyd {
    return Intl.message(
      'ккал углеводов',
      name: 'kkal_carbohyd',
      desc: '',
      args: [],
    );
  }

  /// `Вариант {index}`
  String variant_index(Object index) {
    return Intl.message(
      'Вариант $index',
      name: 'variant_index',
      desc: '',
      args: [index],
    );
  }

  /// `{value} литров`
  String measure_liters(Object value) {
    return Intl.message(
      '$value литров',
      name: 'measure_liters',
      desc: '',
      args: [value],
    );
  }

  /// `{value} л`
  String measure_liters_short(Object value) {
    return Intl.message(
      '$value л',
      name: 'measure_liters_short',
      desc: '',
      args: [value],
    );
  }

  /// `{value} миллилитров`
  String measure_milliliters(Object value) {
    return Intl.message(
      '$value миллилитров',
      name: 'measure_milliliters',
      desc: '',
      args: [value],
    );
  }

  /// `{value} мл`
  String measure_milliliters_short(Object value) {
    return Intl.message(
      '$value мл',
      name: 'measure_milliliters_short',
      desc: '',
      args: [value],
    );
  }

  /// `{value} килограмм`
  String measure_kilogram(Object value) {
    return Intl.message(
      '$value килограмм',
      name: 'measure_kilogram',
      desc: '',
      args: [value],
    );
  }

  /// `{value} кг`
  String measure_kilogram_short(Object value) {
    return Intl.message(
      '$value кг',
      name: 'measure_kilogram_short',
      desc: '',
      args: [value],
    );
  }

  /// `{value} рамм`
  String measure_gram(Object value) {
    return Intl.message(
      '$value рамм',
      name: 'measure_gram',
      desc: '',
      args: [value],
    );
  }

  /// `{value} г`
  String measure_gram_short(Object value) {
    return Intl.message(
      '$value г',
      name: 'measure_gram_short',
      desc: '',
      args: [value],
    );
  }

  /// `{value} ккал / день`
  String measure_kkal_per_day(Object value) {
    return Intl.message(
      '$value ккал / день',
      name: 'measure_kkal_per_day',
      desc: '',
      args: [value],
    );
  }

  /// `{value} г / неделю`
  String measure_gram_per_week(Object value) {
    return Intl.message(
      '$value г / неделю',
      name: 'measure_gram_per_week',
      desc: '',
      args: [value],
    );
  }

  /// `{value} см`
  String measure_girth(Object value) {
    return Intl.message(
      '$value см',
      name: 'measure_girth',
      desc: '',
      args: [value],
    );
  }

  /// `{howMany, plural, one{за {howMany} день} few{за {howMany} дня} other{за {howMany} дней}}`
  String by_count_days(num howMany) {
    return Intl.plural(
      howMany,
      one: 'за $howMany день',
      few: 'за $howMany дня',
      other: 'за $howMany дней',
      name: 'by_count_days',
      desc: '',
      args: [howMany],
    );
  }

  /// `{howMany, plural, one{1 стакан на {volume}} few{{howMany} стакана по {volume}} other{{howMany} стаканов по {volume}}}`
  String glasses_count_by_volume(num howMany, Object volume) {
    return Intl.plural(
      howMany,
      one: '1 стакан на $volume',
      few: '$howMany стакана по $volume',
      other: '$howMany стаканов по $volume',
      name: 'glasses_count_by_volume',
      desc: '',
      args: [howMany, volume],
    );
  }

  /// `{howMany, plural, one{1 бутылка на {volume}} few{{howMany} бутылки по {volume}} other{{howMany} бутылок по {volume}}}`
  String bottles_count_by_volume(num howMany, Object volume) {
    return Intl.plural(
      howMany,
      one: '1 бутылка на $volume',
      few: '$howMany бутылки по $volume',
      other: '$howMany бутылок по $volume',
      name: 'bottles_count_by_volume',
      desc: '',
      args: [howMany, volume],
    );
  }

  /// `Обхват запястья`
  String get wrist {
    return Intl.message(
      'Обхват запястья',
      name: 'wrist',
      desc: '',
      args: [],
    );
  }

  /// `Обхват груди`
  String get chest {
    return Intl.message(
      'Обхват груди',
      name: 'chest',
      desc: '',
      args: [],
    );
  }

  /// `Ваш пол`
  String get your_sex {
    return Intl.message(
      'Ваш пол',
      name: 'your_sex',
      desc: '',
      args: [],
    );
  }

  /// `Съедаю в день`
  String get eat_per_day {
    return Intl.message(
      'Съедаю в день',
      name: 'eat_per_day',
      desc: '',
      args: [],
    );
  }

  /// `Калькулятор\nпотребления воды`
  String get calculator_water_consume {
    return Intl.message(
      'Калькулятор\nпотребления воды',
      name: 'calculator_water_consume',
      desc: '',
      args: [],
    );
  }

  /// `Не указано`
  String get not_indicated {
    return Intl.message(
      'Не указано',
      name: 'not_indicated',
      desc: '',
      args: [],
    );
  }

  /// `Поле не должно быть пустым!`
  String get required_not_empty_field {
    return Intl.message(
      'Поле не должно быть пустым!',
      name: 'required_not_empty_field',
      desc: '',
      args: [],
    );
  }

  /// `Доля введена некооректно!`
  String get inputed_fraction_not_correct {
    return Intl.message(
      'Доля введена некооректно!',
      name: 'inputed_fraction_not_correct',
      desc: '',
      args: [],
    );
  }

  /// `понедельник`
  String get monday {
    return Intl.message(
      'понедельник',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `вторник`
  String get tuesday {
    return Intl.message(
      'вторник',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `среда`
  String get wednesday {
    return Intl.message(
      'среда',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `четверг`
  String get thursday {
    return Intl.message(
      'четверг',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `пятница`
  String get friday {
    return Intl.message(
      'пятница',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `суббота`
  String get saturday {
    return Intl.message(
      'суббота',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `воскресенье`
  String get sunday {
    return Intl.message(
      'воскресенье',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Ред.`
  String get edit_shortly {
    return Intl.message(
      'Ред.',
      name: 'edit_shortly',
      desc: '',
      args: [],
    );
  }

  /// `Добавить замер`
  String get add_measurement {
    return Intl.message(
      'Добавить замер',
      name: 'add_measurement',
      desc: '',
      args: [],
    );
  }

  /// `За месяц`
  String get chart_period_month {
    return Intl.message(
      'За месяц',
      name: 'chart_period_month',
      desc: '',
      args: [],
    );
  }

  /// `За неделю`
  String get chart_period_week {
    return Intl.message(
      'За неделю',
      name: 'chart_period_week',
      desc: '',
      args: [],
    );
  }

  /// `Всё время`
  String get chart_period_all {
    return Intl.message(
      'Всё время',
      name: 'chart_period_all',
      desc: '',
      args: [],
    );
  }

  /// `Цель выполнена на`
  String get goal_met_by {
    return Intl.message(
      'Цель выполнена на',
      name: 'goal_met_by',
      desc: '',
      args: [],
    );
  }

  /// `Осталось до цели`
  String get remaining_to_goal {
    return Intl.message(
      'Осталось до цели',
      name: 'remaining_to_goal',
      desc: '',
      args: [],
    );
  }

  /// `Отклонение`
  String get deviation {
    return Intl.message(
      'Отклонение',
      name: 'deviation',
      desc: '',
      args: [],
    );
  }

  /// `Дата достижения`
  String get achievement_date {
    return Intl.message(
      'Дата достижения',
      name: 'achievement_date',
      desc: '',
      args: [],
    );
  }

  /// `История изменений`
  String get changes_history {
    return Intl.message(
      'История изменений',
      name: 'changes_history',
      desc: '',
      args: [],
    );
  }

  /// `Старт`
  String get start {
    return Intl.message(
      'Старт',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Замеры позволяют отслеживать выбранные показатели и их прогресс.`
  String get measurements_screen_description {
    return Intl.message(
      'Замеры позволяют отслеживать выбранные показатели и их прогресс.',
      name: 'measurements_screen_description',
      desc: '',
      args: [],
    );
  }

  /// `Выберите нужные вам категории замеров.`
  String get choose_measurements_categories {
    return Intl.message(
      'Выберите нужные вам категории замеров.',
      name: 'choose_measurements_categories',
      desc: '',
      args: [],
    );
  }

  /// `Вы всегда сможете их дополнить или удалить ненужные.`
  String get you_can_change_measurements {
    return Intl.message(
      'Вы всегда сможете их дополнить или удалить ненужные.',
      name: 'you_can_change_measurements',
      desc: '',
      args: [],
    );
  }

  /// `Процент жира`
  String get fat_percent {
    return Intl.message(
      'Процент жира',
      name: 'fat_percent',
      desc: '',
      args: [],
    );
  }

  /// `Обхват шеи`
  String get girth_neck {
    return Intl.message(
      'Обхват шеи',
      name: 'girth_neck',
      desc: '',
      args: [],
    );
  }

  /// `Обхват груди`
  String get girth_chest {
    return Intl.message(
      'Обхват груди',
      name: 'girth_chest',
      desc: '',
      args: [],
    );
  }

  /// `Обхват под грудью`
  String get girth_under_chest {
    return Intl.message(
      'Обхват под грудью',
      name: 'girth_under_chest',
      desc: '',
      args: [],
    );
  }

  /// `Обхват талии`
  String get girth_waist {
    return Intl.message(
      'Обхват талии',
      name: 'girth_waist',
      desc: '',
      args: [],
    );
  }

  /// `Обхват живота`
  String get girth_stomach {
    return Intl.message(
      'Обхват живота',
      name: 'girth_stomach',
      desc: '',
      args: [],
    );
  }

  /// `Обхват бицепса`
  String get girth_biceps {
    return Intl.message(
      'Обхват бицепса',
      name: 'girth_biceps',
      desc: '',
      args: [],
    );
  }

  /// `Обхват предплечья`
  String get girth_forearm {
    return Intl.message(
      'Обхват предплечья',
      name: 'girth_forearm',
      desc: '',
      args: [],
    );
  }

  /// `Обхват запястья`
  String get girth_wrist {
    return Intl.message(
      'Обхват запястья',
      name: 'girth_wrist',
      desc: '',
      args: [],
    );
  }

  /// `Обхват бёдер`
  String get girth_hips {
    return Intl.message(
      'Обхват бёдер',
      name: 'girth_hips',
      desc: '',
      args: [],
    );
  }

  /// `Обхват бедра`
  String get girth_thigh {
    return Intl.message(
      'Обхват бедра',
      name: 'girth_thigh',
      desc: '',
      args: [],
    );
  }

  /// `Обхват над коленом`
  String get girth_upper_knee {
    return Intl.message(
      'Обхват над коленом',
      name: 'girth_upper_knee',
      desc: '',
      args: [],
    );
  }

  /// `Обхват голени`
  String get girth_calf {
    return Intl.message(
      'Обхват голени',
      name: 'girth_calf',
      desc: '',
      args: [],
    );
  }

  /// `Обхват щиколотки`
  String get girth_ankle {
    return Intl.message(
      'Обхват щиколотки',
      name: 'girth_ankle',
      desc: '',
      args: [],
    );
  }

  /// `Замеры`
  String get measurements {
    return Intl.message(
      'Замеры',
      name: 'measurements',
      desc: '',
      args: [],
    );
  }

  /// `Процент жира`
  String get percent_of_fat {
    return Intl.message(
      'Процент жира',
      name: 'percent_of_fat',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Добавить категорию замеров`
  String get add_measurement_category {
    return Intl.message(
      'Добавить категорию замеров',
      name: 'add_measurement_category',
      desc: '',
      args: [],
    );
  }

  /// `Прогноз`
  String get prediction {
    return Intl.message(
      'Прогноз',
      name: 'prediction',
      desc: '',
      args: [],
    );
  }

  /// `Последний замер`
  String get last_measurement {
    return Intl.message(
      'Последний замер',
      name: 'last_measurement',
      desc: '',
      args: [],
    );
  }

  /// `Добавить запись`
  String get add_record {
    return Intl.message(
      'Добавить запись',
      name: 'add_record',
      desc: '',
      args: [],
    );
  }

  /// `Прогноз`
  String get plan_weight {
    return Intl.message(
      'Прогноз',
      name: 'plan_weight',
      desc: '',
      args: [],
    );
  }

  /// `Дата замера`
  String get date_of_measurement {
    return Intl.message(
      'Дата замера',
      name: 'date_of_measurement',
      desc: '',
      args: [],
    );
  }

  /// `Дневник упражнений`
  String get exercise_diary {
    return Intl.message(
      'Дневник упражнений',
      name: 'exercise_diary',
      desc: '',
      args: [],
    );
  }

  /// `Употреблено ккал за день:`
  String get today_eat {
    return Intl.message(
      'Употреблено ккал за день:',
      name: 'today_eat',
      desc: '',
      args: [],
    );
  }

  /// `Сожженно ккал за сегодня:`
  String get today_burn {
    return Intl.message(
      'Сожженно ккал за сегодня:',
      name: 'today_burn',
      desc: '',
      args: [],
    );
  }

  /// `Итого за день:`
  String get today_ex {
    return Intl.message(
      'Итого за день:',
      name: 'today_ex',
      desc: '',
      args: [],
    );
  }

  /// `Дневник питания`
  String get food_diary {
    return Intl.message(
      'Дневник питания',
      name: 'food_diary',
      desc: '',
      args: [],
    );
  }

  /// `План на сегодня`
  String get plan_daily {
    return Intl.message(
      'План на сегодня',
      name: 'plan_daily',
      desc: '',
      args: [],
    );
  }

  /// `Итого за сегодня`
  String get total_daily {
    return Intl.message(
      'Итого за сегодня',
      name: 'total_daily',
      desc: '',
      args: [],
    );
  }

  /// `К`
  String get kalories_character {
    return Intl.message(
      'К',
      name: 'kalories_character',
      desc: '',
      args: [],
    );
  }

  /// `Б`
  String get proteins_character {
    return Intl.message(
      'Б',
      name: 'proteins_character',
      desc: '',
      args: [],
    );
  }

  /// `Ж`
  String get fat_character {
    return Intl.message(
      'Ж',
      name: 'fat_character',
      desc: '',
      args: [],
    );
  }

  /// `У`
  String get carbo_character {
    return Intl.message(
      'У',
      name: 'carbo_character',
      desc: '',
      args: [],
    );
  }

  /// `План`
  String get plan {
    return Intl.message(
      'План',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Факт`
  String get fact {
    return Intl.message(
      'Факт',
      name: 'fact',
      desc: '',
      args: [],
    );
  }

  /// `За этот день Вы ещё не заполняли свой дневник питания.`
  String get day_diary_is_empty {
    return Intl.message(
      'За этот день Вы ещё не заполняли свой дневник питания.',
      name: 'day_diary_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `За этот день Вы ещё не заполняли свой дневник упражнений.`
  String get day_exercise_diary_is_empty {
    return Intl.message(
      'За этот день Вы ещё не заполняли свой дневник упражнений.',
      name: 'day_exercise_diary_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Ваша тренировка`
  String get exercise_diary_adding_title {
    return Intl.message(
      'Ваша тренировка',
      name: 'exercise_diary_adding_title',
      desc: '',
      args: [],
    );
  }

  /// `Дата`
  String get date {
    return Intl.message(
      'Дата',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Время`
  String get time {
    return Intl.message(
      'Время',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Добавить упражнения`
  String get add_exercise {
    return Intl.message(
      'Добавить упражнения',
      name: 'add_exercise',
      desc: '',
      args: [],
    );
  }

  /// `Настройки замеров`
  String get settings_measurements {
    return Intl.message(
      'Настройки замеров',
      name: 'settings_measurements',
      desc: '',
      args: [],
    );
  }

  /// `Новый приём пищи`
  String get new_meal {
    return Intl.message(
      'Новый приём пищи',
      name: 'new_meal',
      desc: '',
      args: [],
    );
  }

  /// `Приём пищи`
  String get meal {
    return Intl.message(
      'Приём пищи',
      name: 'meal',
      desc: '',
      args: [],
    );
  }

  /// `Добавить продукты`
  String get add_products {
    return Intl.message(
      'Добавить продукты',
      name: 'add_products',
      desc: '',
      args: [],
    );
  }

  /// `Добавить продукт`
  String get add_product {
    return Intl.message(
      'Добавить продукт',
      name: 'add_product',
      desc: '',
      args: [],
    );
  }

  /// `Добавить упражнения`
  String get add_exercises {
    return Intl.message(
      'Добавить упражнения',
      name: 'add_exercises',
      desc: '',
      args: [],
    );
  }

  /// `Завтрак`
  String get breakfast {
    return Intl.message(
      'Завтрак',
      name: 'breakfast',
      desc: '',
      args: [],
    );
  }

  /// `2-й Завтрак`
  String get second_breakfast {
    return Intl.message(
      '2-й Завтрак',
      name: 'second_breakfast',
      desc: '',
      args: [],
    );
  }

  /// `Обед`
  String get dinner {
    return Intl.message(
      'Обед',
      name: 'dinner',
      desc: '',
      args: [],
    );
  }

  /// `Полдник`
  String get afternoon_snack {
    return Intl.message(
      'Полдник',
      name: 'afternoon_snack',
      desc: '',
      args: [],
    );
  }

  /// `Ужин`
  String get supper {
    return Intl.message(
      'Ужин',
      name: 'supper',
      desc: '',
      args: [],
    );
  }

  /// `2-й Ужин`
  String get second_supper {
    return Intl.message(
      '2-й Ужин',
      name: 'second_supper',
      desc: '',
      args: [],
    );
  }

  /// `Перекус`
  String get snack {
    return Intl.message(
      'Перекус',
      name: 'snack',
      desc: '',
      args: [],
    );
  }

  /// `2-й Перекус`
  String get snack2 {
    return Intl.message(
      '2-й Перекус',
      name: 'snack2',
      desc: '',
      args: [],
    );
  }

  /// `3-й Перекус`
  String get snack3 {
    return Intl.message(
      '3-й Перекус',
      name: 'snack3',
      desc: '',
      args: [],
    );
  }

  /// `4-й Перекус`
  String get snack4 {
    return Intl.message(
      '4-й Перекус',
      name: 'snack4',
      desc: '',
      args: [],
    );
  }

  /// `5-й Перекус`
  String get snack5 {
    return Intl.message(
      '5-й Перекус',
      name: 'snack5',
      desc: '',
      args: [],
    );
  }

  /// `Вы недавно добавляли`
  String get last_adding {
    return Intl.message(
      'Вы недавно добавляли',
      name: 'last_adding',
      desc: '',
      args: [],
    );
  }

  /// `Начните вводить название\nпродукта или блюда.`
  String get start_fill_product_name {
    return Intl.message(
      'Начните вводить название\nпродукта или блюда.',
      name: 'start_fill_product_name',
      desc: '',
      args: [],
    );
  }

  /// `Продуктов и блюд по Вашему\nзапросу не найдено.`
  String get products_not_found {
    return Intl.message(
      'Продуктов и блюд по Вашему\nзапросу не найдено.',
      name: 'products_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Начните вводить название\nупражнения.`
  String get start_fill_exercise_name {
    return Intl.message(
      'Начните вводить название\nупражнения.',
      name: 'start_fill_exercise_name',
      desc: '',
      args: [],
    );
  }

  /// `Упражнений по Вашему\nзапросу не найдено.`
  String get exercises_not_found {
    return Intl.message(
      'Упражнений по Вашему\nзапросу не найдено.',
      name: 'exercises_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Порция`
  String get portion {
    return Intl.message(
      'Порция',
      name: 'portion',
      desc: '',
      args: [],
    );
  }

  /// `Удалить продукт`
  String get delete_product {
    return Intl.message(
      'Удалить продукт',
      name: 'delete_product',
      desc: '',
      args: [],
    );
  }

  /// `Удалить упражнение`
  String get delete_exercise {
    return Intl.message(
      'Удалить упражнение',
      name: 'delete_exercise',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
