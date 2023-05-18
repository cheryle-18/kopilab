import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:kopilab/ui/admin/done_screen.dart';
import 'package:kopilab/ui/admin/order_screen.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = "/admin";

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
        leading: const BackButton(color: Colors.white),
        title: const Text("kopilab."),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: const Text(
                "3",
                style: TextStyle(color: Colors.brown),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: _selectedIndex == 0 ? Colors.white : Colors.black,
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
