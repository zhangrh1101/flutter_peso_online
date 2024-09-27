import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';

///标题
class Navbar {
  // final BuildContext context;

  ///标题
  final dynamic title;

  ///返回事件
  final void Function()? onTap;

  ///是否展示back键
  final bool canBack;

  final double? leadingWidth;

  ///右侧菜单
  final Widget? leading;

  ///右侧菜单
  final List<Widget>? actions;

  ///给以在app下方添加的组件，例如TabBar
  final Widget? bottom;

  ///是否居中
  final bool? centerTitle;

  ///背景颜色
  final Color? backgroundColor;

  ///阴影
  final double? elevation;

  ///阴影颜色
  final Color? shadowColor;

  ///字体颜色
  final Color? fontColor;

  ///back键颜色
  final Color? iconColor;

  ///设置状态栏字体颜色
  final Brightness? brightness;

  Navbar({
    this.title,
    this.canBack = true,
    this.onTap,
    this.leadingWidth,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.bottom,
    this.backgroundColor = Colors.white,
    this.fontColor = Colors.black87,
    this.iconColor = Colors.black,
    this.brightness = Brightness.light,
    this.shadowColor = Colors.white,
    this.elevation = 0.0,
  });

  PreferredSizeWidget build(BuildContext context) {
    ///屏幕适配
    //GeneralUtil.screenAdaptation(context);
    return AppBar(
      // forceMaterialTransparency: true,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      // foregroundColor: iconColor,
      shadowColor: shadowColor,
      elevation: elevation,
      centerTitle: centerTitle,
      title: title is String
          ? Text(
              title!,
              style: TextStyle(
                letterSpacing: kPixel(1.0),
                fontSize: Platform.isIOS ? 20 : 18,
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            )
          : title,
      automaticallyImplyLeading: canBack,
      leadingWidth: leadingWidth,
      leading: canBack
          ? (Navigator.canPop(context)
              ? InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: onTap ?? () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 22,
                  ),
                )
              : null)
          : leading,
      actions: actions,
    );
  }
}
