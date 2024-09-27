/// 图文按钮
import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';

enum IconTextAlignment {
  iconTopTextBottom, //图在上文字在下
  iconBottomTextTop, //图在下文字在上
  iconLeftTextRight, //图在左文字在右
  iconRightTextLeft, //图在右文字在左
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    this.width,
    this.height = 50,
    this.content,
    this.image,
    this.backgroundColor,
    this.disabledColor,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.interval,
    this.padding,
    this.alignment,
    this.onPressed,
    this.onLongPress,
  }) : super(key: key);

  ///图文按钮-对齐方式
  ///
  /// - iconTopTextBottom,//图在上文字在下
  ///
  /// - iconBottomTextTop,//图在下文字在上
  ///
  /// - iconLeftTextRight,//图在左文字在右
  ///
  /// - iconRightTextLeft,//图在右文字在左
  ///
  ///
  ///按钮宽度
  final double? width;

  ///按钮高度
  final double? height;

  ///图文按钮-文字
  /// 注意：如果要设置按钮禁用状态的文字颜色，不要设置 label 文字颜色
  ///     - 可以直接设置 ImageButton的 textColor 和 disabledTextColor
  final Widget? content;

  ///按钮-文字样式
  // final TextStyle? textStyle;

  ///图文按钮-图片/图标
  final Widget? image;

  ///背景颜色
  final Color? backgroundColor;

  ///背景颜色
  final Color? disabledColor;

  ///按钮圆角
  final double? borderRadius;

  ///边框宽度
  final double? borderWidth;

  ///边框颜色
  final Color? borderColor;

  ///图片文字之间间隔
  final double? interval;

  ///图文按钮-点击事件
  final void Function()? onPressed;

  ///图文按钮-长按事件
  final void Function()? onLongPress;

  /// 默认 iconLeftTextRight 图在左文字在右
  final IconTextAlignment? alignment;

  ///图文按钮-内边距
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: height,
        color: backgroundColor ?? Colors.white,
        disabledColor: disabledColor ?? HexColor('#EEEEEE'),
        highlightColor: Colors.black.withOpacity(0.05),
        splashColor: Colors.transparent,
        highlightElevation: 0,
        elevation: 0,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),

        //边框样式
        shape: RoundedRectangleBorder(
          //边框
          side: BorderSide(
            style: borderWidth != null ? BorderStyle.solid : BorderStyle.none,
            color: borderColor ?? HexColor('#C3C7CA'),
            width: borderWidth ?? 0.5,
          ),
          //圆角
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: buildChildWidget(),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     width: width,
  //     height: height,
  //     child: TextButton(
  //       style: ButtonStyle(
  //         enableFeedback: false,
  //         // splashFactory: NoSplash.splashFactory,
  //         //背景色
  //         backgroundColor: MaterialStatePropertyAll(
  //           backgroundColor ?? Colors.white,
  //         ),
  //         // minimumSize: MaterialStateProperty.all(
  //         //   const Size(200, 100),
  //         // ),
  //         // maximumSize: MaterialStateProperty.all(
  //         //   Size(MediaQuery.of(context).size.width,
  //         //       height ?? MediaQuery.of(context).size.height),
  //         // ),
  //         minimumSize: MaterialStateProperty.all(
  //           Size(width ?? MediaQuery.of(context).size.width,
  //               height ?? MediaQuery.of(context).size.height),
  //         ),
  //         //圆角
  //         shape: MaterialStateProperty.all(
  //           RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(borderRadius ?? 0),
  //           ),
  //         ),
  //         //边框
  //         side: MaterialStateProperty.all(
  //           borderWidth != null
  //               ? BorderSide(
  //                   style: BorderStyle.solid,
  //                   color: borderColor ?? HexColor('#C3C7CA'),
  //                   width: borderWidth ?? 0.5,
  //                 )
  //               : null,
  //         ),
  //       ),
  //       onPressed: onPressed,
  //       onLongPress: onLongPress,
  //       child: buildChildWidget(),
  //     ),
  //   );
  // }

  /// 获取对齐方式
  IconTextAlignment getIconTextAlignment() {
    if (alignment == null) {
      return IconTextAlignment.iconLeftTextRight;
    }
    return alignment!;
  }

  Widget buildChildWidget() {
    switch (getIconTextAlignment()) {
      // 图在左文字在右
      case IconTextAlignment.iconLeftTextRight:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image ?? Container(),
              SizedBox(
                width: interval,
              ),
              content ?? Container(),
            ],
          );
        }

      //图在右文字在左
      case IconTextAlignment.iconRightTextLeft:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              content ?? Container(),
              SizedBox(
                width: interval,
              ),
              image ?? Container(),
            ],
          );
        }

      //图在上文字在下
      case IconTextAlignment.iconTopTextBottom:
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image ?? Container(),
              SizedBox(
                height: interval,
              ),
              content ?? Container(),
            ],
          );
        }

      // 图在下文字在上
      case IconTextAlignment.iconBottomTextTop:
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              content ?? Container(),
              SizedBox(
                height: interval,
              ),
              image ?? Container(),
            ],
          );
        }
    }
  }
}
