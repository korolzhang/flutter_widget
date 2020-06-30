
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_project/dio_util/base_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) {
    RequestOptions _options = response.request;
    String body = response.data.toString();
    print("${_options.contentType}");
    try{
      if(_options.contentType != null && _options.contentType == "text"){
        print("HTTP_RESPONSE_BODY::${response.data}");
      }
      if(response.statusCode == 200){
        if(body.length > 600){
          for(int i = 0 ; i< body.toString().length ; i+= 600){
            if(i+600 < body.toString().length){
              print("HTTP_RESPONSE_BODY::${body.toString().substring(i , i+600)}");
            }else{
              print("HTTP_RESPONSE_BODY::${body.toString().substring(i , body.toString().length)}");
            }
          }
        }else{
          print('HTTP_RESPONSE_BODY::$body');
        }
      }

    }catch(e){
      print('ERROR::$body');
    }
    return super.onResponse(response);
  }
}
