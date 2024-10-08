import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/*
*  Created By Divyesh & kalpesh On 15/08/2024
*  Rajeshwar info_tech
*
* */

class DebugLogger {
  static void log(String tag, dynamic msg, {Object? error}) {
    if (kDebugMode) {
      developer.log('$msg', time: DateTime.now(), name: tag, error: error);
    }
  }
}
