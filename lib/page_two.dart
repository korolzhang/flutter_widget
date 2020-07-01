import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_project/dio_page.dart';
import 'package:flutter_widget_project/flush_bar_page.dart';
import 'package:flutter_widget_project/page_three.dart';
import 'package:flutter_widget_project/pin_code_text_field_page.dart';
import 'package:flutter_widget_project/slide_container_page.dart';
import 'package:flutter_widget_project/snap_list_page.dart';
import 'package:flutter_widget_project/stream/broadcast_stream_page.dart';
import 'package:flutter_widget_project/stream/net_status_page.dart';
import 'package:flutter_widget_project/stream/stream_one_page.dart';
import 'package:flutter_widget_project/stream/stream_oprote_page.dart';
import 'package:flutter_widget_project/tabbar/tab_view_one.dart';
import 'package:flutter_widget_project/tabbar/tab_view_two.dart';
import 'package:flutter_widget_project/tinder_card_page.dart';
import 'package:flutter_widget_project/widget/direct_select_flutter2_page.dart';
import 'package:flutter_widget_project/widget/permission_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'direct_select_flutter_page.dart';
import 'flutter_typed_head_page.dart';
import 'folding_cell_page.dart';
import 'liquid_pull_refresh_page.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  ///注意：根据不同平台注册好权限

  ///1。创建实例
  Contact _contact = new Contact(fullName: "", phoneNumber: "");
  final EasyContactPicker _contactPicker = new EasyContactPicker();
  List _list = [];

  ///2.获取单个联系人
  _getContactData() async {
    Contact contact = await _contactPicker.selectContactWithNative();
    setState(() {
      _contact = contact;
      print("contact==>${_contact.toString()}");
    });
  }

  ///获取联系人列表
  _getContactDataList() async {
    List<Contact> list = await _contactPicker.selectContacts();
    setState(() {
      _list = list;
      print("list==>${_list.toString()}");
    });
  }

  ///获取权限
  _getPermission(Permission permission) async{
//    var hasOpen = openAppSettings();
//    print("hasOpen==>$hasOpen");

      final status = await permission.request();
      print("status==>$status");

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPermission(Permission.contacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TWO-PAGE"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlatButton(
              child: Text("获取联系人"),
              color: Color(0xffcccccc),
              onPressed: () => _getContactData(),
            ),
            FlatButton(
              child: Text("获取联系人列表"),
              color: Color(0xffcccccc),
              onPressed: () => _getContactDataList(),
            ),
            FlatButton(
              child: Text("菜单部件"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return PageThree();
              })),
            ),
            FlatButton(
              child: Text("TinderCard"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return TinderCardPage();
              })),
            ),
            FlatButton(
              child: Text("Flushbar"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return FlushBarPage();
              })),
            ),
            FlatButton(
              child: Text("Typeahead"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return FlutterTypedHeadPage();
              })),
            ),
            FlatButton(
              child: Text("Snaplist"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return SpanListPage();
              })),
            ),
            FlatButton(
              child: Text("pin_code_text_field"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return PinCodeTextFieldPage();
              })),
            ),
            FlatButton(
              child: Text("folding_cell"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return FoldingCellPage();
              })),
            ),
            FlatButton(
              child: Text("liquid_pull_to_refresh"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return LiquidPullRefreshPage();
              })),
            ),
            FlatButton(
              child: Text("slide_container"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return SlideContainerPage();
              })),
            ),
            FlatButton(
              child: Text("direct_select_flutter"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return DirectSelectFlutterPage();
              })),
            ),
            FlatButton(
              child: Text("direct_select_flutter2"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return DirectSelectFlutter2Page();
              })),
            ),
            FlatButton(
              child: Text("dio"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return DioPage();
              })),
            ),
            FlatButton(
              child: Text("TabViewOne"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return TabViewOne();
              })),
            ),
            FlatButton(
              child: Text("TabViewTwo"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return TabViewTwo();
              })),
            ),

            FlatButton(
              child: Text("StreamOne"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return StreamOnePage();
              })),
            ),
            FlatButton(
              child: Text("Stream-NetStatus"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return NetStatusPage();
              })),
            ),
            FlatButton(
              child: Text("Stream-Broadcase"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return BroadcastStreamPage();
              })),
            ),

            FlatButton(
              child: Text("Stream-Opr"),
              color: Color(0xffcccccc),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return StreamOprPage();
              })),
            ),



            SizedBox(height: 50,),
          ],
        ),
      )
    );
  }
}

