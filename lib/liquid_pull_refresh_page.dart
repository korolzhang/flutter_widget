import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
class LiquidPullRefreshPage extends StatefulWidget {
  @override
  _LiquidPullRefreshPageState createState() => _LiquidPullRefreshPageState();
}

class _LiquidPullRefreshPageState extends State<LiquidPullRefreshPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
  Stream<int>.periodic(Duration(seconds: 3), (x) => refreshNum);

  ScrollController _scrollController;
  static final List<String> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = new Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            Align(alignment: Alignment(-1.0, 0.0), child: Icon(Icons.reorder)),
            Align(alignment: Alignment(-0.3, 0.0), child: Text("Liquid Pull To Refresh")),
          ],
        ),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        ///收起header的速度
        animSpeedFactor:1,
        showChildOpacityTransition: false,
        color: Color(0xffcccccc),
        backgroundColor: Colors.white,
        height: 80,
        child: StreamBuilder<int>(
            stream: counterStream,
            builder: (context, snapshot) {
              return ListView.builder(
                padding: kMaterialListPadding,
                itemCount: _items.length,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  final String item = _items[index];
                  return ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(child: Text(item)),
                    title: Text('This item represents $item.'),
                    subtitle: Text(
                        'Even more additional list item information appears on line three. ${snapshot.data}'),
                  );
                },
              );
            }),
      ),
    );
  }
}
