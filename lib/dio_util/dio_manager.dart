import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_aes/flutter_aes.dart';
import 'package:flutter_widget_project/dio_util/base_list_moel.dart';
import 'package:flutter_widget_project/dio_util/base_model.dart';
import 'package:flutter_widget_project/dio_util/http_error.dart';
import 'package:flutter_widget_project/dio_util/log_interceptor.dart';
import 'package:flutter_widget_project/dio_util/response_interceptors.dart';

import 'headers_interceptors.dart';

class DioManager{
  static const String BASE_URL = "http://172.16.3.52:8083/V1";
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;

  Dio _dio;

  ///创建单例
  //1.私有静态实例对象
  static final DioManager _dioManager = DioManager._instance();

  //2.创建工厂方法
  factory DioManager() => _dioManager;

  //3.私有的命名式构造方法
  DioManager._instance() {

    if (_dio == null) {
      ///dio配置基本属性
      BaseOptions _options = BaseOptions(
          baseUrl: BASE_URL,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,);
      _dio = Dio(_options);

      ///拦截器
      _dio.interceptors
        ..add(HeadersInterceptors())
        ..add(LogsInterceptor())
        ..add(ResponseInterceptors());
    }
  }

  Future request<T>(
    BuildContext context,
    NetMethod method,
    String path, {
    bool isLoading,
    Map param,
    Map formData,
    Function(T) onSuccess,
    Function(HttpError) onError,
  }) async {
    try {
      ///开始做网络请求
      Response response = await _dio.request(path,
          queryParameters: param,
          data: formData,
          options: Options(method: NetMethodValues[method]));
      if (response != null) {
        ///返回数据转化成对应的model实例
        BaseModel entity = BaseModel<T>.fromJson(response.data);

        ///根据状态码处理相应的状态
        if (entity.code == 0) {
          onSuccess(entity.data);
        } else {
          onError(HttpError(code: entity.code.toString(), message: entity.message));
        }
      } else {
        onError(HttpError(code: "-1", message: "未知错误"));
      }
    } on DioError catch (e) {
      ///异常拦截
      onError(HttpError.dioError(e));
    }
  }

  ///请求列表
  Future requestList<T>(
    BuildContext context,
    NetMethod method,
    String path, {
    bool isLoading,
    Map param,
    Map formData,
    Function(List , dynamic) onSuccess,
    Function(HttpError) onError,
  }) async {
    try {
      Response response = await _dio.request(path,
          queryParameters: param,
          data: formData,
          options: Options(method: NetMethodValues[method]));
      if (response != null) {
        BaseListModel entity = BaseListModel<T>.fromJson(response.data);
        if (entity.code == 0) {
          onSuccess(entity.data , entity.pageResult);
        } else {
          onError(
              HttpError(code: entity.code.toString(), message: entity.message));
        }
      } else {
        onError(HttpError(code: "-1", message: "未知错误"));
      }
    } on DioError catch (error) {
      onError(HttpError.dioError(error));
    }
  }
}

Future<String> aesEncrypt({String jsonStr}) async {
  String result = "";

  if (jsonStr != null && jsonStr.length > 0) {
    String _key = 'AhI7uzomNkSMxrbJ0LOlepsFCHw6PyUR';
    String _iv = '76TIcHWRKbV4EFop';

    result = base64.encode(await FlutterAes.encrypt(
        utf8.encode("$jsonStr"), utf8.encode(_key), utf8.encode(_iv)));
  }

  return result;
}


enum NetMethod { GET, POST, DELETE, PUT }

const NetMethodValues = {
  NetMethod.GET: "get",
  NetMethod.POST: "post",
  NetMethod.DELETE: "delete",
  NetMethod.PUT: "put"
};
