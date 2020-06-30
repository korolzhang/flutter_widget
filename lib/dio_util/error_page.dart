import 'package:flutter/material.dart';
class ErrorPage extends StatefulWidget {
  final String message;

  const ErrorPage({Key key, this.message}) : super(key: key);
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERROR"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_none.png' , width: 60, height: 60 , fit: BoxFit.cover,),
            SizedBox(height: 16,),
            Text("${widget.message}" , style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
