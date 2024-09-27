import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/api/api.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';
import 'package:flutter_peso_online/page/login/view/login_title.dart';

class LoginCodePage extends StatefulWidget {
  const LoginCodePage({super.key});

  @override
  State<LoginCodePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginCodePage> {
  bool isShowOneKeyLogin = false;
  late String code = '';
  late String phone = '';

  @override
  void initState() {
    super.initState();

    var phone = Get.arguments as String;
    debugPrint('initState 1234 --- $phone');

    this.phone = phone;
  }

  ///下一步
  _sendCode() {
    print('_sendCode --- ${this.phone}');
    // Get.offAll(MainPage());
    Get.toNamed(AppPages.LoginBindWechatPage);
  }

  ///验证码登录
  _codeLogin() async {
    debugPrint('验证码登录 codeLogin--- ${this.phone} $code');
    try {
      var response = await LoginApi.codelogin(
        params: {
          'mobile': this.phone,
          'code': code,
        },
      );

      LoginModel model = LoginModel.fromJson(response.data);
      debugPrint('验证码登录 succese---> ${model.toJson()}');
      debugPrint('验证码登录 是否绑定微信---> ${model.wechatBind}');

      await StorageUtil.setString(Constants.AuthorizationToken, model.token!);
      Global.authorizationToken = model.token!;
      debugPrint('验证码登录成功 Authorization ---> ${Global.authorizationToken}');

      if (model.wechatBind!) {
        Toast.showText('登录成功');
        Get.offAll(MainPage());
      } else {
        Get.toNamed(AppPages.LoginBindWechatPage);
      }
    } catch (e) {
      debugPrint('验证码登录 error ---> $e');
    }
  }

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
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: AssetImage('images/background/background.png'),
      //   ),
      // ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start, //元素与空白互相间隔
        children: [
          LoginTitle(
            title: '输入4位验证码',
            subTitle: '已发送到：+86 ${this.phone}',
          ),
          Padding(
            padding: kEdgeInsets(15, 30, 15, 0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Box(title: code.length >= 1 ? code[0] : ''),
                    Box(title: code.length >= 2 ? code[1] : ''),
                    Box(title: code.length >= 3 ? code[2] : ''),
                    Box(title: code.length >= 4 ? code[3] : ''),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: TextField(
                    enableInteractiveSelection: false,
                    autofocus: false,
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.transparent,
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: kFontSize(24),
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      counter: Container(),
                      filled: true,
                      fillColor: Colors.pink.withOpacity(0.2),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.transparent,
                      ),
                    ),
                    onTapOutside: (event) => {
                      FocusManager.instance.primaryFocus?.unfocus(),
                    },
                    onChanged: (value) {
                      debugPrint('onChanged --- $value');
                      setState(() {
                        code = value;
                      });
                      if (value.length == 4) {
                        _codeLogin();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: kPixel(40), right: kPixel(40)),
            child: Column(
              children: [
                CommonButton(
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: AppColors.themeColor,
                  borderRadius: 30,
                  content: Text(
                    "下一步",
                    style: TextStyle(
                      color: HexColor('#333333'), //文字颜色
                      fontSize: kFontSize(15), //文字大小
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // onPressed:
                  //     ValidatorUtil.isPhone(phone) ? () => _nextClick() : null,
                  onPressed: () {
                    _sendCode();
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

// ignore: non_constant_identifier_names
Widget Box({
  String? title,
  Function()? onTap,
}) {
  return Container(
    width: kPixel(70),
    height: kPixel(70),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
      border: Border.all(
        color: Colors.grey,
        style: BorderStyle.solid,
      ),
    ),
    child: Center(
      child: Text(
        title!,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: kFontSize(30),
        ),
      ),
    ),
  );
}
