import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';

///
///横向滑动
///
class HorizontalTab extends StatefulWidget {
  final List<String> images;
  final VoidCallback loadMore;

  const HorizontalTab({Key key, this.images, this.loadMore}) : super(key: key);
  @override
  _HorizontalTabState createState() => _HorizontalTabState();
}

class _HorizontalTabState extends State<HorizontalTab> {
  @override
  Widget build(BuildContext context) {
    ///显示内容的大小
    Size cardSize = Size(300 , 460);
    return SnapList(
      sizeProvider: (index , data){
        return cardSize;
      },
      ///初始位置距离屏幕的距离
      padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width - cardSize.width)/2),
      ///内容之间的边距
      separatorProvider: (index , data)=> Size(10 , 10 ),
      ///内容组件
      builder: (context , index , data){
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Image.network(widget.images[index] , fit: BoxFit.fill,),
        );
      },
      count: widget.images.length,
      ///更新数据
      positionUpdate: (index){
        if(index == widget.images.length - 1){
          widget.loadMore();
        }
      },
    );
  }
}
