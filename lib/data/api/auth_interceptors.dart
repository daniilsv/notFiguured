import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:get_storage/get_storage.dart';

class AuthInterceptor implements RequestInterceptor {
  AuthInterceptor(this.accessToken);
  final ReadWriteValue<TokenResource> accessToken;
  @override
  FutureOr<Request> onRequest(Request request) {
    if (accessToken.val?.token?.isEmpty ?? true) return request;
    return request.copyWith(headers: {
      ...request.headers,
      'Authorization': 'Bearer ${accessToken.val.token}'
    });
  }
}
