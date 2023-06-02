import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/currency.dart';
import '../../widgets/detail_order_list.dart';

class OrderDetailScreen extends StatelessWidget {
  final String id;

  const OrderDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final htransQuery = FirebaseFirestore.instance
        .collection('htrans')
        .where('orderId', isEqualTo: int.parse(id))
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Order $id'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: htransQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final status = snapshot.data!.docs[0].data()['status'];
          return DetailOrderList(
            id: int.parse(id),
            status: status,
          );
        },
      ),
      bottomNavigationBar: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: htransQuery,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docId = snapshot.data!.docs[0].reference.id.toString();
          return navbar(context, docId, snapshot.data!.docs[0].data());
        },
      ),
    );
  }

  Widget navbar(
      BuildContext context, String docId, Map<String, dynamic> htrans) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          Text(
            "Total Price: Rp ${Currency(htrans['totalPrice'])}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          if (htrans['status'] == 'Pending') ...[
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 24),
              ),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('dtrans')
                    .where('orderId', isEqualTo: id)
                    .count()
                    .get()
                    .then((value) {
                  if (value.count == 0) {
                    htrans['status'] = 'Done';
                    FirebaseFirestore.instance
                        .collection('htrans')
                        .doc(docId)
                        .update(htrans);
                  }
                });
                context.pop();
              },
              child: const Text(
                "Check Order",
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ],
      ),
    );
  }
}
