import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:kopilab/pages/admin/done_page.dart';
import 'package:kopilab/pages/admin/order_page.dart';

class AdminPage extends StatefulWidget {
  static const routeName = "/order";

  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;

  final List<Route> _pages = <Route>[
    MaterialPageRoute(builder: (context) => const OrderPage()),
    MaterialPageRoute(builder: (context) => const DonePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: OrderPage()),
      bottomNavigationBar: Builder(builder: (context) {
        return BottomNavigationBar(
          backgroundColor: Colors.brown,
          currentIndex: 0,
          onTap: (index) async {
            switch (index) {
              case 0:
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const OrderPage()),
                    ModalRoute.withName(
                        '/order') // Replace this with your root screen's route name (usually '/')
                    );
                break;
              case 1:
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const DonePage()),
                    ModalRoute.withName(
                        '/order') // Replace this with your root screen's route name (usually '/')
                    );
                break;
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: badges.Badge(
                badgeContent: Text(
                  "3",
                  style: TextStyle(color: Colors.brown),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                child: Icon(Icons.assignment_outlined, color: Colors.white),
              ),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done, color: Colors.white),
              label: "Done",
            )
          ],
          fixedColor: Colors.white,
        );
      }),
    );
  }
}
