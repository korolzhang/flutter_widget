import 'package:flutter/material.dart';
import 'package:flutter_widget_project/page_two.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            child: Text("CLICK"),
            color: Colors.red,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return PageTwo();
              }));
            }
        ),
      ),
    );
  }
}
