import 'package:flutter/cupertino.dart';

import 'pages/auth/auth_page.dart';
import 'pages/home/home_detail_page.dart';
import 'pages/home/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/auth': (context) => const AuthPage(),
  '/home': (context) => HomePage(),
  '/detail': (context) => const HomeDetailPage(),
};