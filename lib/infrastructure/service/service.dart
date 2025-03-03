import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:depin/depin.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/interceptor.dart';
import 'package:flutter_sample_architecture/infrastructure/service/themoviedb/service.dart';

class ServiceInjectionGroup extends InjectionGroup {
  @override
  List<Injector> get injections {
    return [
      Injector<Dio>(inject: () {
        return Dio(
          BaseOptions(connectTimeout: const Duration(seconds: 10)),
        );
      }),
      Injector<TheMovieDBService>(inject: () {
        final dio = Inject.instance<Dio>();
        final theMovieInterceptor = TheMovieDBInterceptor();
        final curlInterceptor = CurlLoggerDioInterceptor();

        dio.interceptors.addAll([
          theMovieInterceptor,
          curlInterceptor,
        ]);

        return TheMovieDBService(
          dio,
          baseUrl: 'https://api.themoviedb.org',
        );
      }),
    ];
  }
}
