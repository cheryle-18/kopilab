import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              icon: const badges.Badge(
                badgeContent: Text(
                  "0",
                  style: TextStyle(color: Colors.brown),
                ),
                badgeAnimation: badges.BadgeAnimation.fade(toAnimate: false),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                child: Icon(Icons.shopping_cart),
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
