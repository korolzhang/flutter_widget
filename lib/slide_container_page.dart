import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_widget_project/slide_container/help_page.dart';
import 'package:flutter_widget_project/slide_container/page_1.dart';
import 'package:flutter_widget_project/slide_container/page_2.dart';
import 'package:flutter_widget_project/slide_container/page_3.dart';
import 'package:flutter_widget_project/slide_container/page_4.dart';
import 'package:flutter_widget_project/slide_container/page_5.dart';
class SlideContainerPage extends StatefulWidget {
  @override
  _SlideContainerPageState createState() => _SlideContainerPageState();
}

class _SlideContainerPageState extends State<SlideContainerPage> {

  final TextStyle selectedItemStyle = TextStyle(color: Colors.amber[800]);

  final List<Widget> pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];

  int selectedPageIndex = 0;
  double bottomNavigationBarHeight = 70;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///addPostFrameCallback 是 StatefulWidge 渲染结束的回调，只会被调用一次，之后 StatefulWidget 需要刷新 UI 也不会被调用，
    ///addPostFrameCallback 的使用方法是在 initState 里添加回调：
    SchedulerBinding.instance
        .addPostFrameCallback((_) => Navigator.of(context).push(HelpPage()));
  }
  void onPageSelected(int index) {
    if (mounted) setState(() => selectedPageIndex = index);
  }

  List<BottomNavigationBarItem> get bottomNavigationBarItems => List.generate(
    pages.length,
        (index) => BottomNavigationBarItem(
      icon: Container(
        child: Column(
          children: [
            Icon(Icons.home , color: Colors.grey,),
            Text('${index + 1}')
          ],
        ),
      ),
      activeIcon: Container(
        child: Column(
          children: [
            Icon(Icons.home ,color: Colors.red,),
            Text('${index + 1}', style: selectedItemStyle),
          ],
        ),
      ),
      title: Container(
        child: Text("123"),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: pages[selectedPageIndex],
    bottomNavigationBar: SizedBox(
      height: bottomNavigationBarHeight,
      child: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: selectedPageIndex,
        onTap: onPageSelected,
      ),
    ),
  );
}
