import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';

/// 自定义点击组件
class LoginTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isRobot;
  final GestureTapCallback? onTap;

  const LoginTitle({
    Key? key,
    this.title = '',
    this.subTitle = '',
    this.isRobot = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///使用Stack是为了给图片盖上一个蒙版
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          Visibility(
            visible: isRobot,
            child: Lottie.asset(
              'images/lottie/robot.json',
              height: kPixel(60),
              width: kPixel(60),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textColor, //文字颜色
                    fontSize: kFontSize(26), //文字大小
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: AppColors.subTextColor, //文字颜色
                    fontSize: kFontSize(15), //文字大小
                    fontWeight: FontWeight.w500,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
