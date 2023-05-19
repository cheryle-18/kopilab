import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final String id;

  const OrderDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Order Detail"),
    );
  }
}
