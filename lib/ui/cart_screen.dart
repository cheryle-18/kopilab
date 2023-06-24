import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kopilab/ui/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../utils/currency.dart';
import '../utils/notification_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final NotificationService notificationService;

  @override
  void initState() {
    notificationService = NotificationService();
    notificationService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              context.goNamed("home");
            },
            child: const Text('kopilab.')),
        centerTitle: true,
      ),
      body:
          Consumer<CartProvider>(builder: (context, CartProvider cart, widget) {
        return ListView.builder(
          itemCount: cart.cartList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(cart.cartList[index].name),
              subtitle: Text(
                  '${cart.cartList[index].qty} x Rp ${cart.cartList[index].price}'),
              trailing: Text('Rp ${Currency(cart.cartList[index].subtotal)}'),
            );
          },
        );
      }),
      bottomNavigationBar: navbar(context),
    );
  }

  Widget navbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
            ),
            onPressed: () async {
              //order

              //show notif
              //TODO: change payload to order
              await notificationService.showNotification(
                  id: 0,
                  title: "Order placed",
                  body: "Thank you for your order. Your order will be ready soon.",
                  payload: "Order");
            },
            child: const Text(
              "ORDER",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
