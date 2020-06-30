// ignore_for_file: non_constant_identifier_names,library_prefixes
import 'package:flutter_widget_project/dio_util/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';


/*
* 登录接口请求成功的返回值
*
* */

@JsonSerializable(createToJson: false)
class LoginModel{
  String Token;
  UserModel Member;

  LoginModel({this.Token , this.Member});


  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  LoginModel from(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}


@JsonSerializable(createToJson: false)
class UserModel {
  final String Id;


  UserModel({
    this.Id,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel from(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
