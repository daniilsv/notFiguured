import 'package:chopper/chopper.dart';

const _unknown = "Неизвестная ошибка";
const _badRequest = "Ошибка запроса";
const _badErrorStatus = "Не корректный код ответа";
const _emailAlreadyRegistered = "Такой адрес электронной почты уже зарегистрирован";

enum ExceptionsType {
  badErrorStatus,
  badRequest,
  emailAlreadyRegistered,
  unknown,
}

extension ErrorMessage on ExceptionsType {
  String get message {
    switch (this) {
      case ExceptionsType.badErrorStatus:
        return _badErrorStatus;
      case ExceptionsType.badRequest:
        return _badRequest;
      case ExceptionsType.emailAlreadyRegistered:
        return _emailAlreadyRegistered;
      case ExceptionsType.unknown:
        return _unknown;
    }
    return null;
  }
}

class AppException implements Exception {
  final ExceptionsType type;

  const AppException(this.type);
}

class BadRequestException extends AppException {
  final Response response;
  const BadRequestException(this.response) : super(ExceptionsType.badRequest);
}
