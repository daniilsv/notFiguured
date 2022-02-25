import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  final accessToken = ReadWriteValue<TokenResource>(
    'accessToken',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : TokenResource.fromJson(json),
  );
  final refreshToken = ReadWriteValue<TokenResource>(
    'refreshToken',
    null,
    encoder: (model) => model?.toJson(),
    decoder: (json) => json == null ? null : TokenResource.fromJson(json),
  );
}
