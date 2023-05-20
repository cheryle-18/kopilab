import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:go_router/go_router.dart';

class OrderList extends StatelessWidget {
  final String query;

  const OrderList({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final htransQuery = FirebaseDatabase.instance
        .ref("htrans")
        .orderByChild("status")
        .equalTo(query);

    return Scaffold(
      body: FirebaseDatabaseQueryBuilder(
        query: htransQuery,
        builder: (context, snapshot, child) {
          if (snapshot.isFetching) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          }

          return ListView.separated(
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              final htrans = snapshot.docs[index].value as Map<String, dynamic>;
              return buildItem(context, htrans);
            },
            separatorBuilder: (context, index) {
              return const Divider();
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
        "Order ${htrans['orderId']}",
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
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
            style: const TextStyle(color: Colors.brown, fontSize: 16),
          ),
        ),
      ),
      onTap: () {
        context.pushNamed('order_detail',
            pathParameters: {'id': htrans['orderId'].toString()});
      },
    );
  }
}
