import 'package:depin/depin.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample_architecture/infrastructure/service/interceptor.dart';

class TheMovieDBInterceptor extends CustomInterceptor {
  TheMovieDBInterceptor() : super(dio: Inject.instance<Dio>());

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType ??= Headers.jsonContentType;

    /* if (accessToken?.isNotEmpty == true) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: "Bearer $accessToken",
      });
    } */

    super.onRequest(options, handler);
  }

  @override
  Future<String> refreshToken(RequestOptions requestOptions) {
    throw UnimplementedError();
  }

  @override
  void unauthorized() {}
}
