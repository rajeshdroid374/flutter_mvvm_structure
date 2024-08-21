import '../response/api_response.dart';


/*
*  Created By Divyesh & kalpesh On 15/08/2024...
*  Rajeshwar info_tech
*
* */

enum MethodType { get, post, put, delete, patch }

abstract class ApiClient {
  void setToken(String token);
  void removeToken();

  Future<ApiResponse<T>> requestWithOutAuth<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
    T Function(Map<String, dynamic> json)? fromJson,
    required Function()? onRetry,
  });

  Future<ApiResponse<T>> requestWithAuthToken<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
    T Function(Map<String, dynamic> json)? fromJson,
    required Function()? onRetry,
  });
}

