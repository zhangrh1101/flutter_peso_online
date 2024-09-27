import 'package:flutter/material.dart';

class BaseModel<T> {
  BaseModel(this.status, this.message, this.data);

  int? code;
  int? status;
  String? message;
  T? data;

  int? page;
  int? pageSize;

  BaseModel.fromJson(Map<String, dynamic>? json) {
    debugPrint('BaseModel fromJson --- $json');

    code = json?['code'];
    status = json?['status'];
    message = json?['message'];

    page = json?['page'];
    pageSize = json?['pageSize'];

    data = json?['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;

    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}
