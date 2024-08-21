
/*
*  Created By Divyesh & kalpesh On 15/08/2024
*  Rajeshwar info_tech
*
* */

class ApiResponse<T extends Object?> {
  final String? message;
  final T? data;
  final bool result;

  ApiResponse({
    this.message,
    this.data,
   required this.result,
  });

  @override
  String toString() {
    return 'ApiResponse<$T>{message: $message, data: $data}';
  }

  factory ApiResponse.error({String? message}) {
    return ApiResponse<T>(
      message: message ?? 'Something went wrong',
      result: false,
    );
  }
}
