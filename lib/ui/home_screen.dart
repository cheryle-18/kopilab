import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../widgets/menu_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCoffee = 0;
  int _currentNonCoffee = 0;
  int _currentFood = 0;

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
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text("Search"),
            const Text("COFFEE"),
            MenuList(query: 'Coffee', current: _currentCoffee),
            const Text("NON - COFFEE"),
            MenuList(query: 'Non-Coffee', current: _currentNonCoffee),
            const Text("FOOD"),
            MenuList(query: 'Food', current: _currentFood),
          ],
        ),
      ),
    );
  }
}
