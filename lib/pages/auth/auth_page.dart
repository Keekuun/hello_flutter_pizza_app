import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_flutter_pizza_app/pages/auth/sign_in_page.dart';
import 'package:hello_flutter_pizza_app/pages/auth/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late TabController tabController;

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
      appBar: AppBar(
        title: const Text('Auth page'),
        titleTextStyle: const TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const BackColor(),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TabBar(
                      controller: tabController,
                      unselectedLabelColor: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6),
                      labelColor: Theme.of(context).colorScheme.onBackground,
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
                  const SizedBox(height: 20,),
                  Expanded(
                      child: TabBarView(
                    controller: tabController,
                    children: const [SignInPage(), SignUpPage()],
                  ))
                ],
              ),
            )
          ],
        ),
      )),
      drawer: const Drawer(child: Text('Drawer')),
    );
  }
}

class BackColor extends StatelessWidget {
  const BackColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(20, -1.2),
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(2.7, -1.2),
          child: Container(
            height: MediaQuery.of(context).size.width / 1.3,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
          child: Container(),
        ),
      ],
    );
  }
}
