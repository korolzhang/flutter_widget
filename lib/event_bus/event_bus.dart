

import 'package:snaplist/snaplist_events.dart';

//订阅者回调签名
typedef void EventCallback(arg);
class EventBus{

  ///私有构造函数
  EventBus._internal();
  ///静态对象
  static EventBus _singleton = EventBus._internal();
  ///工厂构造方法
  factory EventBus() => _singleton;
  ///事件订阅队列
  var _eMap = Map<Object , List<EventCallback>>();

  ///订阅
  void on(String eventName , EventCallback f){
    if(eventName == null || f == null)
      return;
    _eMap[eventName] ??= List<EventCallback>();
    _eMap[eventName].add(f);
  }

  ///取消订阅
  void off(String eventName , [EventCallback f]){
    var list = _eMap[eventName];

    if(eventName == null || list == null)
      return;
    if(f == null ){
      _eMap[eventName] = null;
    }else{
      list.remove(f);
    }
  }

  ///发送事件
  void send(String eventName , [args]){
    var list = _eMap[eventName];
    if(list == null)
      return;
    int length = list.length - 1;
    for(int i = length ; i >= 0 ; i--){
      list[i](args);
    }
  }
}