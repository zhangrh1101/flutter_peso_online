import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';

void main() {
  initConfig();
  runApp(const MyApp());
}

/* 初始化配置项 */
initConfig() {
  Global.init();
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // iphone 12 390*844pt  1170*2532px
      minTextAdapt: false,
      splitScreenMode: true,

      builder: (context, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(builder: BotToastInit()),
          navigatorObservers: [BotToastNavigatorObserver()],
          // builder: EasyLoading.init(),BotToastInit()
          // builder: (context, child) {
          //   // do your initialization here
          //   child = EasyLoading.init(); // assuming this is returning a widget
          //   child = botToastBuilder(context, child);
          //   return child;
          // },
          debugShowCheckedModeBanner: true,
          title: 'Flutter Demo',
          initialRoute: '/',
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
          getPages: routers,
          theme: ThemeData(
            //字体
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            textTheme: Theme.of(context).textTheme.apply(
                  fontSizeFactor: Platform.isIOS ? 1.2 : 1,
                ),
            //主题
            brightness: Brightness.light,

            //Flutter 2.5之后废弃primaryColor,采用colorScheme
            // primaryColor: Colors.black,
            // colorScheme: const ColorScheme.light().copyWith(primary: Colors.black),
            primarySwatch: Colors.purple,

            //脚手架背景颜色
            scaffoldBackgroundColor: HexColor('#F4F7F7'),
            dividerColor: Colors.red,

            //1.高亮颜色问题
            highlightColor: const Color.fromRGBO(1, 0, 0, 0.0),
            //2.点击后水波纹动画颜色.
            splashColor: const Color.fromRGBO(1, 0, 0, 0.0),
            // highlightColor: Colors.red,
            // splashColor: Colors.green,

            // 去掉 TextButton 的水波纹效果
            textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(splashFactory: NoSplash.splashFactory),
            ),
          ),
        );
      },
      // child: Home(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool isDarkMode = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       // home: Scaffold(
//       //   appBar: AppBar(
//       //       // 导航条
//       //       title: const Text('导航栏'),
//       //       // titleTextStyle: const TextStyle(
//       //       //   color: Colors.green,
//       //       //   fontSize: 20,
//       //       //   fontWeight: FontWeight.bold,
//       //       // ),
//       //       centerTitle: true,
//       //       foregroundColor: Colors.blue[900],
//       //       backgroundColor: Colors.blue[300],
//       //       shadowColor: Colors.red,
//       //       elevation: 0.5),

//       //   bottomNavigationBar: const TabbarController(),
//       //   // body: const TabbarController(), //导航条之外的body
//       // ),
//       home: const MainPage(),
//       theme: ThemeData(
//         //主题
//         brightness: isDarkMode ? Brightness.dark : Brightness.light,

//         //Flutter 2.5之后废弃primaryColor,采用colorScheme
//         // primaryColor: Colors.black,
//         // colorScheme: const ColorScheme.light().copyWith(primary: Colors.black),
//         primarySwatch: Colors.purple,

//         //脚手架背景颜色
//         scaffoldBackgroundColor:
//             isDarkMode ? HexColor('#000000') : HexColor('#F4F7F7'),
//         dividerColor: Colors.red,

//         //1.高亮颜色问题
//         // highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
//         //2.点击后水波纹动画颜色.
//         // splashColor: Color.fromRGBO(1, 0, 0, 0.0),
//         highlightColor: Colors.transparent,
//         splashColor: Colors.cyan,
//       ),
//     );
//   }
// }
