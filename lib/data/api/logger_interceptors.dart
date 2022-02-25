import 'dart:async';

import 'package:notfiguured/app/logger.dart';
import 'package:logger/logger.dart';
import 'package:chopper/chopper.dart';

class LoggerInterceptor implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final String headers =
        request.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
    logger.i('-> ${request.method} ${request.url}\n$headers');
    silentLogger.i(request.body);
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    final base = response.base.request;
    final String headers =
        base.headers.entries.map((e) => '<- ${e.key}: ${e.value}').join('\n');
    Level level = Level.info;
    if (response.statusCode >= 500) level = Level.debug;
    if (response.statusCode >= 400) level = Level.error;
    if (response.statusCode > 300) level = Level.warning;
    silentLogger.log(
        level, '<- ${response.statusCode} ${base.method} ${base.url}\n$headers');
    silentLogger.log(level, response.bodyString);
    silentLogger.log(level, '<- END ${base.method}');
    return response;
  }
}
