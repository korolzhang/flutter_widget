import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeadersInterceptors extends InterceptorsWrapper{
  var encryptResult = '';
  @override
  Future onRequest(RequestOptions options) async{
    // TODO: implement onRequest
    SharedPreferences _sp = await SharedPreferences.getInstance();
    options.headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      'antappid': '437254009871433728',
      'antplatform': Platform.isIOS ? 'ios' : 'android',
      'authorization': '${_sp.get("accessToken")}',
      'antciphertext': '$encryptResult',
    });

    return super.onRequest(options);
  }
}