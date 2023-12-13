import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route<dynamic>? _goto(Widget widget) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        builder: (contex) => widget,
      );
    }
    return CupertinoPageRoute(builder: (contex) => widget);
  }

  /*Route<dynamic>? generator(RouteSettings settings) {
    Widget page = const Home();
    switch (settings.name) {
      case AppPages.home:
        page = const Home();
        break;
      case AppPages.taskDetail:
        page = const TaskDetail();
        break;
    }
    return _goto(page);
  }*/
}
