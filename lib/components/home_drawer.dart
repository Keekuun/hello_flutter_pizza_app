import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';

class HomeDrawer extends StatelessWidget {
  final bool logoutVisible;

  const HomeDrawer({super.key, this.logoutVisible = true});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                      ])),
                  ListTile(
                      onTap: () {},
                      title: Row(children: [
                        Icon(Icons.storefront,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 10),
                        Text('关于本店',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ])),
                  ListTile(
                      onTap: () {},
                      title: const Row(children: [
                        Icon(Icons.person, color: Colors.black87),
                        SizedBox(width: 10),
                        Text('个人中心', style: TextStyle(color: Colors.black87)),
                      ])),
                  logoutVisible
                      ? ListTile(
                          onTap: () {
                            context.read<SignInBloc>().add(SignOutRequired());
                          },
                          title: const Row(children: [
                            Icon(Icons.exit_to_app_rounded, color: Colors.red),
                            SizedBox(width: 10),
                            Text('退出登录', style: TextStyle(color: Colors.red)),
                          ]),
                        )
                      : const SizedBox()
                ]),
                const Spacer(),
                const Text('做披萨我们是认真的！',
                    style: TextStyle(color: Colors.black54)),
                const Text('v1.0.0', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ));
  }
}
