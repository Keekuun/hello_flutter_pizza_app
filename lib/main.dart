import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_pizza_app/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';

void main() async {
  // 确保 Flutter 引擎已经初始化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepository()));
}
