import 'package:flutter/material.dart';

import '../../widgets/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OrderList(query: 'Pending');
  }
}
