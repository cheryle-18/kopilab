import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/menu_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final item = const <Widget>[
    Text(
      "COFFEE",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ),
    MenuList(query: 'Coffee'),
    Text(
      "NON - COFFEE",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ),
    MenuList(query: 'Non-Coffee'),
    Text(
      "FOOD",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ),
    MenuList(query: 'Food'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kopilab.'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: IconButton(
              icon: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, CartProvider cart, widget) {
                    return Text(
                      cart.count().toString(),
                      style: const TextStyle(color: Colors.brown),
                    );
                  },
                ),
                badgeAnimation: const badges.BadgeAnimation.fade(toAnimate: false),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                child: const Icon(Icons.shopping_cart),
              ),
              onPressed: () {
                context.pushNamed("cart");
              },
            ),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return item[index];
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
