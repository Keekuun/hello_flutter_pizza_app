import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth_bloc/auth_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'app_view.dart';

class MyApp extends StatelessWidget {
  final FirebaseUserRepository firebaseUserRepository;

  const MyApp(this.firebaseUserRepository, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MyAppView;
    return RepositoryProvider<AuthBloc>(
      create: (context) => AuthBloc(firebaseUserRepository),
      child: const MyAppView(),
    );
  }
}
