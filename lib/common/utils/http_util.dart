import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_peso_online/common/api/api.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';
import 'package:flutter_peso_online/common/constants/constants.dart'
    hide Response, MultipartFile, FormData;

/* 网络请求工具 */
final httpUtils = HttpUtils();

class HttpUtils {
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  ///声明
  late Dio dio;

  static final HttpUtils _instance = HttpUtils._internal();
  factory HttpUtils() => _instance;

  HttpUtils._internal() {
    debugPrint('Dio构造函数。。。。。。。。。。。。。。');

    dio = Dio();
    dio.options.baseUrl = Api.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);

    /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
    /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
    /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
    /// 就会自动编码请求体.
    dio.options.contentType = 'application/json; charset=utf-8';
    dio.interceptors.add(
      // 输出响应内容体
      LogInterceptor(
        request: false,
        requestHeader: true,
        responseHeader: false,
        responseBody: false,
      ),
      // InterceptorsWrapper(
      //   onRequest: (RequestOptions options) {
      //     return options; //continue
      //   },
      //   onResponse: (Response response) {
      //     return response; // continue
      //   },
      //   onError: (DioError e) {
      //     return eInfo;
      //   },
      // ),
    );
  }

  ///GET
  // Future<Response?> get(String url, Map<String, Object>? map,
  //     {loading = true}) async {
  //   return await dio.get(url, queryParameters: map);
  // }

  ///POST
  // Future<Response?> post(String url, Map<String, Object>? map,
  //     {loading = true}) async {
  //   return await dio.post(url, queryParameters: map);
  // }

  ///PUT
  // Future<Response?> put(String url, Object? data, {loading = true}) async {
  //   return await dio.put(url, data: data);
  // }

  ///GET
  Future<BaseModel?> get(String url, Map<String, dynamic>? params,
      {loading = false}) async {
    return await getResponse(
        method: GET, url, params: params, loading: loading);
  }

  ///POST
  Future<BaseModel?> post(String url, Map<String, dynamic>? params,
      {loading = false, isFormData = false}) async {
    return await getResponse(
      method: POST,
      url,
      params: params,
      loading: loading,
      isFormData: isFormData,
    );
  }

  ///PUT
  Future<BaseModel?> put(String url, Object? params,
      {loading = false, formData = false}) async {
    return await getResponse(
        method: PUT, url, params: params, loading: loading);
  }

  Future<BaseModel?> delete(String url, Object? params,
      {loading = false, formData = false}) async {
    ///定义请求参数
    params = params ?? <String, dynamic>{};
    return await getResponse(
        method: DELETE, url, params: params, loading: loading);
  }

  ///上传文件 fileName 文件名字 fileDir 文件路径  formData 自定义参数
  Future<BaseModel?> uploadFile(String url, String? fileName, String fileDir,
      Map<String, dynamic> formData,
      {loading = false}) async {
    try {
      formData['file'] =
          await MultipartFile.fromFile(fileDir, filename: fileName);

      return await getResponse(
        method: POST,
        url,
        params: formData,
        loading: loading,
      );
      // return = await dio.post(url, data: formData);
    } catch (e) {
      return null;
    }
  }

  ///下载文件 downLoadPath下载路径，
  ///fileName 下载之后生成的文件名字，
  ///onProgress 下载进度
  ///onFinish 下载完成
  downLoad(
      String downLoadPath,
      String fileName,
      Function(int count, int total) onProgress,
      Function(String path) onFinish,
      Function(DioException e) onError) async {
    final directory = await getTemporaryDirectory();
    String localPath = directory.path;
    String savePath = "$localPath/$fileName";
    String apkUrl = downLoadPath;

    ///参数一 文件的网络储存URL
    ///参数二 下载的本地目录文件
    ///参数三 下载监听
    try {
      await dio.download(apkUrl, savePath,
          onReceiveProgress: (received, total) {
        if (total != -1) {
          ///当前下载的百分比例
          debugPrint("${(received / total * 100).toStringAsFixed(0)}%");
          onProgress(received, total);
        }
      });
      onFinish(savePath);
      debugPrint(savePath);
    } catch (e) {
      // 异常处理代码
      return null;
    }
  }

  Future<BaseModel<T>> getResponse<T>(
    String url, {
    required String method,
    params,
    loading,
    isFormData = false,
  }) async {
    //这里指定response自动转成map,不指定的话有可能是String类型
    Response<Map<String, dynamic>>? response;

    ///加入头部Token
    var token = await StorageUtil.getString(Constants.AuthorizationToken);
    debugPrint('加入头部Token Authorization ---> $token');
    if (token != null) {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
    }

    debugPrint('请求接口 --- $method  $url');
    debugPrint('请求参数 --- $params');

    if (loading) {
      Toast.showLoading();
    }

    try {
      switch (method) {
        case GET:
          response = await dio.get(url,
              queryParameters: params ?? <String, dynamic>{});
          break;
        case POST:
          if (isFormData) {
            params = FormData.fromMap(params);
          }
          response = await dio.post(url, data: params ?? <String, dynamic>{});
          break;
        case PUT:
          response = await dio.put(url,
              queryParameters: params ?? <String, dynamic>{});
          break;
        case DELETE:
          response = await dio.delete(url,
              queryParameters: params ?? <String, dynamic>{});
          break;
        default:
          break;
      }
    } on DioException catch (e) {
      formatError(e);
    }

    if (loading) {
      Toast.dissmiss();
    }

    debugPrint('请求结果 --- $response');

    //200代表网络请求成功
    if (response!.statusCode == 200 || response.statusCode == 0) {
      /// 将后台的data字段转成自己想要的数据/数据集,code根据后端实际返回进行判断访问结果
      BaseModel<T> model = BaseModel.fromJson(response.data);
      debugPrint('请求成功 --- ${model.toJson()}');
      if (model.status == 200 || model.code == 0) {
        return model;
      } else {
        Toast.showText(model.message!);
      }
    } else if (response.statusCode == 400) {
      // var message = response.statusMessage ?? '请求失败';
      // Toast.showText(message);
    } else if (response.statusCode == 401) {
      Toast.showText("当前登录已过期，请重新登录");
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAllNamed(AppPages.LoginPage);
      });
    } else if (response.statusCode == 403) {
      Toast.showText("暂无权限访问，请联系管理员");
    } else {
      Toast.dissmiss();
      Toast.showText("系统内部异常");
    }
    throw Exception('${response.statusCode}+${response.statusMessage}');
  }

  void formatError(DioException e) {
    debugPrint('请求错误 --- ${e.message}');

    Toast.dissmiss();
    if (e.message != null) {
      Toast.showText(e.message.toString());
    }
  }
}
