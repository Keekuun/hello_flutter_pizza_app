import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_flutter_pizza_app/pages/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:hello_flutter_pizza_app/pages/auth/views/auth_page.dart';
import 'package:hello_flutter_pizza_app/pages/home/home_page.dart';
import 'package:hello_flutter_pizza_app/routes.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '披萨',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            background: Colors.grey.shade200,
            onBackground: Colors.black,
            primary: Colors.redAccent,
            secondary: Colors.green,
            onPrimary: Colors.white),
        useMaterial3: true,
      ),
      routes: routes,
      home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          // return BlocProvider(
          //     create: (context) => AuthBloc(
          //         userRepository: context.read<AuthBloc>().userRepository),
          //     child: HomePage());
          return HomePage();
        } else {
          return const AuthPage();
        }
      }),
    );
  }
}
