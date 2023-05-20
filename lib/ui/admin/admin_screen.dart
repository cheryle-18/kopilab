import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';

import 'done_screen.dart';
import 'order_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const OrderScreen(), const DoneScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.goNamed("login")),
        title: const Text("kopilab."),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: const Text(
                "0",
                style: TextStyle(color: Colors.brown),
              ),
              badgeAnimation:
                  const badges.BadgeAnimation.fade(toAnimate: false),
              badgeStyle: badges.BadgeStyle(
                badgeColor: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
              child: const Icon(Icons.assignment_outlined),
            ),
            label: "Order",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Done",
          )
        ],
      ),
    );
  }
}
