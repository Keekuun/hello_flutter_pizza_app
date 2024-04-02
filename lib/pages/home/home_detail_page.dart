import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

import '../../components/macro.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    late Pizza pizza;
    try {
      pizza = ModalRoute.of(context)?.settings.arguments as Pizza;
    } catch (e) {
      pizza = Pizza.empty();
      log('pizza error: $e');
    }

    return Title(
        color: Colors.white,
        title: pizza.name == '' ? pizza.name : '披萨详情',
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/8.png', scale: 16),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '披萨详情',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        // color: Theme.of(context).colorScheme.primary
                        color: Colors.white),
                  )
                ],
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  )),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.refresh_thin,
                      color: Colors.white,
                    )),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width - (40),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3, 3),
                                blurRadius: 5)
                          ],
                          image: DecorationImage(
                              image: NetworkImage(pizza.picture))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(3, 3),
                              blurRadius: 5)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    pizza.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$${(pizza.price - (pizza.price * (pizza.discount) / 100)).toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        Text(
                                          "\$${pizza.price.toStringAsFixed(2)}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                MyMacroWidget(
                                  title: "卡路里",
                                  value: pizza.macros.calories,
                                  icon: FontAwesomeIcons.fire,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MyMacroWidget(
                                  title: "蛋白质",
                                  value: pizza.macros.proteins,
                                  icon: FontAwesomeIcons.dumbbell,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MyMacroWidget(
                                  title: "脂肪",
                                  value: pizza.macros.fat,
                                  icon: FontAwesomeIcons.oilWell,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MyMacroWidget(
                                  title: "碳水",
                                  value: pizza.macros.carbs,
                                  icon: FontAwesomeIcons.breadSlice,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    elevation: 3.0,
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text(
                                  "立即购买",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
