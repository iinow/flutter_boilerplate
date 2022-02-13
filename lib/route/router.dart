import 'package:flutter/cupertino.dart';
import 'package:flutter_example/screens/home.dart';
import 'package:flutter_example/screens/map.dart' as g_map;
import 'package:flutter_example/screens/provider.dart';
import 'package:flutter_example/screens/swipe.dart';
import 'package:flutter_example/screens/swipe2.dart';

const defaultRoutePath = '/';

Map<String, WidgetBuilder> getRouteMap() {
  return {
    '/': (context) => const Home(),
    '/maps': (context) => const g_map.Map(),
    '/swipe': (context) => const Swipe(),
    '/swipe2': (context) => const Swipe2(),
    '/provider': (context) => const Provider(),
  };
}
