import 'package:flutter/material.dart';
import 'package:kopilab/ui/admin/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderList(query: 'Pending');
  }
}
