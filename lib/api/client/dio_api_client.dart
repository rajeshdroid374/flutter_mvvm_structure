import 'dart:convert';
import 'package:api_call/utils/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../utils/no_internet_screen.dart';
import '../exception/api_exception.dart';
import '../exception/failure.dart';
import '../response/api_response.dart';
import 'api_client.dart';

/*
*
* Created By Divyesh & kalpesh On 15/08/2024
*  Rajeshwar info_tech
*
* */

class DioApiClient implements ApiClient {
  late Dio _dio;
  String token = '';
  String baseUrl = 'https://cybercell.rajeshwarinfotech.com/api/';
  String tag = 'DioApiClient';

  DioApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        DebugLogger.log(tag,
            'Request [${options.method}] => PATH: ${options.path}, DATA: ${options.data}, HEADERS: ${options.headers}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        DebugLogger.log(
            tag, 'Response [${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        DebugLogger.log(tag,
            'Error [${e.response?.statusCode}] => MESSAGE: ${e.message}, DATA: ${e.response?.data}');
        return handler.next(e);
      },
    ));
  }

  @override
  void removeToken() {
    _dio.options.headers.remove('Authorization');
  }

  @override
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  Future<ApiResponse<T>> requestWithAuthToken<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
    T Function(Map<String, dynamic> json)? fromJson,
    required Function()? onRetry,
  }) async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      bool? shouldRetry = await Get.to<bool>(() => NoInternetScreen(),
          arguments: onRetry);
      if (shouldRetry == true && onRetry != null) {
        onRetry();
      }
    }

    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      if (header != null) {
        _dio.options.headers.addAll(header);
      }

      Response response;
      switch (method) {
        case MethodType.get:
          response = await _dio.get(path, data: header, queryParameters: body);
          break;
        case MethodType.post:
          response = await _dio.post(path, data: header, queryParameters: body);
          break;
        case MethodType.put:
          response = await _dio.put(path, data: header, queryParameters: body);
          break;
        case MethodType.delete:
          response =
              await _dio.delete(path, data: header, queryParameters: body);
          break;
        case MethodType.patch:
          response =
              await _dio.patch(path, data: header, queryParameters: body);
          break;
      }
      return ApiResponse<T>(
        data: fromJson != null ? fromJson(response.data) : null,
        result: true,
      );
    } on DioException catch (e) {
      Failure failure;
      if (e.type == DioExceptionType.connectionTimeout) {
        failure = ConnectionTimeOutFailure();
      } else if (e.type == DioExceptionType.sendTimeout) {
        failure = SendTimeOutFailure();
      } else if (e.type == DioExceptionType.receiveTimeout) {
        failure = ReceivedTimeOutFailure();
      } else if (e.type == DioExceptionType.cancel) {
        failure = CancelFailure();
      } else if (e.type == DioExceptionType.badCertificate) {
        failure = BadCertificateFailure();
      } else if (e.type == DioExceptionType.badResponse) {
        String? message;
        if (e.response != null && e.response?.data != null) {
          if (e.response!.data['message'] is String) {
            message = e.response!.data['message'];
          } else {
            message = jsonEncode(e.response!.data['message']);
          }
        }
        failure = BadResponseFailure(message: message);
      } else if (e.type == DioExceptionType.connectionError) {
        failure = ConnectionFailure();
      } else if (e.type == DioExceptionType.unknown &&
          e.message?.contains('SocketException') == true) {
        failure = InternetFailure();
      } else {
        failure = ServerFailure();
      }

      return ApiResponse.error(
        message: failure.failureMessage(),
      );
    }
  }

  @override
  Future<ApiResponse<T>> requestWithOutAuth<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
    T Function(Map<String, dynamic> json)? fromJson,
    required Function()? onRetry,
  }) async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      bool? shouldRetry = await Get.to<bool>(() =>  NoInternetScreen(),
          arguments: onRetry);
      if (shouldRetry == true && onRetry != null) {
        onRetry();
      }

    }

    try {
      if (header != null) {
        _dio.options.headers.addAll(header);
      }

      Response response;
      switch (method) {
        case MethodType.get:
          response = await _dio.get(path, data: header, queryParameters: body);
          break;
        case MethodType.post:
          response = await _dio.post(path, data: header, queryParameters: body);
          break;
        case MethodType.put:
          response = await _dio.put(path, data: header, queryParameters: body);
          break;
        case MethodType.delete:
          response =
              await _dio.delete(path, data: header, queryParameters: body);
          break;
        case MethodType.patch:
          response =
              await _dio.patch(path, data: header, queryParameters: body);
          break;
      }
      return ApiResponse<T>(
        data: fromJson != null ? fromJson(response.data) : null,
        result: true,
      );
    } on DioException catch (e) {
      Failure failure;
      if (e.type == DioExceptionType.connectionTimeout) {
        failure = ConnectionTimeOutFailure();
      } else if (e.type == DioExceptionType.sendTimeout) {
        failure = SendTimeOutFailure();
      } else if (e.type == DioExceptionType.receiveTimeout) {
        failure = ReceivedTimeOutFailure();
      } else if (e.type == DioExceptionType.cancel) {
        failure = CancelFailure();
      } else if (e.type == DioExceptionType.badCertificate) {
        failure = BadCertificateFailure();
      } else if (e.type == DioExceptionType.badResponse) {
        String? message;
        if (e.response != null && e.response?.data != null) {
          if (e.response!.data['message'] is String) {
            message = e.response!.data['message'];
          } else {
            message = jsonEncode(e.response!.data['message']);
          }
        }
        failure = BadResponseFailure(message: message);
      } else if (e.type == DioExceptionType.connectionError) {
        failure = ConnectionFailure();
      } else if (e.type == DioExceptionType.unknown &&
          e.message?.contains('SocketException') == true) {
        failure = InternetFailure();
      } else {
        failure = ServerFailure();
      }

      return ApiResponse.error(
        message: failure.failureMessage(),
      );
    }
  }
}
