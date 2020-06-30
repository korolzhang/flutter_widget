import 'package:flutter_widget_project/dio_util/entity_factory.dart';
import 'package:flutter_widget_project/model/page_option_model.dart';

class BaseListModel<T>{
  int code;
  String message;
  dynamic pageResult;
  List<T> data;

  BaseListModel({this.code, this.message, this.data ,this.pageResult});

  factory BaseListModel.fromJson(json){
    List<T> mData = List();
    if (json["Data"] != null && json["Data"]["Data"] != null) {
      (json["Data"]["Data"] as List).forEach((element) {
        mData.add(EntityFactory.generateOBJ<T>(element));
      });
    }


    if(json["Data"] != null){
      return BaseListModel(
          code: json["Code"],
          message: json["Message"],
          data: mData,
          pageResult: EntityFactory.generateOBJ(json["Data"]["PagingResult"])
      );
    }else{
       return BaseListModel(
          code: json["Code"],
          message: json["Message"],
          data: null,
      );
    }


  }
}