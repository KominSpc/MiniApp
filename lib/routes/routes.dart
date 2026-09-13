import 'package:flutter/material.dart';
import 'package:mini_app/pages/login_page.dart';
import 'package:mini_app/pages/main_page.dart';

Widget getRootWidget() {
  return MaterialApp(title: "miniApp", initialRoute: "/", routes: getRoutes());
}

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {"/": (context) => MainPage(), "/login": (context) => LoginPage()};
}
