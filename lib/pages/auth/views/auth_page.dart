import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_flutter_pizza_app/pages/auth/views/sign_in_page.dart';
import 'package:hello_flutter_pizza_app/pages/auth/views/sign_up_page.dart';

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
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const BgColor(),
            Padding(padding: const EdgeInsets.symmetric(vertical: 40), child: Align(
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
                        children: const [SignInPage(), SignUpPage()],
                      ))
                ],
              ),
            )),
          ],
        ),
      )),
      drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.orange.shade50,
                Colors.red.shade50,
                Colors.orange.shade100,
                Colors.red.shade100
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              backgroundBlendMode: BlendMode.lighten,
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/1.png'),
                alignment: Alignment(0.5, 0.55),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/8.png', scale: 16),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '欢迎光临',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.primary),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListBody(children: [
                    ListTile(
                        onTap: () {},
                        title: Row(children: [
                          Icon(Icons.local_pizza,
                              color: Theme.of(context).colorScheme.onSecondary),
                          const SizedBox(width: 10),
                          Text('披萨介绍',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary)),
                        ])),
                    ListTile(
                        onTap: () {},
                        title: Row(children: [
                          Icon(Icons.storefront,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 10),
                          Text('关于本店',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ])),
                    ListTile(
                        onTap: () {},
                        title: const Row(children: [
                          Icon(Icons.person, color: Colors.black87),
                          SizedBox(width: 10),
                          Text('个人中心', style: TextStyle(color: Colors.black87)),
                        ])),
                    ListTile(
                        onTap: () {},
                        title: const Row(children: [
                          Icon(Icons.exit_to_app_rounded, color: Colors.red),
                          SizedBox(width: 10),
                          Text('退出登录', style: TextStyle(color: Colors.red)),
                        ]))
                  ]),
                  const Spacer(),
                  const Text('做披萨我们是认真的！',
                      style: TextStyle(color: Colors.black54)),
                  const Text('v1.0.0', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          )),
    );
  }
}

class BgColor extends StatelessWidget {
  const BgColor({super.key});

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
