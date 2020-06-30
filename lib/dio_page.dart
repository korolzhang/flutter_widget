
import 'package:flutter/material.dart';
import 'package:flutter_widget_project/dio_util/dio_manager.dart';
import 'package:flutter_widget_project/dio_util/progress_dialog.dart';
import 'package:flutter_widget_project/model/page_mini.dart';
import 'package:flutter_widget_project/model/page_option_model.dart';
import 'package:flutter_widget_project/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dio_util/response_interceptors.dart';
import 'model/entrust_search_model.dart';

class DioPage extends StatefulWidget {
  @override
  _DioPageState createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> with PageMini{
  String token;
  List dataList=[];
  bool isLoading = false;
  int pages = 1;
  ScrollController pageScrollController = new ScrollController();

  request() {
    DioManager().request<LoginModel>(
      context,
      NetMethod.POST,
      "/MemberAuth/Login",
      formData: {"Account": "zws1234", "Password": "123456"},
      onSuccess: (data) async {
        LoginModel dataModel = data;
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString("accessToken" ,dataModel.Token);
      },
      onError: (error) {
        Fluttertoast.showToast(msg: error.message);
        print("error code = ${error.code}, massage = ${error.message}");
      },
    );
  }

  requestList({int goPage = 1}) {
    setState(() {
      isLoading = true;
    });
     goPage = pageOptionModel.GotoPageNumber;
    DioManager().requestList<EntrustModel>(
      context,
      NetMethod.POST,
      "/Entrust/Search",
      formData: {"EntrustType": 1 , "PagingOption":{"GotoPageNumber":"$goPage" , "PageSize":"15"}},
      onSuccess: (response , pageResult){

        if(goPage == 1){
          dataList.clear();
        }
        dataList = response;
        setState(() {
          isLoading = false;
          isPageLoading = false;
        });
      },
      onError: (error){
        Fluttertoast.showToast(msg: error.message);
        setState(() {
          isLoading = false;
        });
      }
    );
  }

  @override
  refreshData(){
    pages = 1;
    requestList(goPage:pages);
  }
  @protected
  loadMoreData() {
    if(pageResultModel.HasNextPage){
      return requestList(goPage: pages++);
    }
  }

  init() async {

//    SharedPreferences _sp = await SharedPreferences.getInstance();
//    token = _sp.get("accessToken");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DioPage"),
      ),
      body:ProgressDialog(
        loading: isLoading,
        msg: "加载中...",
        child:  Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: SingleChildScrollView(
            controller: pageScrollController,
            child: Column(
              children: [
                Text("请求内容"),
                MaterialButton(
                  child: Text(
                    "clik",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => request(),
                  color: Colors.blueAccent,
                ),
                MaterialButton(
                  child: Text(
                    "list",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => requestList(),
                  color: Colors.blueAccent,
                ),
                Column(
                  children:  dataList.map((item){
                    EntrustModel dataModel = item;
                    return ListTile(
                      title: Text("${dataModel.Id}"),
                    );
                  }).toList(),
                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}
