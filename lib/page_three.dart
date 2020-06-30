import 'package:fl_radial_menu/fl_radial_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final mainItems = [
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.red,
        () => print('red')),
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.green,
        () => print('green')),
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.blue,
        () => print('blue')),
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.yellow,
        () => print('yellow')),
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.purple,
        () => print('purple')),
  ];

  final fabItems = [
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.red,
        () => print('red')),
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.green,
        () => print('green')),
    RadialMenuItem(Icon(FontAwesome.music, color: Colors.white), Colors.blue,
        () => print('blue')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FLutterRadialMenu"),
        ),
        body: Center(
          child: RadialMenu(
            mainItems,
            isClockwise: false,
            childDistance: 100,//item菜单散开的距离
            iconRadius: 30,//展开的组件大小
            mainButtonRadius: 40,//中间菜单的大小
            dialOpenDuration: 500,//展开，收缩的时间
            curve: Curves.easeInBack,//展开收缩起来的动画曲线形式
            fanout: Fanout.top,//展开时相对中间icon的位置
          ),
        ));
  }
}
