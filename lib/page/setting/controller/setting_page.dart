import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';

class SettingPage extends StatelessWidget {
  final String title;
  const SettingPage({super.key, this.title = '设置'});

  @override
  Widget build(BuildContext context) {
    //屏幕大小
    // final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: Navbar(title: title).build(context),
      body: ListView(
        children: [
          settingCell(icon: 'images/setting/icon_person.png', title: '账号绑定'),
          dividerPx10(),
          settingCell(icon: 'images/setting/icon_notice.png', title: '通知'),
          dividerPx1(),
          settingCell(icon: 'images/setting/icon_black.png', title: '黑名单管理'),
          dividerPx1(),
          settingCell(icon: 'images/setting/icon_buylist.png', title: '已购买数据'),
          dividerPx1(),
          settingCell(icon: 'images/setting/icon_buylist.png', title: '浏览记录'),
          dividerPx1(),
          settingCell(
              icon: 'images/setting/icon_introducer.png', title: '如尔介绍人'),
          dividerPx10(),
          settingCell(icon: 'images/setting/icon_feedback.png', title: '帮助与反馈'),
          dividerPx1(),
          settingCell(icon: 'images/setting/icon_clear.png', title: '清理记录'),
          dividerPx10(),
          settingCell(icon: 'images/setting/icon_about.png', title: '关于我们'),
          dividerPx10(),
          loginOutWidget(
            title: '退出登录',
            onTap: () {
              debugPrint('退出登录 ---');
            },
          ),
        ],
      ),
    );
  }
}

Widget loginOutWidget({
  String? title,
  Function()? onTap,
}) {
  return ListTile(
    tileColor: AppColors.white,
    title: Center(
      child: Text(
        title!,
        style: TextStyle(
          color: Colors.red,
          fontSize: kFontSize(16),
        ),
      ),
    ),
    onTap: () {
      debugPrint('退出登录 ---');
      onTap!;
    },
  );
}

/// 设置Cell
Widget settingCell({
  String? icon,
  String? title,
  String? subTitle,
  String? detailTitle,
  bool? showArrow,
  Color? backgroundColor = Colors.white,
}) {
  return ListTile(
    horizontalTitleGap: 8,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10), // 内容内边距
    tileColor: AppColors.white,
    leading: icon != null
        ? Image(
            width: kPixel(26),
            height: kPixel(26),
            image: AssetImage(icon),
            fit: BoxFit.contain,
          )
        : const SizedBox(), //const Icon(Iconfont.personSet),
    title: Text(
      title ?? '',
      style: TextStyle(
        fontSize: kFontSize(15),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: HexColor('#2C2C2C'),
      ),
    ),
    // titleTextStyle: TextStyle(
    //   fontSize: kFontSize(18),
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.balck,
    // ),
    trailing: SizedBox(
      width: kPixel(160),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            detailTitle ?? '',
            style: TextStyle(
              fontSize: kFontSize(18),
              fontWeight: FontWeight.w500,
              color: HexColor('#666666'),
            ),
          ),
          Icon(
            Iconfont.arrowRight,
            color: HexColor('#CCCCCC'),
          ),
        ],
      ),
    ),
  );
}


// Column(
//         children: [
//           ListTile(
//             title: Text(
//               '商品列表',
//               style: TextStyle(fontSize: kFontSize(20)),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: CustomScrollView(
//               slivers: [
//                 ///头部
//                 SliverToBoxAdapter(
//                   child: Container(
//                     color: AppColors.randomColor(),
//                     width: kScreenWidth,
//                     height: 200,
//                   ),
//                 ),

//                 // SliverList(
//                 //   delegate: SliverChildBuilderDelegate(
//                 //         (context, index) {
//                 //           return Container(color: index % 2 == 0 ? Colors.yellow : Colors.red, height: 55,);
//                 //         },
//                 //     childCount: 20,
//                 //   ),
//                 // ),

//                 SliverList.separated(
//                   itemCount: 20,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       tileColor: AppColors.white,
//                       leading: const Icon(Iconfont.personSet),
//                       title: const Text("title"),
//                       titleTextStyle: TextStyle(
//                         fontSize: kFontSize(20),
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.randomColor(),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     return Divider(height: 0.5, color: AppColors.separator);
//                   },
//                 ),

//                 ///尾部
//                 SliverToBoxAdapter(
//                   child: Container(
//                     color: Colors.blue,
//                     width: kScreenWidth,
//                     height: 200,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),