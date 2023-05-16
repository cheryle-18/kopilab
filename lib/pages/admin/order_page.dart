import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:kopilab/pages/admin/done_page.dart';

class OrderPage extends StatelessWidget {
  static const routeName = "/order";

  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            Text("Hello"),
          ],
        ),
      ),
    );
  }
}
