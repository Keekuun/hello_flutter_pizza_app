import 'package:flutter/material.dart';
import 'package:hello_flutter_pizza_app/pages/auth/auth_page.dart';
import 'package:hello_flutter_pizza_app/pages/auth/sign_in_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pizza App',
        theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: Colors.grey.shade200,
              onBackground: Colors.black,
              primary: Colors.redAccent,
              secondary: Colors.green,
              onPrimary:
              Colors.white
          ),
          useMaterial3: true,
        ),
        // home: Image.asset('assets/1.png'),
        home: const AuthPage());
  }
}
