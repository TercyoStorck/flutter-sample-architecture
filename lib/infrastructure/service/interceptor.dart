import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

abstract class CustomInterceptor extends QueuedInterceptorsWrapper {
  final Dio dio;

  CustomInterceptor({
    required this.dio,
  });

  static Completer<void>? _connectionLockCompleter;
  static int _requestCount = 0;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _requestCount++;
    handler.next(options);
    
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _connectionLockDispose();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      late final String refreshedAccessToken;
      await _connectionLockCompleter?.future;

      if (_connectionLockCompleter?.isCompleted != true) {
        try {
          _lock();
          refreshedAccessToken = await this.refreshToken(err.requestOptions);
        } on DioException catch (e) {
          if (e.response?.statusCode == 401) {
            if (refreshedAccessToken.isNotEmpty) {
              this.unauthorized();
            }
          }

          _connectionLockDispose();
          return handler.next(err);
        } on Exception catch (_) {
          _connectionLockDispose();
          return handler.next(err);
        } finally {
          _unlock();
        }
      }

      try {
        final response = await _resendRequest(refreshedAccessToken, err.requestOptions);

        _connectionLockDispose();

        return handler.resolve(response);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          if (refreshedAccessToken.isNotEmpty) {
            this.unauthorized();
          }
        }
      } on Exception catch (_) {}
    }

    _connectionLockDispose();
    handler.next(err);
  }

  void _lock() {
    _connectionLockCompleter = Completer<void>();
  }

  void _unlock() {
    _connectionLockCompleter?.complete();
  }

  void _connectionLockDispose() {
    if (_requestCount > 0) {
      _requestCount--;
    }

    if (_requestCount <= 0) {
      _connectionLockCompleter = null;
    }
  }

  Future<Response<T>> _resendRequest<T>(
    String accessToken,
    RequestOptions requestOptions,
  ) async {
    if (requestOptions.data is FormData) {
      final formData = FormData();
      formData.fields.addAll(requestOptions.data.fields);
      formData.files.addAll(requestOptions.data.files);
      requestOptions.data = formData;
    }

    requestOptions.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";

    return await dio.fetch(
      Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
        extra: requestOptions.extra,
        contentType: requestOptions.contentType,
      )
          .compose(
            dio.options,
            requestOptions.path,
            queryParameters: requestOptions.queryParameters,
            data: requestOptions.data,
          )
          .copyWith(
            baseUrl: requestOptions.baseUrl,
          ),
    );
  }

  /// request new access token
  Future<String> refreshToken(RequestOptions requestOptions);
  void unauthorized();
}
