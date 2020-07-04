import 'dart:io';

import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_project/page_one.dart';
import 'package:flutter_widget_project/page_two.dart';
import 'package:flutter_widget_project/provider/theme_model.dart';
import 'package:flutter_widget_project/widget/radio_view.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'dio_util/constant.dart';
import 'flutter_staggered_grid_page.dart';

void main() {
  final game = MyGame();

  runApp(
    FutureProvider<String>(
      create: (_){
        return Future.delayed(Duration(seconds: 5),()=>"hello FutureProvider");
      },
      initialData: "哈哈",
      child: StreamProvider<int>(
        create: (context) {
          return Stream.periodic(Duration(milliseconds: 300), (v){
            return v*2;
          }).take(10);
        },
        initialData: -1,
        lazy: false,
        updateShouldNotify: (_, __) => true,
        child: ChangeNotifierProvider<ThemeModel>(
          create: (_) {
            return ThemeModel(ThemeType.dark);
          },
          child: MyApp(),
        ),
      ),
    ),
  );
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class Palette {
  static const PaletteEntry white = BasicPalette.white;
  static const PaletteEntry red = PaletteEntry(Color(0xFFFF0000));
  static const PaletteEntry blue = PaletteEntry(Color(0xFF0000FF));
}

class Square extends PositionComponent with HasGameRef<MyGame> {
  static const SPEED = 0.25;

  @override
  void resize(Size size) {
    x = size.width / 2;
    y = size.height / 2;
  }

  @override
  void render(Canvas c) {
    prepareCanvas(c);

    c.drawRect(Rect.fromLTWH(0, 0, width, height), Palette.white.paint);
    c.drawRect(const Rect.fromLTWH(0, 0, 3, 3), Palette.red.paint);
    c.drawRect(Rect.fromLTWH(width / 2, height / 2, 3, 3), Palette.blue.paint);
  }

  @override
  void update(double t) {
    super.update(t);
    angle += SPEED * t;
    angle %= 2 * math.pi;
  }

  @override
  void onMount() {
    width = height = gameRef.squareSize;
    anchor = Anchor.center;
  }
}

class MyGame extends BaseGame {
  final double squareSize = 128;
  bool running = true;

  MyGame() {
    add(Square());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeModel>(context).themeData,
      home: PageTwo(),
    );
  }
}

///快捷输入stu会提示生成StatefulWidget有状态的组件
///快捷输入stless会提示生成StatelessWidget无状态的组件
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ///页面构建的基础组件
    ///其中主要包含appbar , body两个常用属性
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.yellow,
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.android),
          )
        ],
        centerTitle: true,
        title: Text(
          "Hello world!",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        child: Center(
          child: Text("hello world"),
        ),
      ),
    );
  }
}
