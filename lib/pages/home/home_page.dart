import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_flutter_pizza_app/blocs/pizza_bloc/pizza_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';
import '../../components/home_drawer.dart';

class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //  辣度：0-不辣 1-微辣 2-中辣 3-重辣
  final List<Map<String, dynamic>> spicyList = [
    {'name': '🌶️ 不辣', 'color': Colors.grey},
    {'name': '🌶️ 微辣', 'color': Colors.orangeAccent},
    {'name': '🌶️ 中辣', 'color': Colors.orange},
    {'name': '🌶️ 重辣', 'color': Colors.redAccent},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
        color: Colors.white,
        title: '披萨选购',
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/8.png', scale: 16),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '披萨选购',
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
            child:
                BlocBuilder<PizzaBloc, PizzaState>(builder: (context, state) {
              if (state is GetPizzaSuccess) {
                if (state.pizzas.isEmpty) {
                  const Center(child: Text('暂无数据'));
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: state.pizzas.length,
                  itemBuilder: (BuildContext context, int index) {
                    Pizza pizza = state.pizzas[index];
                    return Material(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        hoverColor: Colors.orange[50],
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.pushNamed(context, '/detail',
                              arguments: state.pizzas[index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              // child:  // Image.asset('assets/1.png'),
                              child: Image.network(pizza.picture, fit: BoxFit.fitWidth,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 20),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        // color: true ? Colors.green : Colors.red,
                                        color: pizza.isVeg
                                            ? Colors.green
                                            : Colors.redAccent,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        // true ? "全素" : "非素",
                                        pizza.isVeg ? "全素" : "非素",
                                        style: TextStyle(
                                            // color: true ?  Colors.white : Colors.redAccent,
                                            color: pizza.isVeg
                                                ? Colors.white
                                                : Colors.orangeAccent.shade100,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent
                                            .withOpacity(0.88),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        // spicyList[0]['name'],
                                        spicyList[pizza.spicy]['name'] ?? '不辣',
                                        style: TextStyle(
                                            color: spicyList[pizza.spicy]
                                                    ['color'] ??
                                                Colors.redAccent.shade100,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                // '披萨 name',
                                pizza.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                // '披萨 介绍',
                                pizza.description,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          // "\$${10 - (10 * (0.2) / 100)}",
                                          "\$${(pizza.price - (pizza.price * pizza.discount / 100)).toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          // "\$${10}.00",
                                          "\$${pizza.price}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade500,
                                              fontWeight: FontWeight.w700,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          CupertinoIcons.add_circled_solid,
                                          size: 36,
                                          color: Colors.redAccent,
                                        ))
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is GetPizzaLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const Center(child: Text('获取数据失败'));
            }),
          ),
          drawer: const HomeDrawer(),
        ));
  }
}
