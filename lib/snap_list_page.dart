import 'package:flutter/material.dart';
import 'package:flutter_widget_project/span_list_widget/horizontal_explicit.dart';
import 'package:flutter_widget_project/span_list_widget/horizontal_tab.dart';
import 'package:flutter_widget_project/span_list_widget/vertical_tab.dart';
import 'package:snaplist/snaplist.dart';

class SpanListPage extends StatefulWidget {
  @override
  _SpanListPageState createState() => _SpanListPageState();
}

class _SpanListPageState extends State<SpanListPage> with TickerProviderStateMixin{
  TabController _controller ;
  List<String> urls = [
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/lNkDYKmrVem1J0aAfCnQlJOCKnT.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/r6pPUVUKU5eIpYj4oEzidk5ZibB.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/x1txcDXkcM65gl7w20PwYSxAYah.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/ptSrT1JwZFWGhjSpYUtJaasQrh.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3 , vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SpanList"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Horizontal",),
              Tab(text: "Explicit",),
              Tab(text: "Vertical",),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HorizontalTab(
              images: urls, loadMore: _loadMoreItems,
            ),
            HorizontalExplicitTab(
              images: urls, loadMore: _loadMoreItems,
            ),
            VerticalTab(images: urls, loadMore: _loadMoreItems)
          ],
        ),
      ),
    );
  }

  void _loadMoreItems() {
    setState(() {
      urls = new List.from(urls)..addAll(urls);
    });
  }
}
