
import 'package:flutter/material.dart';
import 'package:flutter_widget_project/dio_util/constant.dart';
import 'package:flutter_widget_project/event_bus/event_bus.dart';

class EventBusPage extends StatefulWidget {
  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  EventBus _eventBus = EventBus();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///一定要写在init方法里
    _eventBus.on("login", (arg) {
      print("$arg");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ///一定要关闭，防止泄露
    _eventBus.off("login");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus"),
      ),
      body: Column(
        children: [
          MaterialButton(
            child: Text("nextpage"),
            color: Colors.blue,
            onPressed: () => push(EventBusPage2()),
          ),
        ],
      ),
    );
  }
}

class EventBusPage2 extends StatefulWidget {
  @override
  _EventBusPage2State createState() => _EventBusPage2State();
}

class _EventBusPage2State extends State<EventBusPage2> {
  EventBus _eventBus = EventBus();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _eventBus.off("login");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus"),
      ),
      body: Column(
        children: [
          MaterialButton(
            child: Text("eventsend"),
            color: Colors.blue,
            onPressed: (){
              _eventBus.send("login", ["zws", "123"]);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
