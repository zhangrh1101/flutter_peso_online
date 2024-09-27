import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:flutter_peso_online/common/api/api.dart';

///微信
final Fluwx fluwx = Fluwx();

//订阅者回调签名
typedef EventCallback = void Function(dynamic arg);
late Function(WeChatResponse) listener;

///微信SDK
class WechatTool {
  static init() async {
    await fluwx.registerApi(
      appId: 'wx91761c5e0810e688',
      doOnAndroid: true,
      doOnIOS: true,
      universalLink: 'https://www.imlinkapp.com',
    );
    var result = await fluwx.isWeChatInstalled;
    debugPrint('WechatTool is installed --- $result');
  }

  static addSubscriber() async {
    listener = (response) {
      if (response is WeChatAuthResponse) {
        print("WeChatAuthResponse --- ${response.isSuccessful}");
        print("WeChatAuthResponse response--- ${response.toRecord()}");

        // getWechatToken(response.code);
        bindWechat(response.code);
      }
    };

    fluwx.addSubscriber(listener);
  }

  static removeSubscriber() async {
    fluwx.removeSubscriber(listener);
  }

  static void wxLogin() {
    fluwx
        .authBy(
            which: NormalAuth(
                scope: 'snsapi_userinfo', state: 'wechat_sdk_demo_test'))
        .then((data) {
      if (!data) {
        print("没有安装微信，请安装微信后使用该功能");
      } else {
        print("微信登录回调 --- $data");
      }
    }).catchError((e) {
      print('weChatLogin error $e');
    });
  }

  static getWechatToken(code) async {
    try {
      var response = await LoginApi.getWechatToken(
        params: {
          'appid': 'wx91761c5e0810e688',
          'secret': '11f161bd94835442538c15b99d70cb28',
          'code': code,
          'grant_type': 'authorization_code'
        },
      );

      var result = json.decode(response.data);
      debugPrint('微信授权信息 succese---> $result');
      debugPrint('微信授权信息 succese 000---> ${result.access_token}');

      getWechatInfo(result['access_token'], result['openid']);
    } catch (e) {
      debugPrint('微信授权信息 error ---> $e');
    }
  }

  static getWechatInfo(accessToken, openId) async {
    debugPrint('微信用户信息 参数---> $accessToken $openId');
    try {
      var response = await LoginApi.getWechatInfo(
        params: {
          'access_token': accessToken,
          'openid': openId,
        },
      );
      var result = json.decode(response.data);
      debugPrint('微信用户信息 succese---> $result');
    } catch (e) {
      debugPrint('微信用户信息 error ---> $e');
    }
  }

  ///绑定微信
  static bindWechat(code) async {
    debugPrint('微信绑定 code ---> $code');

    try {
      var response = await LoginApi.bindWechat(
        params: {
          'code': code,
        },
      );
      debugPrint('微信绑定 succese---> $response');

      // LoginModel model = LoginModel.fromJson(response.data);
      // debugPrint('微信绑定 succese---> ${model.toJson()}');

      // if (model.wechatBind!) {
      //   Toast.showText('绑定成功');
      // } else {
      //   Toast.showText('绑定失败');
      // }
    } catch (e) {
      debugPrint('微信绑定 error ---> $e');
    }
  }
}
