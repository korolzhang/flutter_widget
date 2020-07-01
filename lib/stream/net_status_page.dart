import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class NetStatusPage extends StatefulWidget {
  @override
  _NetStatusPageState createState() => _NetStatusPageState();
}

class _NetStatusPageState extends State<NetStatusPage> {
  // ignore: close_sinks
  StreamController<ConnectivityResult> _streamController = StreamController();
  StreamSink _streamSink;
  Stream _stream;
  String _result;

  _checkStatus() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      _result = "mobile";
    }
    if (result == ConnectivityResult.wifi) {
      _result = "wifi";
    }
    if (result == ConnectivityResult.none) {
      _result = "none";
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream = _streamController.stream;
    _streamSink = _streamController.sink;
    _checkStatus();
    Connectivity().onConnectivityChanged.listen((event) {
      _streamSink.add(event);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
    _streamSink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NetStatus-Stream"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _stream,
          initialData: _result,
          builder: (context , snapshot){
            if(snapshot.hasData){
              if(snapshot.data == ConnectivityResult.mobile){
                _result = "mobile";
              }
              if(snapshot.data == ConnectivityResult.wifi){
                _result = "wifi";
              }
              if(snapshot.data == ConnectivityResult.none){
                _result = "none";
              }
            }
            if(_result == null){
              return CircularProgressIndicator();
            }

            return Text("$_result");
          },
        ),
      ),
    );
  }
}
