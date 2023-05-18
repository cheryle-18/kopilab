import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  static const routeName = "/order_detail";

  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Order Detail"),
    );
  }
}
