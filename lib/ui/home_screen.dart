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
      "Coffee",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ),
    MenuList(query: 'Coffee'),
    SizedBox(height: 16),
    Text(
      "Non-Coffee",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ),
    MenuList(query: 'Non-Coffee'),
    SizedBox(height: 16),
    Text(
      "Food",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 32,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
