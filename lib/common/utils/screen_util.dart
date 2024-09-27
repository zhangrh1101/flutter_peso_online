import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
    ScreenUtil.pixelRatio       //设备的像素密度
    ScreenUtil.screenWidth      //设备宽度
    ScreenUtil.screenHeight     //设备高度
    ScreenUtil.bottomBarHeight  //底部安全区距离，适用于全面屏下面有按键的
    ScreenUtil.statusBarHeight  //状态栏高度 刘海屏会更高  单位px
    ScreenUtil.textScaleFactor //系统字体缩放比例
    
    ScreenUtil().scaleWidth  // 实际宽度的dp与设计稿px的比例
    ScreenUtil().scaleHeight // 实际高度的dp与设计稿px的比例
*/

/// 设备宽度
double kScreenWidth = ScreenUtil().screenWidth;

/// 设备高度
double kScreenHeight = ScreenUtil().screenHeight;

/// 设备高度
double kStatusBarHeight = ScreenUtil().screenHeight;

/// bottomBar高度
double kBottomBarHeight = ScreenUtil().bottomBarHeight;

/// Tabbar高度
double kTabBarHeight = kBottomBarHeight + 49.0;

/// Navigationbar高度
double kNavBarHeight = ScreenUtil().statusBarHeight + 44;

/// 设置像素
EdgeInsets kEdgeInsets(double l, double t, double r, double b) {
  return EdgeInsets.fromLTRB(l, t, r, b);
}

/// 设置像素
double kPixel(double pixel) {
  return ScreenUtil().setWidth(pixel);
}

Size kSize(double width, double height) {
  return Size(ScreenUtil().setWidth(width), ScreenUtil().setWidth(height));
}

/// 设置宽度
double kWidth(double width) {
  return ScreenUtil().setWidth(width);
}

/// 设置高度
double kHeight(double height) {
  return ScreenUtil().setHeight(height);
}

/// 设置字体尺寸
double kFontSize(double fontSize) {
  // return ScreenUtil().setSp(fontSize);
  return Platform.isIOS ? ScreenUtil().setSp(fontSize) + 2.0 : fontSize;
}
