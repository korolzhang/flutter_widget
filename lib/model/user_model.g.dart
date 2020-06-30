// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    Token: json['Token'] as String,
    Member: json['Member'] == null
        ? null
        : UserModel.fromJson(json['Member'] as Map<String, dynamic>),
  );
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    Id: json['Id'] as String,
  );
}
