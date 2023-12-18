import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //Добавляем token в headers при необходимости
    const String token = 'xxx.xxxxxx';
    options.headers['Authorization'] = 'Bearer $token';

    return handler.next(options);
  }
}
