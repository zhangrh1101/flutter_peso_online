// 验证
import 'dart:convert';
import 'dart:core';

class ValidatorUtil {
  /// 判断文本是不是Json
  static bool isJson(String? text) {
    var decodeSucceeded = false;
    try {
      var x = json.decode(text!) as Map<String, dynamic>;
      decodeSucceeded = true;
    } on FormatException catch (e) {
      return false;
    }
    return decodeSucceeded;
  }

  /// 判断文本内容是否为空
  static bool isEmpty(String? text) {
    return text == null || text.isEmpty;
  }

  /// 判断字符串是以xx开头
  static bool startsWith(String? str, Pattern prefix, [int index = 0]) {
    return str != null && str.startsWith(prefix, index);
  }

  /// 判断一个字符串以任何给定的前缀开始
  static bool startsWithAny(String? str, List<Pattern> prefixes,
      [int index = 0]) {
    return str != null &&
        prefixes.any((prefix) => str.startsWith(prefix, index));
  }

  /// 判断字符串中是否包含xx
  static bool contains(String? str, Pattern searchPattern,
      [int startIndex = 0]) {
    return str != null && str.contains(searchPattern, startIndex);
  }

  /// 判断是否为手机号
  static bool isPhone(String? text) {
    if (text == null || text.isEmpty) {
      return false;
    }

    RegExp regex = RegExp(r'^[1-9][0-9]{10}$');
    return regex.hasMatch(text);
  }

  /// 判断是否为网络地址
  static bool isHttpUrl(String url) {
    var uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }
}
