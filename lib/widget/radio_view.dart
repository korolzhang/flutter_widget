import 'package:flutter/material.dart';

class RadioView extends StatefulWidget {
  @override
  _RadioViewState createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  int groupValue = 1;

  onChange(value) {
    if (mounted)
      setState(() {
        groupValue = value;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: <Widget>[
              Row(
                ///主轴（x）
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    ///给单选按钮设置一个标签（名字），方便知道选中是哪一个
                    value: 1,

                    ///当前选中的按钮的标签
                    groupValue: groupValue,

                    ///监听用户操作事件，选中了哪一个，T就是value标签值
                    onChanged: (T) => onChange(T),
                  ),
                  Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (T) => onChange(T),
                  ),
                  Radio(
                    value: 3,
                    groupValue: groupValue,
                    onChanged: (T) => onChange(T),
                  ),
                ],
              ),
              Text("当前选中的radio的value==>$groupValue"),
            ],
          ),
        ),
      ),
    );
  }
}

///单选列表
class RadioListTileView extends StatefulWidget {
  @override
  _RadioListTileViewState createState() => _RadioListTileViewState();
}

class _RadioListTileViewState extends State<RadioListTileView> {
  String defaultValue = "A";

  onChange(value) {
    if (mounted)
      setState(() {
        defaultValue = value;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioListTileView"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: RadioListTile<String>(
              value: "A",
              title: Text("A选项"),
              subtitle: Text(
                "A选项的二级标签项",
                style: TextStyle(fontSize: 16),
              ),
              dense: false,
              isThreeLine: true,
//              secondary: Text("这是一个居右的组件"),
              secondary: Icon(Icons.send),
              selected: true,
              groupValue: defaultValue,
              onChanged: (v) => onChange(v),
            ),
          ),
          Container(
            color: Colors.green,
            child: RadioListTile<String>(
              value: "B",
              title: Text("B选项"),
              activeColor: Colors.yellow,
              subtitle: Text(
                "B选项的二级标签",
                style: TextStyle(fontSize: 16),
              ),
              dense: true,
              groupValue: defaultValue,
              onChanged: (v) => onChange(v),
            ),
          ),
          RadioListTile<String>(
            value: "C",
            title: Text("C选项"),
            subtitle: Text(
              "C选项的二级标签",
              style: TextStyle(fontSize: 16),
            ),
            groupValue: defaultValue,
            onChanged: (v) => onChange(v),
          )
        ],
      ),
    );
  }
}


///文本输入框
class TextFieldView extends StatefulWidget {
  @override
  _TextFieldViewState createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {

  ///必须设置的属性，controller包含了输入的文本
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFieldView"),
      ),
      body: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "hintText"
        ),
      ),
    );
  }
}

