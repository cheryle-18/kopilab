import 'package:flutter/material.dart';
import 'package:kopilab/ui/admin/order_list.dart';

class DoneScreen extends StatelessWidget {
  static const routeName = "/done";

  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderList(query: 'Done');
  }
}
