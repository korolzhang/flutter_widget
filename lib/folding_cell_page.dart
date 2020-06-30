import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';

class FoldingCellPage extends StatefulWidget {
  @override
  _FoldingCellPageState createState() => _FoldingCellPageState();
}

class _FoldingCellPageState extends State<FoldingCellPage> {
  final _foldingCellKey1 = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FoldingCell"),
        ),
        body: Column(
          children: [
            SimpleFoldingCell(
              key: _foldingCellKey1,

              ///收起时展示的页面
              frontWidget: _buildFrontWidget(),

              ///展开时的组件
              innerTopWidget: _buildInnerTopWidget(),
              innerBottomWidget: _buildInnerBottomWidget(),

              ///尺寸
              cellSize: Size(MediaQuery.of(context).size.width, 125),

              ///边距
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 10,
              onOpen: () => print('cell opened'),
              onClose: () => print('cell closed'),
            ),
          ],
        ));
  }

  Widget _buildFrontWidget() {
    return Container(
      color: Color(0xFFffcd3c),
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipOval(
                child: Image.network(
                  "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3010996478,1972571411&fm=26&gp=0.jpg",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Steve Jobs",
                style: TextStyle(
                    color: Color(0xFF2e282a),
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Email:Jobs@iphon.com",
                  style: TextStyle(
                      color: Color(0xFF2e282a),
                      fontFamily: 'OpenSans',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 4,
              ),
              Text("Desc:Co-founder of Apple Inc.",
                  style: TextStyle(
                      color: Color(0xFF2e282a),
                      fontFamily: 'OpenSans',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: GestureDetector(
              child: Icon(
                Icons.more_vert,
                size: 16,
                color: Colors.black54,
              ),
              onTap: () => _foldingCellKey1?.currentState?.toggleFold(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInnerTopWidget() {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(12),
            color: Color(0xFFff9234),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3010996478,1972571411&fm=26&gp=0.jpg",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Steve Jobs",
                          style: TextStyle(
                              color: Color(0xFF2e282a),
                              fontFamily: 'OpenSans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          "18379199586",
                          style: TextStyle(
                              color: Color(0xFF2e282a),
                              fontFamily: 'OpenSans',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Desc:Co-founder of Apple Inc.s",
                      style: TextStyle(
                          color: Color(0xFF2e282a),
                          fontFamily: 'OpenSans',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      "Innovative shell color transparent design makes the product sold",
                      style: TextStyle(
                          color: Color(0xFF2e282a),
                          fontFamily: 'OpenSans',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            )
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            child: Icon(Icons.keyboard_arrow_up ,size: 20,),
            onTap: ()=>_foldingCellKey1?.currentState?.toggleFold(),
          ),
        ),
      ],
    );
  }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
//      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10 , top: 10 , left: 10 ,right: 10),
        child: Text(
          'Jobs is considered to be an icon in the computer industry and '
              ' decadesJobs is considered to be an icon in the computer industry and entertainment '
              'industry. He has experienced the rise and fall of Apple for decadesJobs is considered ',
          style: TextStyle(
              color: Color(0xFF2e282a),
              fontFamily: "Sriracha",
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
