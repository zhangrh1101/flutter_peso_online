import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// 全局配置
class Global {
  /// 用户配置
  // static UserModel profile = UserModel(
  //   accessToken: '',
  //   channels: [],
  //   displayName: '',
  // );

  /// Token
  static String authorizationToken = '';

  /// 是否 ios
  static bool isIOS = Platform.isIOS;

  /// 是否 android
  static bool isAndroid = Platform.isAndroid;

  /// android 设备信息
  static AndroidDeviceInfo? androidDeviceInfo;

  /// ios 设备信息
  static IosDeviceInfo? iosDeviceInfo;

  /// ios 设备信息
  static MacOsDeviceInfo? macOsDeviceInfo;

  /// init
  static Future init() async {
    debugPrint('Global 初始化');
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 读取设备信息
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    }
    if (Platform.isAndroid) {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }
    if (Platform.isMacOS) {
      Global.macOsDeviceInfo = await deviceInfoPlugin.macOsInfo;
    }

    // 工具初始
    // HttpUtil();

    // await StorageUtil.init();

    // 读取设备第一次打开
    // isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    // if (isFirstOpen) {
    //   StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    // }

    // 读取离线用户信息
    // var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    // if (_profileJSON != null) {
    //   profile = UserLoginResponseEntity.fromJson(_profileJSON);
    //   isOfflineLogin = true;
    // }

    // android 状态栏为透明的沉浸
    // if (Platform.isAndroid) {
    //   SystemUiOverlayStyle systemUiOverlayStyle =
    //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }
  }
}
