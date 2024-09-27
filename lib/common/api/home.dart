import 'package:flutter_peso_online/common/utils/utils.dart';

class HomeApi {
  /// 轮播图
  static requestSwiper({Map<String, Object>? params}) async {
    var response = await HttpUtils().get(
      'https://api.bilibili.com/x/web-interface/ranking/region?rid=1&day=3',
      params,
      loading: true,
    );
    // debugPrint('login aaa---> ${response!.toJson()}');
    return response;
  }
}
