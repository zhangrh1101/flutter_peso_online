import 'package:flutter/material.dart';

class TextUtils {
  /// 反转字符串
  static String reverse(String text) {
    if (text.isEmpty) {
      return '';
    }
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      var codeUnitAt = text.codeUnitAt(i);
      sb.writeCharCode(codeUnitAt);
    }
    return sb.toString();
  }

  /// 每隔 x位 加 pattern。比如用来格式化银行卡
  static String formatDigitPattern(String text,
      {int digit = 4, String pattern = ' '}) {
    text = text.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
      return '${match.group(0)}$pattern';
    });
    if (text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String text,
      {int digit = 4, String pattern = ' '}) {
    String temp = reverse(text);
    temp = formatDigitPattern(temp, digit: digit, pattern: pattern);
    temp = reverse(temp);
    return temp;
  }

  /// 每隔4位加空格
  static String formatSpace4(String text) {
    return formatDigitPattern(text);
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  static String formatComma3(Object num) {
    return formatDigitPatternEnd(num.toString(), digit: 3, pattern: ',');
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。double型。
  static String formatDoubleComma3(Object num,
      {int digit = 3, String pattern = ','}) {
    List<String> list = num.toString().split('.');
    String left =
        formatDigitPatternEnd(list[0], digit: digit, pattern: pattern);
    String right = list[1];
    return '$left.$right';
  }

  /// 隐藏手机号中间n位
  static String hideNumber(String phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    return phoneNo.replaceRange(start, end, replacement);
  }

  /// 替换字符串中的数据
  static String replace(String text, Pattern from, String replace) {
    return text.replaceAll(from, replace);
  }

  ///防止文字自动换行
  static String autoLines(String text) {
    // ignore: unnecessary_null_comparison
    if (text.isEmpty) {
      return '';
    }
    return Characters(text).join('\u{200B}');
  }
}
