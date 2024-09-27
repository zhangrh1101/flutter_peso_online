import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:flutter_peso_online/common/api/api.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';
import 'package:flutter_peso_online/page/login/view/login_title.dart';

import '../../../common/tools/wechat_tool.dart';

class LoginBindWechatPage extends StatefulWidget {
  const LoginBindWechatPage({super.key});

  @override
  State<LoginBindWechatPage> createState() => _LoginBindWechatPageState();
}

///绑定微信页面
class _LoginBindWechatPageState extends State<LoginBindWechatPage>
    with TickerProviderStateMixin {
  bool isShowOneKeyLogin = false;
  late String phone = '123';

  @override
  void initState() {
    super.initState();

    WechatTool.init();
    WechatTool.addSubscriber();
  }

  @override
  void dispose() {
    super.dispose();
    WechatTool.removeSubscriber();
  }

  ///下一步
  _bindWechat() {
    print('_bindWechat --- ');

    // _showSuccessModal();
    WechatTool.wxLogin();
  }

  ///下一步
  // _showSuccessModal() {
  //   showGeneralDialog(
  //     context: context,
  //     pageBuilder: (BuildContext context, Animation<double> animation,
  //         Animation<double> secondaryAnimation) {
  //       return Container(
  //         padding: EdgeInsets.only(top: 88.0, bottom: kBottomBarHeight),
  //         color: AppColors.white,
  //         child: Column(
  //           children: [
  //             Expanded(
  //               flex: 1,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Image(
  //                     width: kPixel(80),
  //                     height: kPixel(80),
  //                     image: const AssetImage(
  //                         'images/login/login_bind_success.png'),
  //                   ),
  //                   SizedBox(height: 20),
  //                   Text(
  //                     '账号绑定成功',
  //                     style: TextStyle(
  //                       color: AppColors.textColor, //文字颜色
  //                       fontSize: kFontSize(16), //文字大小
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                   SizedBox(height: 200),
  //                 ],
  //               ),
  //             ),
  //             Text(
  //               '身份创建准备中...',
  //               style: TextStyle(
  //                 color: AppColors.descTextColor, //文字颜色
  //                 fontSize: kFontSize(16), //文字大小
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //             SizedBox(height: 30),
  //           ],
  //         ),
  //       );
  //     },
  //     barrierLabel: 'false',
  //     barrierDismissible: true,
  //     barrierColor: Colors.black.withOpacity(0.3),
  //     transitionDuration: Durations.medium3,
  //     transitionBuilder: (BuildContext context, Animation<double> animation,
  //         Animation<double> secondaryAnimation, Widget child) {
  //       return SlideTransition(
  //         position: animation.drive(
  //           Tween<Offset>(
  //             begin: const Offset(0, 1),
  //             end: Offset.zero,
  //           ).chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut)),
  //         ),
  //         child: child,
  //       );
  //     },
  //   );

  //   Future.delayed(Duration(milliseconds: 1000), () {
  //     print("延时1秒执行");
  //     Navigator.of(context).pop(true);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: Navbar().build(context),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.only(top: kPixel(0), bottom: kTabBarHeight),
      color: AppColors.white,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start, //元素与空白互相间隔
        children: [
          LoginTitle(
            title: '授权绑定微信',
            subTitle: '将积分提现到微信零钱11',
            isRobot: true,
          ),
          Padding(
            padding: kEdgeInsets(0, 50, 0, 0),
            child: Image(
              width: kPixel(300),
              height: kPixel(310),
              image: const AssetImage('images/login/logo_wx_cash.png'),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: kPixel(40), right: kPixel(40)),
            child: Column(
              children: [
                CommonButton(
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: HexColor('#07C160'),
                  borderRadius: 30,
                  image: Padding(
                    padding: kEdgeInsets(5, 0, 5, 0),
                    child: Icon(
                      Icons.wechat,
                      color: AppColors.white,
                    ),
                  ),
                  content: Text(
                    "去授权",
                    style: TextStyle(
                      color: AppColors.white, //文字颜色
                      fontSize: kFontSize(15), //文字大小
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () => {_bindWechat()},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
