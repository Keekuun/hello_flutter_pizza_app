import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> spicyList = [
    {'name': '🌶️ 微辣', 'color': Colors.greenAccent},
    {'name': '🌶️ 中辣', 'color': Colors.orangeAccent},
    {'name': '🌶️ 狠辣', 'color': Colors.redAccent},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Image.asset('assets/8.png', scale: 16),
            const SizedBox(
              width: 10,
            ),
            const Text(
              '披萨',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            )
          ],
        ),
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/homeDetail');
              },
              icon: const Icon(
                CupertinoIcons.square_favorites_fill,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => {},
              //   ),
              // );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/1.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: true ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Text(
                            true ? "全素" : "非素",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: Text(
                            spicyList[0]['name'],
                            style: TextStyle(
                                color: spicyList[0]['color'],
                                fontWeight: FontWeight.w800,
                                fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    '披萨 name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    '披萨 介绍',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "\$${10 - (10 * (0.2) / 100)}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "\$${10}.00",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.add_circled_solid))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
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
