import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark
    ..backgroundColor = Colors.transparent
    ..progressColor = Colors.yellow
    ..indicatorColor = Colors.black54
    ..textColor = Colors.yellow
    ..fontSize = Platform.isIOS ? 17 : 15
    ..contentPadding = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 20.0,
    )
    ..boxShadow = []
    ..indicatorSize = 40.0
    ..radius = 8.0
    ..maskType = EasyLoadingMaskType.none
    ..maskColor = Colors.black.withOpacity(0.3)
    ..userInteractions = false
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();

  BotToast.defaultOption.text.align = const Alignment(0, 0);
  BotToast.defaultOption.text.contentColor = Colors.black.withOpacity(0.9);
  BotToast.defaultOption.text.contentPadding =
      const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);
}

///Toast
class Toast {
  static showText(String text) {
    return BotToast.showText(text: text);
  }

  static showLoading({String? text, bool? dismissOnTap}) {
    EasyLoading.show(status: text, dismissOnTap: dismissOnTap);
  }

  static dissmiss() {
    EasyLoading.dismiss();
  }
}

// ///Loading
// class Loading {
//   static showText(String? text, bool? dismissOnTap) {
//     return EasyLoading.show(status: text, dismissOnTap: dismissOnTap);
//   }
// }
