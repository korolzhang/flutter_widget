import 'dart:async';

import 'package:flutter/material.dart';
class BroadcastStreamPage extends StatefulWidget {
  @override
  _BroadcastStreamPageState createState() => _BroadcastStreamPageState();
}

class _BroadcastStreamPageState extends State<BroadcastStreamPage> {
  // ignore: close_sinks
  StreamController _streamController = StreamController.broadcast();
  StreamSubscription _subscription1;
  StreamSubscription _subscription2;
  StreamSubscription _subscription3;

  int _count = 0;
  int _s1 = 0;
  int _s2 = 0;
  int _s3 = 0;

  _add(){
    if(_count > 9){
      _subscription1.cancel();
    }
    _count++;
    _streamController.add(_count);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _subscription1 = _streamController.stream.listen((event) {
      setState(() {
        _s1 +=1;
      });
    });
    _subscription2 = _streamController.stream.listen((event) {
      setState(() {
        _s2 +=2;
      });
    });
    _subscription3 = _streamController.stream.listen((event) {
      setState(() {
        _s3 -=1;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
    _subscription1.cancel();
    _subscription2.cancel();
    _subscription3.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BroadcastStream"),
      ),
      body: Column(
        children: [
          Text('Count: $_count'),
          SizedBox(height: 12.0),
          Text('S1: $_s1'),
          SizedBox(height: 12.0),
          Text('S2: $_s2'),
          SizedBox(height: 12.0),
          Text('S3: $_s3'),
          SizedBox(height: 12.0),
          FloatingActionButton(
            onPressed: _add,
            child: Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}
