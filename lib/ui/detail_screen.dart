import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/menu.dart';
import '../utils/currency.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final menuQuery = FirebaseFirestore.instance
        .collection('menu')
        .where('menuId', isEqualTo: widget.id)
        .snapshots();

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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: menuQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          Menu menu = Menu.fromMap(snapshot.data!.docs[0].data());

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset(menu.imageUrl, height: 280),
                const SizedBox(height: 60),
                Text(
                  menu.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp ${Currency(menu.price)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  menu.description,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: menuQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          Menu menu = Menu.fromMap(snapshot.data!.docs[0].data());
          return navbar(context, menu);
        },
      ),
    );
  }

  Widget navbar(BuildContext context, Menu menu) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          Row(
            children: [
              const Text(
                "Item Quantity :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              SizedBox(
                width: 36,
                child: ElevatedButton(
                  child: const Text('-'),
                  onPressed: () {
                    setState(() {
                      if (qty > 1) {
                        qty--;
                      }
                    });
                  },
                ),
              ),
              const SizedBox(width: 40),
              Text(
                qty.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 40),
              SizedBox(
                width: 36,
                child: ElevatedButton(
                  child: const Text('+'),
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
            ),
            onPressed: () {},
            child: Text(
              "Add to cart - ${Currency(menu.price * qty)}",
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
