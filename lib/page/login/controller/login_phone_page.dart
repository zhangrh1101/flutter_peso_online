import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';
import 'package:flutter_peso_online/page/login/view/login_title.dart';

class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({super.key});

  @override
  State<LoginPhonePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPhonePage> {
  TextEditingController _phoneController = TextEditingController();

  bool isShowOneKeyLogin = false;
  late String phone = '';

  @override
  void initState() {
    super.initState();

    _phoneController.text = '15000000001';
    setState(() {
      phone = _phoneController.text;
    });
  }

  ///下一步
  _nextClick() {
    print('_nextClick --- $phone');
    Get.toNamed(AppPages.LoginCodePage, arguments: phone);
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
    //统一定义一个圆角样式
    var customBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.zero),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: AppColors.underline,
        width: 0.5,
      ),
    );

    var noneBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );

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
            title: '手机号登录',
            subTitle: '首次登录即自动创建账号',
          ),
          Image(
            width: kPixel(90),
            height: kPixel(30),
            image: const AssetImage('images/login/logo.png'),
          ),
          Padding(
            padding: kEdgeInsets(20, 30, 30, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    print('+86');
                  },
                  child: Container(
                    width: 40,
                    height: 30,
                    margin: EdgeInsets.only(right: 0),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5.0),
                    //   color: Colors.pink,
                    // ),
                    child: Center(
                      child: Text(
                        "+86",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: kFontSize(18),
                          // fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      // color: Colors.amber,
                      alignment: Alignment.center,
                      // 设置圆角
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(5.0),
                      //       bottomLeft: Radius.circular(5.0)),
                      //   color: Colors.blue,
                      // ),
                      child: TextField(
                        controller: _phoneController,
                        autofocus: false,
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: kFontSize(18),
                          // fontWeight: FontWeight.w500,
                          // textBaseline: TextBaseline.alphabetic,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          // contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                          contentPadding: EdgeInsets.only(left: 0, right: 15),
                          // filled: true,
                          // fillColor: Colors.red,

                          //如果不设置安卓上会不居中
                          focusedBorder: noneBorder,
                          enabledBorder: noneBorder,
                          border: InputBorder.none,

                          hintText: '请输入手机号',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: kFontSize(18),
                            fontWeight: FontWeight.w400,
                            textBaseline: TextBaseline.alphabetic,
                          ),

                          alignLabelWithHint: true,

                          // prefixIcon: Container(
                          //   alignment: Alignment.centerLeft,
                          //   width: kPixel(50),
                          //   height: kPixel(55),
                          //   color: Colors.amber,
                          //   child: Text(
                          //     "+86",
                          //     style: TextStyle(
                          //       color: HexColor('#999999'), //文字颜色
                          //       fontSize: kFontSize(24), //文字大小
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                        ),
                        onTapOutside: (event) => {
                          FocusManager.instance.primaryFocus?.unfocus(),
                        },
                        onChanged: (value) => {
                          debugPrint('onChanged --- $value'),
                          setState(() {
                            phone = value;
                          }),
                        },
                      ),
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.red,
                    ),
                  ],
                )),
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
                    onPressed:
                        ValidatorUtil.isPhone(phone) ? () => _nextClick() : null
                    // onPressed: () => Get.toNamed(
                    //   AppPages.LoginCodePage,
                    //   arguments: phone,
                    // ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
