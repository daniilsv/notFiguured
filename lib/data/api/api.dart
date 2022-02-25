import 'dart:io';

import 'package:notfiguured/data/repository/auth_repository.dart';
import 'package:notfiguured/env.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:chopper_api/api/client_mapping.dart';
import 'package:http/io_client.dart' as iohttp;

import 'auth_interceptors.dart';
import 'converter.dart';
import 'logger_interceptors.dart';

class Api {
  Api(AuthRepository _authRepository) {
    final httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final ioClient = iohttp.IOClient(httpClient);

    final client = ChopperClient(
      baseUrl: Env.apiUrlShort,
      client: ioClient,
      converter: CommonJsonSerializableConverter(),
      interceptors: [
        AuthInterceptor(_authRepository.accessToken),
        LoggerInterceptor(),
      ],
    );
    api = SwaggerApi.create(client);
  }

  SwaggerApi api;

  static final commonJsonDecoder = CommonJsonDecoder(generatedMapping);
}
