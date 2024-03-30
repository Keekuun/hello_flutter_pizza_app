import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'pages/auth/auth_page.dart';
import 'pages/home/home_page.dart';
import 'routes.dart';

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
          var userRepository = context.read<AuthBloc>().userRepository;
          return MultiBlocProvider(providers: [
            BlocProvider(create: (context) => AuthBloc(userRepository)),
            BlocProvider(create: (context) => SignInBloc(userRepository)),
          ], child: HomePage());

          // single bloc provider
          // return BlocProvider(
          //     create: (context) => AuthBloc(
          //         userRepository: context.read<AuthBloc>().userRepository),
          //     child: HomePage());

          // return HomePage();
        } else {
          return const AuthPage();
        }
      }),
    );
  }
}
