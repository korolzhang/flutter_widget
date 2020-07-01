import 'dart:async';

class DataStream{

  void init(){
    // ignore: close_sinks
    StreamController _streamController = StreamController(
      onCancel: (){},
      onListen: (){},
      onPause: (){},
      onResume: (){},
      sync: false,
    );


    // ignore: cancel_subscriptions
    StreamSubscription _subscription = _streamController.stream.listen((event) {

    });
    _subscription.onDone(() { });
  }


}