import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/currency.dart';

class DetailOrderList extends StatelessWidget {
  final int id;
  final String status;

  const DetailOrderList({Key? key, required this.id, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dtransQuery = FirebaseFirestore.instance
        .collection('dtrans')
        .where('orderId', isEqualTo: id)
        .orderBy('menuId')
        .snapshots();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: dtransQuery,
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
              final docId = snapshot.data!.docs[index].reference.id.toString();
              final dtrans = snapshot.data!.docs[index].data();
              return buildMenu(context, docId, dtrans);
            },
          );
        },
      ),
    );
  }

  Widget buildMenu(
      BuildContext context, String docId, Map<String, dynamic> dtrans) {
    final menuQuery = FirebaseFirestore.instance
        .collection('menu')
        .where('menuId', isEqualTo: dtrans['menuId'])
        .snapshots();

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: menuQuery,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final menu = snapshot.data!.docs[0].data();
        return buildItem(context, docId, dtrans, menu);
      },
    );
  }

  Widget buildItem(BuildContext context, String docId,
      Map<String, dynamic> dtrans, Map<String, dynamic> menu) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      leading: Image.asset(menu["imageUrl"]),
      title: Text(
        '${menu["name"]}',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      visualDensity: const VisualDensity(vertical: 4),
      subtitle: Text('${Currency(dtrans["price"])} x ${dtrans["qty"]}'),
      trailing: status == 'Pending'
          ? Checkbox(
              value: dtrans['status'] == 'Done',
              onChanged: (value) {
                updateDtrans(docId, dtrans);
              },
            )
          : null,
      onTap: () {
        if (status == 'Pending') {
          updateDtrans(docId, dtrans);
        }
      },
    );
  }

  void updateDtrans(String docId, Map<String, dynamic> dtrans) {
    if (dtrans['status'] == 'Pending') {
      dtrans['status'] = 'Done';
    } else {
      dtrans['status'] = 'Pending';
    }
    FirebaseFirestore.instance.collection('dtrans').doc(docId).update(dtrans);
  }
}
