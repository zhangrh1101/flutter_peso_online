import 'package:flutter/material.dart';

/// 自定义点击组件
class TouchBox extends StatelessWidget {
  final Color color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width; //图片的宽度
  final double? height; //图片的高度
  final Widget? child;
  final Decoration? decoration;
  final GestureTapCallback? onTap;

  const TouchBox({
    Key? key,
    this.color = Colors.transparent,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.child,
    this.decoration,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///使用Stack是为了给图片盖上一个蒙版
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      child: Container(
        margin: margin,
        child: ColoredBox(
          color: color,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onTap,
            child: Padding(
              padding: padding ?? EdgeInsets.all(0),
              child: Container(
                decoration: decoration,
                width: width,
                height: height,
                alignment: Alignment.center,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
