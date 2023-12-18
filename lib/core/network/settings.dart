import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:silktech_users/core/network/authorization_interceptor.dart';

Dio apiDioFactory() {
  final dio = Dio();

  dio.interceptors.addAll([
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
    AuthorizationInterceptor(),
  ]);

  dio.options.baseUrl = 'https://reqres.in/api';

  return dio;
}
