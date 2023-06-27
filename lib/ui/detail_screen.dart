import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kopilab/utils/notification_service.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../models/cart.dart';
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
  late final NotificationService notificationService;

  @override
  void initState() {
    notificationService = NotificationService();
    notificationService.init();
    super.initState();
  }

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
                badgeAnimation:
                    const badges.BadgeAnimation.fade(toAnimate: false),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                child: const Icon(Icons.shopping_cart),
              ),
              onPressed: () {
                context.pushNamed("cart");
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: menuQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          Menu menu = Menu.fromMap(snapshot.data!.docs[0].data());

          return SingleChildScrollView(
            child: Center(
              child: Padding(
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
              ),
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
          Consumer<CartProvider>(builder: (context, CartProvider cart, widget) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 24),
              ),
              onPressed: () async {
                addCart(menu.menuId, menu.name, menu.price, qty, menu.price * qty, cart);

                //show notif
                await notificationService.showNotification(
                    id: 0,
                    title: "${qty} ${menu.name} added to cart",
                    body: "",
                    payload: "Menu"
                );
              },
              child: Text(
                "Add to cart - ${Currency(menu.price * qty)}",
                style: const TextStyle(fontSize: 20),
              ),
            );
          }),
        ],
      ),
    );
  }
  Future<void> addCart(int menuId, String name, int price, int qty, int subtotal, CartProvider cart) async {
    var newCart = Cart(
      menuId: menuId,
      name: name,
      price: price,
      qty: qty,
      subtotal: subtotal,
    );
    await cart.addCart(newCart);
  }
}


