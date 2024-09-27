import 'package:get/get.dart';

import '../../page/main/main_page.dart';
import '../../page/login/controller/login_page.dart';
import '../../page/login/controller/login_phone_page.dart';
import '../../page/login/controller/login_code_page.dart';
import '../../page/login/controller/login_wechat_page.dart';

import '../../page/home/controller/home_page.dart';
import '../../page/order/controller/order_page.dart';
import '../../page/mine/controller/mine_page.dart';
import '../../page/setting/controller/setting_page.dart';
import '../../page/trend/controller/test_page.dart';
import '../../page/trend/controller/trend_detail_page.dart';

// GoRouter configuration
// ignore_for_file: constant_identifier_names

abstract class AppPages {
  static const MainPage = '/';

  static const HomePage = '/HomePage';
  static const OrderPage = '/OrderPage';
  static const MinePage = '/MinePage';

  ///注册登录
  static const LoginPage = '/LoginPage';
  static const LoginPhonePage = '/LoginPhonePage';
  static const LoginCodePage = '/LoginCodePage';
  static const LoginBindWechatPage = '/LoginBindWechatPage';

  static const TestPage = '/TestPage';
  static const SettingPage = '/SettingPage';
  static const TrendDetailPage = '/TrendDetailPage';

  static const AnimationPage = '/AnimationPage';
}

var routers = [
  //Simple GetPage

  GetPage(
    name: AppPages.MainPage,
    page: () => const MainPage(),
    children: [
      GetPage(
        name: AppPages.HomePage,
        page: () => const HomePage(),
      ),
      GetPage(
        name: AppPages.OrderPage,
        page: () => const OrderPage(),
      ),
      GetPage(
        name: AppPages.MinePage,
        page: () => const MinePage(),
      ),
    ],
  ),

  GetPage(
    name: AppPages.HomePage,
    page: () => const HomePage(),
  ),

  GetPage(
    name: AppPages.TestPage,
    page: () => const TestPage(),
  ),

  GetPage(
    name: AppPages.LoginPage,
    page: () => const LoginPage(),
    transition: Transition.downToUp,
    fullscreenDialog: true,
    popGesture: false,
  ),
  GetPage(
    name: AppPages.LoginPhonePage,
    page: () => const LoginPhonePage(),
  ),
  GetPage(
    name: AppPages.LoginCodePage,
    page: () => const LoginCodePage(),
  ),
  GetPage(
    name: AppPages.LoginBindWechatPage,
    page: () => const LoginBindWechatPage(),
  ),

  GetPage(
    name: AppPages.TrendDetailPage,
    page: () => const TrendDetailPage(),
    popGesture: false,
  ),

  GetPage(
    name: AppPages.SettingPage,
    page: () => const SettingPage(),
  ),

  // GetPage with custom transitions and bindings

  // GetPage(
  //   name: '/second',
  //   page: () => Second(),
  //   customTransition: SizeTransitions(),
  //   binding: SampleBind(),
  // ),
  // // GetPage with default transitions
  // GetPage(
  //   name: '/third',
  //   transition: Transition.cupertino,
  //   page: () => Third(),
  // ),
];
