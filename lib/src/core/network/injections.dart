import 'package:dio/dio.dart';
import 'package:sport_app/src/core/network/secrets.dart';

import '../../injections.dart';
import '../app_constants.dart';
import '../logger/app_logger.dart';
import 'logger_interceptor.dart';

injectNetwork() async {
  locator.registerSingletonAsync<Dio>(() async {
    final dio = Dio(BaseOptions(
        baseUrl: AppConstants.apiUrl,
        validateStatus: (s) {
          return s! < 204;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "charset": "utf-8",
          "Accept-Charset": "utf-8",
        },
        responseType: ResponseType.json));
    //add api key for every request header
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.putIfAbsent('x-rapidapi-key', () => sportApiKey);
        return handler.next(options);
      },
    ));
    dio.interceptors.add(LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    ));

    return dio;
  });
  await locator.isReady<Dio>();
}
