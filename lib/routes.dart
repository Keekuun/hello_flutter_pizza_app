import 'package:flutter/cupertino.dart';
import 'package:hello_flutter_pizza_app/pages/auth/auth_page.dart';
import 'package:hello_flutter_pizza_app/pages/auth/sign_in_page.dart';
import 'package:hello_flutter_pizza_app/pages/home/home_detail_page.dart';
import 'package:hello_flutter_pizza_app/pages/home/home_page.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const AuthPage(),
  '/home': (context) => HomePage(),
  '/homeDetail': (context) => const HomeDetailPage(),
};