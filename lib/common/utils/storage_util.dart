import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
class StorageUtil {
  ///实例化
  // StorageUtil._internal();
  // factory StorageUtil() => _instance;
  // static final StorageUtil _instance = StorageUtil._internal();

  static late SharedPreferences _preferences;
  static Future<SharedPreferences> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  /// 根据key存储int类型
  static Future<bool> setInt(String key, int value) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.setInt(key, value);
  }

  /// 根据key获取int类型
  static Future<int?> getInt(String key, {int defaultValue = 0}) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.getInt(key) ?? defaultValue;
  }

  /// 根据key存储double类型
  static Future<bool> setDouble(String key, double value) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.setDouble(key, value);
  }

  /// 根据key获取double类型
  static Future<double?> getDouble(String key,
      {double defaultValue = 0.0}) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.getDouble(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型
  static Future<bool> setString(String key, String value) async {
    print('根据key存储字符串类型 ---> $key  $value');
    _preferences = await StorageUtil.getInstance();
    return await _preferences.setString(key, value);
  }

  /// 根据key获取字符串类型
  static Future<String?> getString(String key,
      {String defaultValue = ""}) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.getString(key) ?? defaultValue;
  }

  /// 根据key存储布尔类型
  static Future<bool> setBool(String key, bool value) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.setBool(key, value);
  }

  /// 根据key获取布尔类型
  static Future<bool?> getBool(String key, {bool defaultValue = false}) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.getBool(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型数组
  static Future<bool> setStringList(String key, List<String> value) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.setStringList(key, value);
  }

  /// 根据key获取字符串类型数组
  static Future<List<String>> getStringList(String key,
      {List<String> defaultValue = const []}) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.getStringList(key) ?? defaultValue;
  }

  /// 根据key存储Map类型
  static Future<bool> setMap(String key, Map value) async {
    _preferences = await StorageUtil.getInstance();
    return _preferences.setString(key, json.encode(value));
  }

  /// 根据key获取Map类型
  static Future<Map> getMap(String key) async {
    _preferences = await StorageUtil.getInstance();
    String jsonStr = _preferences.getString(key) ?? "";
    return jsonStr.isEmpty ? Map : json.decode(jsonStr);
  }

  //删除
  static remove(String key) async {
    _preferences = await StorageUtil.getInstance();
    _preferences.remove(key);
  }
}
