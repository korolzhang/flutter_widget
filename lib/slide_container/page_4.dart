import 'package:flutter/material.dart';
import 'package:slide_container/slide_container.dart';
import 'package:slide_container/slide_container_controller.dart';
import 'package:tinder_card/cards.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  SlideContainerController _controller = SlideContainerController();
  double get maxSlideDistance  => MediaQuery.of(context).size.width - 64;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page4"),
      ),
      body: Transform.translate(
        offset: Offset(-maxSlideDistance , 0),
        child: SlideContainer(
          controller: _controller,
          ///允许滑动的方向
          slideDirection: SlideContainerDirection.leftToRight,
          minDragVelocityForAutoSlide: 200,
          ///跟随手指的灵敏度
          dampeningStrength: 8,
          ///滑动到当前距离，组件自动滑出屏幕
          minSlideDistanceToValidate: 200,
          ///允许滑动的最大距离
          maxSlideDistance: maxSlideDistance,
          onSlideStarted: (){
            print("onSlideStarted");
          },
          onSlideCanceled: (){
            print("onSlideCanceled");
          },
          onSlideCompleted: (){
            print("onSlideCompleted");
          },
          onSlide: (value){
            print("onSlide===>$value");
          },
          onSlideUnvalidated: (){
            print("onSlideUnvalidated");
          },


          child: Center(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.red,
              child: Text(
                "hi",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
