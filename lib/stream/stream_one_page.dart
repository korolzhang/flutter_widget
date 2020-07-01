import 'dart:async';

import 'package:flutter/material.dart';
class StreamOnePage extends StatefulWidget {
  @override
  _StreamOnePageState createState() => _StreamOnePageState();
}

class _StreamOnePageState extends State<StreamOnePage> {

  ///流事件控制器
  // ignore: close_sinks
  StreamController<int> _streamController = StreamController(
    onListen: (){
      print("onListen");
    },
    onCancel: (){
      print("onCancel");
    }
  );
  Stream _stream;
  Stream _eventStream;
  StreamSink _sink;
  int _count = 0;


  void _incrementCounter(){
    if(_count > 9){
      _sink.close();
      return;
    }
    _count++;
    _sink.add(_count);
  }


  void _closeStream(){
    _streamController.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
    _sink.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///流事件
    _stream = _streamController.stream;
    ///事件入口
    _sink = _streamController.sink;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),
            StreamBuilder(
              stream: _stream,
              initialData: _count,
              builder: (context , AsyncSnapshot snapshot){
                ///snapshot携带事件入口处闯进来的数据，用snapshot.data获取数据进行处理
                if(snapshot.connectionState == ConnectionState.done){
                  return Text('Done',style: TextStyle(fontSize: 14 , color: Colors.blue),);
                }
                int number = snapshot.data;
                return Text(
                  "$number",
                  style: TextStyle(fontSize: 14 , color: Colors.blue),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child:  Icon(Icons.add),
            tooltip: "Increment",
            onPressed: ()=>_incrementCounter(),
          ),
          SizedBox(width: 20,),

//          FloatingActionButton(
//            child:  Icon(Icons.close),
//            tooltip: "Close",
//            onPressed: ()=>_closeStream,
//          ),
        ],
      ),
    );
  }
}
