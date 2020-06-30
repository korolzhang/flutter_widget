import 'package:dio/dio.dart';
import 'package:flutter_widget_project/dio_util/http_error.dart';

///日志拦截器
class LogsInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err) {
    print('请求异常信息: ' + HttpError(code: err.type.toString() ,message:  err.message).toString());
    return super.onError(err);
  }

  @override
  Future onRequest(RequestOptions options) {
    print("请求API：${options.baseUrl}${options.path}");
    print('请求头: ' + options.headers.toString());
    if (options.data != null) {
      print('请求参数: ' + options.data.toString());
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }
}
