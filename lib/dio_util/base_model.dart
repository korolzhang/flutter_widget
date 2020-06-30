import 'entity_factory.dart';

class BaseModel<T> {
  int code;
  String message;
  String serverMessage;
  T data;

  BaseModel({this.code, this.message, this.data});

  factory BaseModel.fromJson(json) {

    if(json["Data"] != null){
      return BaseModel(
        code: json["Code"],
        message: json["Message"],
        // data值需要经过工厂转换为我们传进来的类型
        data: EntityFactory.generateOBJ<T>(json["Data"]),
      );
    }else{
      return BaseModel(
        code: json["Code"],
        message: json["Message"],
        // data值需要经过工厂转换为我们传进来的类型
        data: null
      );
    }
  }
}
