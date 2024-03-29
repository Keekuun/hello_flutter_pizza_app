import 'package:flutter/cupertino.dart';
import 'package:hello_flutter_pizza_app/pages/auth/views/auth_page.dart';
import 'package:hello_flutter_pizza_app/pages/home/home_detail_page.dart';
import 'package:hello_flutter_pizza_app/pages/home/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/auth': (context) => const AuthPage(),
  '/home': (context) => HomePage(),
  '/homeDetail': (context) => const HomeDetailPage(),
};