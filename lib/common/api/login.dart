import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';

/// 登录注册
class LoginApi {
  /// 一键登录
  static oncelogin({Map<String, Object>? params}) async {
    var response = await HttpUtils().post(
      '/api/users/one_click_login',
      params,
      loading: true,
      isFormData: true,
    );
    return response;
  }

  /// 验证码登录
  static codelogin({Map<String, Object>? params}) async {
    var response = await HttpUtils().post(
      '/api/users/login',
      params,
      loading: true,
      isFormData: true,
    );
    debugPrint('验证码登录 0000---> $response');
    return response;
  }

  /// 微信绑定
  static bindWechat({Map<String, Object>? params}) async {
    var response = await HttpUtils().post(
      '/api/users/bind_wechat',
      params,
      loading: true,
      isFormData: true,
    );
    return response;
  }

  ///微信Token
  static getWechatToken({params}) async {
    var response = await HttpUtils().dio.get(
          'https://api.weixin.qq.com/sns/oauth2/access_token',
          queryParameters: params,
        );
    return response;
  }

  ///微信用户信息
  static getWechatInfo({params}) async {
    var response = await HttpUtils().dio.get(
          'https://api.weixin.qq.com/sns/userinfo',
          queryParameters: params,
        );
    return response;
  }

  /// 测试
  static test({Map<String, Object>? params}) async {
    var response = await HttpUtils().get(
      'http://timor.tech/api/holiday/year',
      params,
      loading: true,
    );
    // debugPrint('login aaa---> ${response!.toJson()}');
    return response;
  }
}
