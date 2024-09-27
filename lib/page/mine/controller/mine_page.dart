import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/controller/controller.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MinePage> {
  Widget _navLeading() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: TouchBox(
        // width: kPixel(124),
        height: kPixel(28),
        decoration: BoxDecoration(
          //设置背景颜色
          color: HexColor('#FFFCD6'),
          //设置Container圆角
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          //设置Container边框
          border: Border.all(width: 0.5, color: AppColors.themeColor),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(kPixel(5), 0, 3, 0),
              child: Image(
                width: kPixel(16),
                height: kPixel(16),
                image: AssetImage('images/public/coin.png'),
                fit: BoxFit.contain,
              ),
            ),
            Text(
              '做任务赚积分',
              style: TextStyle(
                  color: HexColor('#FE912D'),
                  fontWeight: FontWeight.bold,
                  fontSize: kFontSize(10)),
            )
          ],
        ),
        onTap: () {
          debugPrint('做任务赚积分 ---');
        },
      ),
    );
    // return Container(
    //   alignment: Alignment.center,
    //   child: TouchBox(
    //     width: kPixel(90),
    //     height: kPixel(22),
    //     margin: EdgeInsets.fromLTRB(kPixel(10), 0, 0, 0),
    //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    //     decoration: BoxDecoration(
    //       //设置背景颜色
    //       color: HexColor('#FFFCD6'),
    //       //设置Container圆角
    //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
    //       //设置Container边框
    //       border: Border.all(width: 0.5, color: AppColors.themeColor),
    //     ),
    //     child: Row(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.fromLTRB(kPixel(5), 0, 3, 0),
    //           child: Image(
    //             width: kPixel(16),
    //             height: kPixel(16),
    //             image: AssetImage('images/public/coin.png'),
    //             fit: BoxFit.contain,
    //           ),
    //         ),
    //         Text(
    //           '做任务赚积分',
    //           style: TextStyle(
    //               color: HexColor('#FE912D'),
    //               fontWeight: FontWeight.bold,
    //               fontSize: kFontSize(10)),
    //         )
    //       ],
    //     ),
    //     onTap: () {
    //       debugPrint('做任务赚积分 ---');
    //     },
    //   ),
    // );
  }

  List<TouchBox> _navActions() {
    return [
      TouchBox(
        width: kPixel(40),
        height: kPixel(40),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Image(
          width: kPixel(22),
          height: kPixel(22),
          image: AssetImage('images/mine/mine_nav_info.png'),
          fit: BoxFit.contain,
        ),
        onTap: () {
          debugPrint('上链 ---');
          Get.toNamed(AppPages.TestPage);
        },
      ),
      TouchBox(
        width: kPixel(40),
        height: kPixel(40),
        padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
        child: Image(
          width: kPixel(24),
          height: kPixel(24),
          image: AssetImage('images/mine/mine_nav_setting.png'),
          fit: BoxFit.contain,
        ),
        onTap: () {
          debugPrint('设置 ---');
          Get.toNamed(AppPages.SettingPage);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final Controller cont = Get.put(Controller());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: Navbar(
        title: '个人中心',
        canBack: false,
        leadingWidth: kPixel(120),
        leading: _navLeading(),
        actions: _navActions(),
      ).build(context),
      body: ListView(
        children: [
          Obx(
            () => Text(
              '监听 Count: ${cont.counter}',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: cont.increment,
      ),
    );
  }
}
