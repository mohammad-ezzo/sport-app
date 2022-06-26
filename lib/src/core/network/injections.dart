import 'package:dio/dio.dart';

import '../../service_locator.dart';
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
