import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';
import 'simple_bloc_observer.dart';

void main() async {
  // 确保 Flutter 引擎已经初始化
  WidgetsFlutterBinding.ensureInitialized();
  // firebase init for web
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCSSPRXcZp30yXmGxHhxZ90bmcxJtb3E0I',
            appId: '1:1030037099107:web:7349c540b16fd591d61e56',
            messagingSenderId: '1030037099107',
            projectId: 'pizza-app-91583'));
  }
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepository()));
}
