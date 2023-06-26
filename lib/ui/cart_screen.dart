import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  int total = 0;

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
            child: const Text('Cart')),
        centerTitle: true,
      ),
      body:
          Consumer<CartProvider>(builder: (context, CartProvider cart, widget) {
        return ListView.separated(
          itemCount: cart.cartList.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(cart.cartList[index].name,
                      style: const TextStyle(fontSize: 20)),
                ),
                subtitle: Row(
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          cart.removeQuantity(index);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('${cart.cartList[index].qty}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    ),
                    Ink(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          cart.addQuantity(index);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Text('Rp ${Currency(cart.cartList[index].subtotal)}',
                    style: const TextStyle(fontSize: 16)),
              ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total: ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Consumer<CartProvider>(builder:
                    (BuildContext context, CartProvider cart, Widget? child) {
                  total = cart.getTotal();
                  return Text('Rp ${Currency(total)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold));
                }),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () async {
              //order

              //show notif
              await notificationService.showNotification(
                  id: 0,
                  title: "Order placed",
                  body:
                      "Thank you for your order. Your order will be ready soon.",
                  payload: "Order");
            },
            child: const Text(
              "ORDER",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
