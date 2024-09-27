import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';

/// 1像素 Divider
Widget dividerPx1({Color bgColor = Colors.transparent}) {
  return Divider(
    height: kPixel(1),
    color: bgColor,
  );
}

/// 10像素 Divider
Widget dividerPx10({Color bgColor = Colors.transparent}) {
  return Divider(
    height: kPixel(10),
    color: bgColor,
  );
}
