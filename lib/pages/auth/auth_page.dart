import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../components/home_drawer.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late TabController tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/8.png', scale: 20),
            const SizedBox(
              width: 10,
            ),
            const Text(
              '欢迎光临',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )
          ],
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              _scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            30,
        child: Stack(
          children: [
            const BgColor(),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TabBar(
                          controller: tabController,
                          unselectedLabelColor: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.6),
                          labelColor: Theme.of(context).colorScheme.primary,
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('登录', style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('注册', style: TextStyle(fontSize: 16)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tabController,
                        // children: const [SignInPage(), SignUpPage()],
                        children: [
                          BlocProvider<SignInBloc>(
                            create: (context) => SignInBloc(
                                context.read<AuthBloc>().userRepository),
                            child: const SignInPage(),
                          ),
                          BlocProvider<SignUpBloc>(
                            create: (context) => SignUpBloc(
                                context.read<AuthBloc>().userRepository),
                            child: const SignUpPage(),
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
          ],
        ),
      )),
      drawer: const HomeDrawer(
        logoutVisible: false,
      ),
    );
  }
}

class BgColor extends StatelessWidget {
  const BgColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                tileMode: TileMode.decal,
                begin: Alignment.topCenter, //渐变开始于上面的中间开始
                end: Alignment.bottomCenter, //渐变结束于下面的中间
                colors: [
          Colors.red.shade100,
          Colors.orange.shade100,
          Colors.orange.shade50,
          Colors.red.shade100
        ])));
  }
}
