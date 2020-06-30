import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PinCodeTextFieldPage extends StatefulWidget {
  @override
  _PinCodeTextFieldPageState createState() => _PinCodeTextFieldPageState();
}

class _PinCodeTextFieldPageState extends State<PinCodeTextFieldPage> {
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 6;
  bool hasError = false;
  String errorMessage;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Pin Code Text Field Example"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: PinCodeTextField(
                    controller: controller,
                    ///输入框尺寸
                    pinBoxHeight: (MediaQuery.of(context).size.width - 90) / 6,
                    pinBoxWidth: (MediaQuery.of(context).size.width - 90) / 6,
                    isCupertino: false,
                    maxLength: 6,
                    ///是否隐藏输入的字符,当为true时和maskCharacter配合使用可以显示占位符
                    hideCharacter: false,
                    maskCharacter: "*",
                    highlight: true,
                    ///下面三个属性控制获取焦点的输入框呼吸灯效果
                    highlightAnimation: true,
                    highlightAnimationBeginColor: Colors.red,
                    highlightAnimationEndColor: Colors.blue,
                    ///呼吸灯循环时间
                    highlightAnimationDuration: Duration(seconds: 1),
                    ///获取焦点的输入款的颜色，此属性会被highlightAnimation= true覆盖
                    highlightColor: Colors.green,
                    ///输入框装饰器样式：defaultPinBoxDecoration四周方形边框 ， roundedPinBoxDecoration原型边框，underlinedPinBoxDecoration下划线
                    pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    ///输入文本样式
                    pinTextStyle: TextStyle(fontSize: 20 , color: Colors.deepPurple),
                    ///已经输入过的输入显示的颜色
                    hasTextBorderColor: Colors.deepOrange,
                    ///输入结束时获取输入的内容
                    onDone: (value){
                      print("value==>$value");
                    },
                    ///删除时动画效果
                    pinTextAnimatedSwitcherTransition:ProvidedPinBoxTextAnimation.rotateTransition ,
                    pinTextAnimatedSwitcherDuration: Duration(milliseconds:300),
                    ///错误时边框颜色
                    errorBorderColor: Colors.pinkAccent,
                    ///监听输入了中的文本
                    onTextChanged: (chara){
                      print("chara==>$chara");
                    },
                    ///自动获取焦点
                    autofocus: true,
                    wrapAlignment: WrapAlignment.start,
                    ///输入方向rtl：从右往左输入；；ltr:从左往右输入
                    textDirection: TextDirection.ltr,
                    ///键盘类型
                    keyboardType: TextInputType.number,
                    ///输入框没有焦点时背景色
                    pinBoxColor: Colors.white,
                    ///输入框边框宽度
                    pinBoxBorderWidth: 2,
                    ///输入框边框圆角
                    pinBoxRadius: 2,
                    hideDefaultKeyboard: false,
                    ///输入框已经输入背景色
                    highlightPinBoxColor: Colors.red,

                  ),
                ),
                onLongPress: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
