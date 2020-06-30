import 'package:flutter_widget_project/model/entrust_search_model.dart';
import 'package:flutter_widget_project/model/user_model.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    }
//可以在这里加入任何需要并且可以转换的类型，例如下面
    else if (T.toString() == "LoginModel") {
      return LoginModel.fromJson(json) as T;
    }
    else if (T.toString() == "EntrustModel") {
      return EntrustModel.fromJson(json) as T;
    }
    else if (T.toString() == "EntrustListModel") {
      return EntrustListModel.fromJson(json) as T;
    }
    else {
      return json as T;
    }
  }
}
