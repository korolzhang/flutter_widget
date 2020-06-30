import 'package:flutter/material.dart';
import 'package:slide_container/slide_container.dart';
import 'package:slide_container/slide_container_controller.dart';

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  List _dataList = [];
  double _maxSlideDistance = 80;

  bool isMenuExtended = false;
  SlideContainerController _controller = SlideContainerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataList = [1, 2, 3, 4, 5, 6, 7];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page5"),
      ),
      body: Container(
        child: Column(
          children: _dataList.map((item) {
            return Container(
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, 0),
                    child: SlideContainer(
                      slideDirection: SlideContainerDirection.rightToLeft,
                      minSlideDistanceToValidate: 50,
                      maxSlideDistance: _maxSlideDistance,
                      onSlideCompleted: () => print("onSlideCompleted"),
                      onSlideCanceled: () => print("onSlideCanceled"),
                      onSlideStarted: () => print("onSlideStarted"),
                      onSlideValidated: () => print("onSlideValidated"),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width-80,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: ListTile(
                              title: Text("This is a title $item"),
                              subtitle: Text("This is a subtitle DHSAJSAKS"),
                              leading: Icon(
                                Icons.contacts,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _dataList.remove(item);
                              });
                            },
                            child: Container(
                              height: 70,
                              width: 80,
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "删除",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.5,
                    color: Color(0xffcccccc),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
