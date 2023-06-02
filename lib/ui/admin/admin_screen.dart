import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

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
    final htransQuery = FirebaseFirestore.instance
        .collection('htrans')
        .where('status', isEqualTo: 'Pending')
        .orderBy('orderId')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text("kopilab."),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: htransQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final pending = snapshot.data!.docs.length;
          return bottomNavigationBar(pending);
        },
      ),
    );
  }

  Widget bottomNavigationBar(int pending) {
    return BottomNavigationBar(
      backgroundColor: Colors.brown,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: badges.Badge(
            badgeContent: Text(
              pending.toString(),
              style: const TextStyle(color: Colors.brown),
            ),
            badgeAnimation: const badges.BadgeAnimation.fade(toAnimate: false),
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
    );
  }
}
