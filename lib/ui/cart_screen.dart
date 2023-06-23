import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../utils/currency.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
            onPressed: () {},
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
