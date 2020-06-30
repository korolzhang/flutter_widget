import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridPage extends StatefulWidget {
  @override
  _StaggeredGridPageState createState() => _StaggeredGridPageState();
}

class _StaggeredGridPageState extends State<StaggeredGridPage> {
  ScrollController _scrollController = ScrollController();

  //StaggeredGridView.countBuilder布局
  Widget _countBuildItem() {
    return StaggeredGridView.countBuilder(
      itemCount: 8,
      //元素数量
      crossAxisCount: 4,
      // 横轴元素数量StaggeredTile.count(1, index.isEven ? 3 : 1);横轴为1时
      itemBuilder: (context, index) => new Container(
          color: Colors.green,
          child: new Center(
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('$index'),
            ),
          )),
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(2, index.isEven ? 2 : 1); //横轴和纵轴的数量,控制瀑布流效果
      },
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  ///
  Widget _countItem() {
    return StaggeredGridView.count(
      crossAxisCount: 2,
//     physics: NeverScrollableScrollPhysics(),//不可以滑动
//     shrinkWrap: true,//外层有SingleChildScrollView或者CustomScrollView等可以滑动组件时使用
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,

      staggeredTiles: const <StaggeredTile>[
        const StaggeredTile.count(2, 2),
        const StaggeredTile.count(2, 1),
        const StaggeredTile.count(2, 2),
        const StaggeredTile.count(2, 1),
        const StaggeredTile.count(2, 2),
        const StaggeredTile.count(2, 1),
        const StaggeredTile.count(2, 2),
        const StaggeredTile.count(2, 1),
      ],
      children: [1, 2, 3, 4, 5, 6]
          .map((item) => Container(
                child: Container(
                    color: Colors.green,
                    child: new Center(
                      child: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text('$item'),
                      ),
                    )),
              ))
          .toList(),
    );
  }

  Widget _extentItem() {
    return StaggeredGridView.extent(
//     physics: NeverScrollableScrollPhysics(),//不可以滑动
//     shrinkWrap: true,//外层有SingleChildScrollView或者CustomScrollView等可以滑动组件时使用
      maxCrossAxisExtent: 100,
      //设置固定大小
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,

      staggeredTiles: const <StaggeredTile>[
        const StaggeredTile.count(1, 1), //参数为x,y的比例
        const StaggeredTile.count(2, 1),
        const StaggeredTile.count(1, 2),
        const StaggeredTile.count(2, 1),
        const StaggeredTile.count(2, 2),
        const StaggeredTile.count(2, 1),
        const StaggeredTile.count(2, 2),
        const StaggeredTile.count(2, 1),
      ],
      children: [1, 2, 3, 4, 5, 6]
          .map((item) => Container(
                child: Container(
                    color: Colors.green,
                    child: new Center(
                      child: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text('$item'),
                      ),
                    )),
              ))
          .toList(),
    );
  }

  Widget _extentBuildItem() {
    return StaggeredGridView.extentBuilder(
        maxCrossAxisExtent: 200,
        itemCount: 8,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              ));
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 2 : 1);
        });
  }

  _bodyView(int type) {
    Widget tempWidget;
    switch (type) {
      case 1:
        tempWidget = _countBuildItem();
        break;
      case 2:
        tempWidget = _countItem();
        break;
      case 3:
        tempWidget = _extentItem();
        break;
      case 4:
        tempWidget = _extentBuildItem();
        break;
      case 5:
        _countBuildItem();
        break;
      case 6:
        _countBuildItem();
        break;
    }
    return tempWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("瀑布流布局"),
      ),
      body: _bodyView(4),
    );
  }
}
