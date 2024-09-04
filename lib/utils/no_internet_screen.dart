import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../helper/assets_helper.dart';
import 'assets.dart';

class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
   StreamSubscription<ConnectivityResult>? _subscription;

  @override
  void initState() {
    super.initState();

    StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.mobile)) {
        Get.back(result: false);
      } else if (result.contains(ConnectivityResult.wifi)) {
        Get.back(result: false);
      } else if (result.contains(ConnectivityResult.other)) {
        Get.back(result: false);
      }
    });

  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if(!didPop) {
          showBackButtonDialog(context);
        }
      },
      child: Scaffold(

        body: Stack(
          fit: StackFit.expand,
          children: [
             AssetsHelper.getAssetImage(name: Assets.images.noInternet,fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }


Future<bool> showBackButtonDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Exit!"),
      content: const Text("Do you want to exit the app?"),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: const Text("Yes"),
        ),
      ],
    ),
  ).then((value) => value ?? false);
}
}
