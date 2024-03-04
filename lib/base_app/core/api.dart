import 'dart:convert';
import 'dart:developer';

import 'package:smartpay/base_app/config/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'abstractions/build_config.dart';

class Api {
  late Dio dio;

  Api() {
    dio = Dio(BaseOptions(
      baseUrl: Env.getConfig.baseUrl,
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
    ));

    dio.interceptors.addAll({
      AppInterceptors(buildConfig: Env.getConfig, dio: dio),
    });
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  final BuildConfig buildConfig;

  AppInterceptors({required this.dio, required this.buildConfig});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    dio.options.baseUrl = buildConfig.baseUrl;

    if (kDebugMode) {
      log(err.requestOptions.uri.toString(), name: 'URI');
      log(err.requestOptions.headers.toString(), name: 'HEADERS');
      log(err.requestOptions.headers['Content-Type'], name: 'CONTENT TYPE');
      if (err.requestOptions.headers['Content-Type'] == 'application/json') {
        log(jsonEncode(err.requestOptions.data), name: 'POST DATA');
        log(jsonEncode(err.response?.data),
            name: '${err.requestOptions.method} REQUEST');
      }
      log(err.response?.statusCode.toString() ?? "NO-STATUS CODE",
          name: "STATUS CODE");
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw ConnectTimeoutException(err.requestOptions);
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(res: err.response, r: err.requestOptions);
          case 401:
            throw UnauthorizedException(
                res: err.response, r: err.requestOptions);
          case 404:
            throw NotFoundException(res: err.response, r: err.requestOptions);
          case 409:
            throw ConflictException(res: err.response, r: err.requestOptions);

          case 500:
            throw InternalServerErrorException(
                res: err.response, r: err.requestOptions);
          default:
            throw UnknownException(res: err.response, r: err.requestOptions);
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown || DioExceptionType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
      return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log(response.requestOptions.uri.toString(), name: 'URI');
    log(response.requestOptions.headers.toString(), name: 'HEADERS');
    log(response.requestOptions.headers['Content-Type'], name: 'CONTENT TYPE');
    if (response.requestOptions.headers['Content-Type'] == 'application/json') {
      log(jsonEncode(response.requestOptions.data),
          name: '${response.requestOptions.method} REQUEST');
      log(jsonEncode(response.data), name: 'RESPONSE DATA');
    }
    dio.options.baseUrl = buildConfig.baseUrl;
    handler.next(response);
  }
}

class BadRequestException extends DioException {
  Response? res;
  BadRequestException({this.res, required RequestOptions r})
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    return res?.data['message'] ?? 'Something went wrong.\nPlease try again.';
  }
}

class ConflictException extends DioException {
  Response? res;
  ConflictException({this.res, required RequestOptions r})
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    return res?.data['message'] ?? 'Something went wrong.\nPlease try again.';
  }
}

class ConnectTimeoutException extends DioException {
  ConnectTimeoutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Connection timeout';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out.\nplease try again.';
  }
}

class InternalServerErrorException extends DioException {
  Response? res;
  InternalServerErrorException({this.res, required RequestOptions r})
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    return res?.data['message'] ?? 'Something went wrong.\nPlease try again.';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection to the internet has been lost.\nPlease try again';
  }
}

class NotFoundException extends DioException {
  Response? res;
  NotFoundException({this.res, required RequestOptions r})
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    return res?.data['message'] ?? 'Something went wrong.\nPlease try again.';
  }
}

class RequestEntityTooLargeException extends DioException {
  RequestEntityTooLargeException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Request too large';
  }
}

class UnauthorizedException extends DioException {
  Response? res;
  UnauthorizedException({this.res, required RequestOptions r})
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    return res?.data['message'] ?? 'Something went wrong.\nPlease try again.';
  }
}

class UnknownException extends DioException {
  Response? res;

  UnknownException({this.res, required RequestOptions r})
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    try {
      return res?.data['message'] ?? 'Something went wrong.\nPlease try again.';
    } catch (e) {
      return 'Something went wrong.\nPlease try again.';
    }
  }
}
