import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/api/api.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';

const List<String> swiperImages = [
  "images/login/login_swiper_intro_1.png",
  "images/login/login_swiper_intro_2.png",
  "images/login/login_swiper_intro_3.png",
];

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowOneKeyLogin = false;
  late final String loginToken;

  @override
  void initState() {
    super.initState();

    //初始化
    // ShanyanTool.init(
    //   (result) => {
    //     debugPrint('一键登录初始化 --- $result'),
    //     setState(() {
    //       isShowOneKeyLogin = true;
    //     })
    //   },
    // );
  }

  Future<void> openOnceLogin() async {
    // ShanyanTool.openLoginAuthPlatformState(
    //   (token) => {
    //     //一键登录成功
    //     debugPrint('一键登录 成功 --- $token'),
    //     onceLogin(token)
    //   },
    // );
  }

  ///一键登录
  onceLogin(loginToken) async {
    debugPrint('一键登录Token onceLogin--- $loginToken');
    try {
      BaseModel model = await LoginApi.oncelogin(
        params: {
          'client_type': Global.isIOS ? '1' : '2',
          'token': loginToken,
        },
        // params: {
        //   'client_type': '1',
        //   'token':
        //       'A3-Sj_RwONryya4HWPbKetJSFzODjkS-3AY4tT40To35xagOxFu2BpbFsxx6aT4j0PTuQayH0MgUfwtZsozSVkNRsxQ_fVoNvKJanZtZRtfPrm-XaRxx662Q6SgKDvT5-azq9D0souVBI76kVJ_xFgVr0PADw1H6g_j_EwIhZYItR83Nz46LC5HYHddZGrPCTwxIhlx7nVxCi8ekGZA7tlQBuL3Zp2E4ck-69ttOU2wfBQEP7b3LFE2k9WfmhL-Cyqst7DgueNaQw3HcPcbuwcgK9SxOJLJBjZWjAwTq-Dr4-dsqkUyYWZkPWSV59NCw-C1'
        // },
      );
      debugPrint('onceLogin succese---> ${model.toJson()}');
      Toast.showText('登录成功 ${model.message}');
      Get.back();
    } catch (e) {
      debugPrint('onceLogin error ---> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.only(top: kPixel(88), bottom: kTabBarHeight),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/background/background.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start, //元素与空白互相间隔
        children: [
          ///logo
          Image(
            width: kPixel(90),
            height: kPixel(30),
            image: const AssetImage('images/login/logo.png'),
          ),

          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: SwiperView(
                width: kScreenWidth,
                height: kPixel(300),
                images: swiperImages,
              ),
            ),
          ),

          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: SizedBox(
          //       width: kScreenWidth,
          //       height: kPixel(300),
          //       child: Swiper(
          //         autoplay: true,
          //         autoplayDelay: 5000,
          //         // duration: 2500,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             alignment: Alignment.center,
          //             child: Image.asset(
          //               width: kScreenWidth,
          //               height: kPixel(220),
          //               swiperImages[index],
          //               fit: BoxFit.cover,
          //             ),
          //           );
          //         },
          //         itemCount: swiperImages.length,
          //         pagination: SwiperPagination(
          //           // 此处使用自己编写的样式
          //           builder: CustomSwiperPaginationBuilder(
          //               activeColor: HexColor('#CCCCCC'),
          //               alignment: Alignment.bottomCenter),
          //         ),
          //         // control: const SwiperControl(),
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: EdgeInsets.only(left: kPixel(40), right: kPixel(40)),
            child: Column(
              children: [
                CommonButton(
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: AppColors.themeColor,
                  borderRadius: 30,
                  content: Text(
                    "本机号码一键登录11",
                    style: TextStyle(
                      color: HexColor('#333333'), //文字颜色
                      fontSize: kFontSize(15), //文字大小
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    // Get.offAll(() => const MainPage(),
                    //     transition: Transition.zoom);

                    // EasyLoading.show(status: '加载中...', dismissOnTap: true);
                    // setAuthPopupThemeConfig();
                    // openLoginAuthPlatformState();

                    openOnceLogin();
                  },
                ),
                const SizedBox(height: 15),
                CommonButton(
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 30,
                  borderWidth: 0.5,
                  content: Text(
                    "手机号注册/登录",
                    style: TextStyle(
                      color: HexColor('#333333'), //文字颜色
                      fontSize: kFontSize(15), //文字大小
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(AppPages.LoginPhonePage);
                    if (Global.isIOS) {
                      debugPrint(
                          'device info ios----------- ${Global.iosDeviceInfo?.data.toString()}');
                    } else {
                      debugPrint(
                          'device info android----------- ${Global.androidDeviceInfo?.brand}');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// 闪验
// final OneKeyLoginManager oneKeyLoginManager = OneKeyLoginManager();
// Future<void> initPlatformState() async {
//     String appId = "";
//     if (Global.isIOS) {
//       appId = "K01WQI4Q";
//     } else if (Global.isAndroid) {
//       appId = "VPr8ukFn";
//     }
//     debugPrint('oneKeyLoginManager appId --- $appId');

//     //闪验SDK 初始化
//     await oneKeyLoginManager.init(appId: appId).then((shanYanResult) {
//       setState(() {
//         _code = shanYanResult.code ?? 0;
//         _result = shanYanResult.message ?? "";
//         _content = shanYanResult.toJson().toString();
//       });

//       debugPrint('初始化 --- $_code  $_result $_content');

//       if (1000 == shanYanResult.code) {
//         //初始化成功
//         Toast.showText('闪验初始化成功');
//         getPhoneInfoPlatformState();
//         setAuthPopupThemeConfig();
//       } else {
//         //初始化失败
//         Toast.showText('闪验初始化失败');
//       }
//     });

//     /// 开启日志
//     oneKeyLoginManager.setInitDebug(false);
//     oneKeyLoginManager.setDebug(false);

//     /// 运营商类型
//     oneKeyLoginManager
//         .getOperatorType()
//         .then((value) => debugPrint("getOperatorType=== $value"));

//     /// 获取运营商信息（协议名称、链接、运营商类型）
//     oneKeyLoginManager
//         .getOperatorInfo()
//         .then((value) => debugPrint("getOperatorInfo=== $value"));

//     /// 授权页协议点击事件
//     oneKeyLoginManager
//         .setPrivacyOnClickListener((PrivacyOnClickEvent privacyOnclickEvent) {
//       Map map = privacyOnclickEvent.toMap();
//       debugPrint("setPrivacyOnClickListener=== ${map.toString()}");
//     });
//   }

//   ///预取号
//   Future<void> getPhoneInfoPlatformState() async {
//     //闪验SDK 预取号
//     oneKeyLoginManager.getPhoneInfo().then((ShanYanResult shanYanResult) {
//       setState(() {
//         _code = shanYanResult.code ?? 0;
//         _result = shanYanResult.message ?? "";
//         _content = shanYanResult.toJson().toString();
//       });
//       debugPrint('预取号 --- $_code  $_result $_content');

//       if (1000 == shanYanResult.code) {
//         //预取号成功
//         Toast.showText('预取号成功');
//       } else {
//         //预取号失败
//         Toast.showText('预取号失败');
//       }
//     });
//   }

//   ///授权页拉起
//   Future<void> openLoginAuthPlatformState() async {
//     ///闪验SDK 拉起授权页
//     Toast.showLoading();
//     oneKeyLoginManager.openLoginAuth().then((ShanYanResult shanYanResult) {
//       setState(() {
//         _code = shanYanResult.code ?? 0;
//         _result = shanYanResult.message ?? "";
//         _content = shanYanResult.toJson().toString();
//       });
//       debugPrint('拉起授权页 --- $_code  $_result $_content');
//       if (1000 == shanYanResult.code) {
//         //拉起授权页成功
//         Toast.dissmiss();
//       } else {
//         //拉起授权页失败
//         Toast.dissmiss();
//       }
//     });

//     ///闪验SDK 设置授权页一键登录回调（“一键登录按钮”、返回按钮（包括物理返回键））
//     oneKeyLoginManager.setOneKeyLoginListener((ShanYanResult shanYanResult) {
//       setState(() {
//         _code = shanYanResult.code ?? 0;
//         _result = shanYanResult.message ?? "";
//         _content = shanYanResult.toJson().toString();
//       });
//       debugPrint('授权页点击回调 --- $_code  $_result');
//       oneKeyLoginManager.setLoadingVisibility(true);

//       if (1000 == shanYanResult.code) {
//         //关闭授权页
//         oneKeyLoginManager.finishAuthControllerCompletion();
//         setState(() {
//           loginToken = shanYanResult.token!;
//         });
//         //一键登录获取token成功
//         // onceLogin();
//       } else if (1011 == shanYanResult.code) {
//         ///点击返回/取消 （强制自动销毁）
//         oneKeyLoginManager.setLoadingVisibility(false);
//       } else {
//         //关闭授权页
//         oneKeyLoginManager.finishAuthControllerCompletion();
//         //一键登录获取token失败
//         Toast.showText('一键登录获取token失败');
//       }
//     });
//   }