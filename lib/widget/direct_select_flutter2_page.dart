import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';

class DirectSelectFlutter2Page extends StatefulWidget {
  @override
  _DirectSelectFlutter2PageState createState() =>
      _DirectSelectFlutter2PageState();
}

class _DirectSelectFlutter2PageState extends State<DirectSelectFlutter2Page> {
  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text("$value" ,);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }

  List<String> _ballList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ballList = ["篮球", "足球", "排球", "冰球", "水球"];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("direct_select_flutter"),
      ),

      ///注意：最外层一定是DirectSelectContainer，要不然会报错
      body: DirectSelectContainer(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Container(
                  decoration: _getShadowDecoration(),
                  child: Card(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                  child: DirectSelectList<String>(

                                    ///取值
                                      values: _ballList,

                                      ///开始滑动时监听
                                      onUserTappedListener: () {
                                        print("onUserTappedListener");
                                      },

                                      ///设置默认值
                                      defaultItemIndex: 0,

                                      ///设置item样式
                                      itemBuilder: (String value) =>
                                          getDropDownMenuItem(value),

                                      ///选择过程中的组件装饰器
                                      focusedItemDecoration: _getDslDecoration(),

                                      ///选中值监听
                                      onItemSelectedListener: (item, index,
                                          context) {
//                                setState(() {
//                                  selectedFoodVariants = index;
//                                });
                                      }),
                                  padding: EdgeInsets.only(left: 22))),
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: _getDropdownIcon(),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
