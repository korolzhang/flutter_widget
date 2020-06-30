import 'package:flutter/material.dart';
import 'package:flutter_widget_project/page_one.dart';
import 'package:flutter_widget_project/page_three.dart';
import 'package:flutter_widget_project/page_two.dart';


///普通的tabbar+tabbarview
class TabViewOne extends StatefulWidget {
  @override
  _TabViewOneState createState() => _TabViewOneState();
}

class _TabViewOneState extends State<TabViewOne> {
  List<Tab> _tabs = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      Tab(icon: Icon(Icons.directions_car), text: "汽车"),
      Tab(icon: Icon(Icons.flight), text: "飞机"),
      Tab(icon: Icon(Icons.local_shipping), text: "卡车"),
      Tab(icon: Icon(Icons.camera_alt), text: "相机"),
      Tab(icon: Icon(Icons.camera_alt), text: "相机"),
      Tab(icon: Icon(Icons.camera_alt), text: "相机"),
      Tab(icon: Icon(Icons.camera_alt), text: "相机"),
    ];
  }


  Widget bodyView({bool isSame = false}){
    Widget tempWidget;
    if(isSame){
      tempWidget = TabBarView(
        children: _tabs.map((item) => Container(
          child: Text(
            item.text,
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ))
            .toList(),
      );
    }else{
      tempWidget = TabBarView(
        children: [
          PageOne(),
          Container(
            child: Text("2323"),
          ),
          Container(
            child: Image.network("https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1906469856,4113625838&fm=26&gp=0.jpg"),
          ),
          Container(
            child: Image.asset("assets/images/c.jpg"),
          ),
          Container(
            child: Image.asset("assets/images/c.jpg"),
          ),
          Container(
            child: Image.asset("assets/images/c.jpg"),
          ),
          Container(
            child: Image.asset("assets/images/c.jpg"),
          ),
        ],
      );
    }
    return tempWidget;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabViewOne"),
          bottom: TabBar(
            isScrollable: true,
            tabs: _tabs,
            labelPadding: EdgeInsets.symmetric(horizontal: 30),
          ),
        ),
        body: bodyView(isSame: false),
      ),
    );
  }
}
