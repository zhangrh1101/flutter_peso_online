import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';

abstract class AppColors {
  ///获取随机颜色
  static Color randomColor() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
    );
  }

  ///白色
  static Color white = Colors.white;

  ///黑色
  static Color balck = Colors.black;

  ///主题色
  static Color themeColor = HexColor('#FFE600');

  ///主背景
  static Color backgroundColor = HexColor('#F4F6FA');

  ///主标题
  static Color textColor = HexColor('#333333');

  ///副标题
  static Color subTextColor = HexColor('#666666');

  ///描述
  static Color descTextColor = HexColor('#999999');

  ///分割线Separator
  static Color separator = HexColor('#F5F5F5');

  ///Underline
  static Color underline = HexColor('#EEEEEE');

  ///边框颜色
  static Color borderColor = HexColor('#C3C7CA');

  ///粉色
  static Color pink = HexColor('#FF6699');
}
