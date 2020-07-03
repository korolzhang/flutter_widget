import 'package:flutter/material.dart';
import 'package:flutter_widget_project/dio_util/constant.dart';
import 'package:rxdart/rxdart.dart';

class RxDartPage extends StatefulWidget {
  @override
  _RxDartPageState createState() => _RxDartPageState();
}

class _RxDartPageState extends State<RxDartPage> {

  String _name = "hello";
  _concat() {
    //只要先前的流序列成功终止，就连接所有指定的流序列.通过逐个订阅每个流，发出所有项目并在订阅下一个流之前完成来完成此操作.
    Rx.concat([
      Stream.value(1),
      Rx.timer(2, Duration(seconds: 5)),
      Stream.value(3),
    ]).listen((data) {
      print(data);
    });
  }

  _concatEager() {
    //只要先前的流序列成功终止，就连接所有指定的流序列.不是立即订阅下一个流，而是立即订阅所有流. 然后，在前一个流完成发射项目之后，在正确的时间捕获并发射事件.
    Rx.concatEager([
      Stream.value(1),
      Rx.timer(2, Duration(seconds: 5)),
      Stream.value(3),
    ]).listen((data) {
      print(data);
    });
  }

  _defer() {
    Rx.defer(() => Stream.value(2)).listen((data) {
      print(data);
    });
  }

  _merge() {
    //将给定streams发出的项目展平为单个Stream序列.
    Rx.merge([Rx.timer(2, Duration(seconds: 3)), Stream.value(1)])
        .listen((event) {
      print(event);
    });
  }

  _buffer() {
    Stream.periodic(Duration(milliseconds: 100), (i) => i)
        .buffer(Stream.periodic(Duration(milliseconds: 180), (i) => i))
        .listen((event) {
      print(event);
    });
  }

  _never() {
    //返回一个非终止的流序列，该序列可用于表示无限的持续时间.
    //never运算符是一种行为非常具体且受限制的运算符. 这些对于测试目的很有用，有时还可以与其他Stream结合使用，
    // 或者作为希望将其他Stream作为参数的运算符的参数.
    Rx.never().listen((event) {
      print(event);
    });
  }

  ///创建observable
  _fromIterable() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rxdart"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "concat",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _concat(),
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "concatEager",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _concatEager(),
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "defer",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _defer(),
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "merge",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _merge(),
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "never",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _never(),
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "never",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _never(),
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "buffer",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _buffer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
