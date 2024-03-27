import 'package:flutter/material.dart';
import 'package:hello_flutter_pizza_app/pages/auth/auth_page.dart';
import 'package:hello_flutter_pizza_app/routes.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '披萨批发',
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
        routes: routes,
        // home: Image.asset('assets/1.png'),
        // home: const AuthPage()
    );
  }
}
