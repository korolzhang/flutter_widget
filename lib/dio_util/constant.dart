import 'package:flutter/cupertino.dart';

final navKey = GlobalKey<NavigatorState>();

Future<dynamic> push(Widget widget) {
  final route = CupertinoPageRoute(
      builder: (BuildContext context) => widget,
      settings: RouteSettings(
        name: widget.toStringShort(),
      ));
  return navKey.currentState.push(route);
}
