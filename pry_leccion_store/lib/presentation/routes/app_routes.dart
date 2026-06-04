import 'package:flutter/material.dart';
import '../views/homepage.dart';
import '../views/detail_page.dart';

class AppRoutes {
  Map<String, WidgetBuilder> routes = {
    "/": (_) => HomePage(),
    "detalle": (_) => DetailPage(),
  };

}