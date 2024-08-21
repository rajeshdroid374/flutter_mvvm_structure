import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_theme.dart';
import '../utils/fonts.dart';
import 'custom_snackbar/custom_snackbar.dart';
import 'custom_snackbar/top_snack_bar.dart';

class AlertHelper {
  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        // backgroundColor: AppColor.appBlackColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showAppSnackBar(BuildContext context, {String message = '', bool isError = false}) {
    if (message.isNotEmpty) {
      showTopSnackBar(
        Overlay.of(context),
          CustomSnackBar.success(
          message: message ?? '',
          textAlign: TextAlign.start,
          backgroundColor: isError ? AppColor.appRedColor : AppColor.appBar.withOpacity(0.9),

          textStyle: Fonts.regularTextStyleLight.copyWith(fontSize: 14,color: AppColor.appWhiteColor),
        ),
      );
    }
  }
}
