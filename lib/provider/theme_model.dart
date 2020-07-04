import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModel extends ChangeNotifier{

  ThemeData themeData;
  ThemeType currentType;
  ThemeModel(ThemeType themeType){
    currentType = themeType;
    if(themeType == ThemeType.dark){
      themeData= ThemeData.dark();
    }else{
      themeData = ThemeData.light();
    }
  }

  void reserve(){
    if(currentType == ThemeType.dark){
      _updateTheme(ThemeType.light);
    }else{
      _updateTheme(ThemeType.dark);
    }
  }
  void _updateTheme(ThemeType type){
    currentType = type;
    if(type == ThemeType.dark){
      themeData = ThemeData.dark();
    }else{
      themeData = ThemeData.light();
    }
    notifyListeners();
  }



}

enum ThemeType{
  light,
  dark,
}