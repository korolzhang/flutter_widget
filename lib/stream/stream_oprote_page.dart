import 'package:flutter/material.dart';

class StreamOprPage extends StatefulWidget {
  @override
  _StreamOprPageState createState() => _StreamOprPageState();
}

class _StreamOprPageState extends State<StreamOprPage> {
  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 3));
    return "返回一个future对象";
  }

  _streamDuration() async {
    Duration duration = Duration(seconds: 1);
    Stream<int> stream3 = Stream.periodic(duration, (data) => data);
    //stream3 = stream3.take(10);//限制发送次数
    stream3 = stream3.takeWhile((element) => element < 10);
    stream3 = stream3.skip(2);
//    List<int> listData = await stream3.toList();//一次性返回
//    var length = await stream3.length;//数据长度
//    stream3 = stream3.map((data) => data + 1);//数据变化
//    stream3 = stream3.where((data) => data>3);//数据筛选
//    stream3 = stream3.where((data) => data<6);
    stream3 = stream3.expand((data) => [data, data]);
    stream3.listen((data) {
      print("expand==>$data");
    }, onError: (error) {
      print("$error");
    });

//    print("length==>$length");
//    for (int i in listData) {
//      print("stream3==>$i");
//    }

//    await for(int i in stream3){
//      print("stream3==>$i");
//    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///返回future对象
    Stream<String> stream1 = Stream.fromFuture(getData());
    stream1.listen((str) {
      print("$str");
    });

    ///
    Stream<String> stream2 = Stream.fromIterable(["1", "2", "3"]);
    stream2.listen((str) {
      print("$str");
    });

    ///返回一个Duation对象
    _streamDuration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamOpr"),
      ),
      body: Column(),
    );
  }
}
