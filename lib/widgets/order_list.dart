import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderList extends StatelessWidget {
  final String query;

  const OrderList({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final htransQuery = FirebaseFirestore.instance
        .collection('htrans')
        .where('status', isEqualTo: query)
        .orderBy('createdAt', descending: true)
        .snapshots();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: htransQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return buildItem(context, snapshot.data!.docs[index].data());
            },
          );
        },
      ),
    );
  }

  Widget buildItem(BuildContext context, Map<String, dynamic> htrans) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        "Order ${htrans['orderId'].toString().substring(0,8)}",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      ),
      subtitle: Text(
          '${htrans["totalItem"]} ${htrans["totalItem"] == 1 ? "Item" : "Items"}'),
      trailing: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: query == "Pending" ? Colors.yellow : Colors.lightGreen,
        ),
        child: Center(
          child: Text(
            htrans["status"],
            style: const TextStyle(color: Colors.brown, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        context.pushNamed(
          'order_detail',
          pathParameters: {'id': htrans['orderId'].toString()},
        );
      },
    );
  }
}
