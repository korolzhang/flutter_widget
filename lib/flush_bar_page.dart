import 'package:flushbar/flushbar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

class FlushBarPage extends StatefulWidget {
  @override
  _FlushBarPageState createState() => _FlushBarPageState();
}

class _FlushBarPageState extends State<FlushBarPage>
    with TickerProviderStateMixin {
  Flushbar<List<String>> flush;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  TextFormField getTextFormField(String text) {
    return TextFormField(
      initialValue: text,
      style: TextStyle(color: Colors.white),
      maxLength: 100,
      maxLines: 1,
      maxLengthEnforced: true,
      decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          icon: Icon(
            Icons.label,
            color: Colors.grey[500],
          ),
          border: UnderlineInputBorder(),
          helperText: "Helper Text",
          helperStyle: TextStyle(color: Colors.grey),
          labelText: "Label Text",
          labelStyle: TextStyle(color: Colors.grey)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              MaterialButton(
                child: Text("基本使用"),
                color: Colors.blue,
                onPressed: () {
                  Flushbar(
                    title: "Flushbar基本使用",
                    //自定义title的样式，设置了之后title属性不显示,也可以使用RichText展示富文本
                    titleText: Text(
                      "Flushbar基本使用titleText",
                      style: TextStyle(color: Colors.white),
                    ),
                    message: "Flushbar基本使用在屏幕底部弹出喔！！！",
                    //自定义messageText的样式，设置了之后message属性不显示
                    messageText: Text(
                      "Flushbar基本使用messageText",
                      style: TextStyle(color: Colors.red),
                    ),
                    //显示持续时间，到时间自动消失
                    duration: Duration(seconds: 3),
                    icon: Icon(
                      Icons.timer,
                      color: Colors.white,
                    ),
                    //icon是否显示呼吸灯效果
                    shouldIconPulse: false,
                    //Flushbar宽度，默认屏幕宽度
                    maxWidth: 400,
                    margin: EdgeInsets.only(
                        left: 20, top: 10, bottom: 20, right: 10),
                    padding: EdgeInsets.all(10),
                    //圆角
                    borderRadius: 4,
                    //边宽颜色
                    borderColor: Colors.green,
                    //边框宽度
                    borderWidth: 2,
                    backgroundColor: Colors.blue,
                    leftBarIndicatorColor: Colors.yellow,
                    //阴影
                    boxShadows: [
                      BoxShadow(
                        color: Colors.redAccent,
                        offset: Offset(0, 2),
                        blurRadius: 3,
                      )
                    ],
                    //背景渐变色，backgroundColor会变得无效
                    backgroundGradient: LinearGradient(
                      colors: [
                        Colors.cyanAccent,
                        Colors.red,
                        Colors.lightBlueAccent
                      ],
                    ),
                    mainButton: FlatButton(
                      color: Colors.deepPurpleAccent,
                      onPressed: () => print("clap"),
                      child: Text(
                        "CLAP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: (value) => print("value==>$value"),
                    //多个Flushbar重复出现时，是否可手动滑动组件除掉上层的那个
                    isDismissible: true,
                    //左右滑动消除组件
                    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                    //Flushbar展示位置
                    flushbarPosition: FlushbarPosition.TOP,
                    flushbarStyle: FlushbarStyle.FLOATING,
                    //展示时的动画效果
                    forwardAnimationCurve: Curves.easeOut,
                    //隐藏时的动画效果
                    reverseAnimationCurve: Curves.fastOutSlowIn,
                    //展示Flushbar需要的时间（从隐藏到显示）
                    animationDuration: Duration(milliseconds: 1000),
                    //是否展示进度条
                    showProgressIndicator: true,
                    progressIndicatorBackgroundColor: Colors.red,
                  )
                    ..show(context)
                    ..onStatusChanged = (FlushbarStatus status) {
                      switch (status) {
                        case FlushbarStatus.SHOWING:
                          {
                            print("SHOWING");
                            break;
                          }
                        case FlushbarStatus.IS_APPEARING:
                          {
                            print("IS_APPEARING");
                            break;
                          }
                        case FlushbarStatus.IS_HIDING:
                          {
                            print("IS_HIDING");
                            break;
                          }
                        case FlushbarStatus.DISMISSED:
                          {
                            print("DISMISSED");
                            break;
                          }
                      }
                    };
                },
              ),
              MaterialButton(
                child: Text("输入使用"),
                color: Colors.blue,
                onPressed: (){
                  flush = Flushbar<List<String>>(
                    userInputForm: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          getTextFormField("Initial Value"),
                          getTextFormField("Initial Value Two"),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: MaterialButton(
                                textColor: Colors.amberAccent,
                                child: Text("SUBMIT"),
                                onPressed: () {
                                  flush.dismiss([_controller1.value.text, _controller2.value.text]);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                    ..show(context).then((result) {
                      if (result != null) {
                        String userInput1 = result[0];
                        String userInput2 = result[1];
                      }
                    });
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text("click"),
                onPressed: () {
                  Flushbar(
                    title: "定制使用",
                    message:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    flushbarPosition: FlushbarPosition.TOP,
                    flushbarStyle: FlushbarStyle.FLOATING,
                    reverseAnimationCurve: Curves.decelerate,
                    forwardAnimationCurve: Curves.elasticOut,
                    backgroundColor: Colors.red,
                    boxShadows: [
                      BoxShadow(
                          color: Colors.blue[800],
                          offset: Offset(0.0, 2.0),
                          blurRadius: 3.0)
                    ],
                    backgroundGradient:
                        LinearGradient(colors: [Colors.blueGrey, Colors.black]),
                    isDismissible: false,
                    duration: Duration(seconds: 4),
                    icon: Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                    ),
                    mainButton: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "CLAP",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                    showProgressIndicator: true,
                    progressIndicatorBackgroundColor: Colors.blueGrey,
                    titleText: Text(
                      "Hello Hero",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.yellow[600],
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                    messageText: Text(
                      "You killed that giant monster in the city. Congratulations!",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.green,
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                  )..show(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Ticker createTicker(onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }
}
