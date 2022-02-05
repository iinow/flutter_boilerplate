import 'package:flutter/cupertino.dart';
import 'package:flutter_example/screens/home.dart';
import 'package:flutter_example/screens/map.dart' as g_map;

const defaultRoutePath = '/';

Map<String, WidgetBuilder> getRouteMap() {
  return {
    '/': (context) => const Home(),
    '/maps': (context) => const g_map.Map()
  };
}
