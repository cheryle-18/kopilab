import 'package:flutter/material.dart';
import 'package:kopilab/widgets/order_list.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OrderList(query: 'Done');
  }
}
