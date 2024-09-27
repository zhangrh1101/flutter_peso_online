import 'package:flutter/material.dart';

class LoginModel<T> {
  LoginModel(this.wechatBind, this.token, this.code);

  bool? wechatBind;
  String? token;
  int? code;

  LoginModel.fromJson(Map<String, dynamic>? json) {
    debugPrint('LoginModel fromJson --- $json');

    wechatBind = json?['wechatBind'] || false;
    token = json?['token'];
    code = json?['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['wechatBind'] = this.wechatBind;
    data['token'] = this.token;
    data['code'] = this.code;

    return data;
  }
}
