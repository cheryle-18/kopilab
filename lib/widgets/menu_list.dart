import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuList extends StatelessWidget {
  final String query;

  const MenuList({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuQuery = FirebaseFirestore.instance
        .collection('menu')
        .where('category', isEqualTo: query)
        .snapshots();

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: menuQuery,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 240,
          ),
          itemBuilder: (context, index) {
            final menu = snapshot.data!.docs[index].data();
            return buildItem(context, menu);
          },
        );
      },
    );
  }

  Widget buildItem(BuildContext context, Map<String, dynamic> menu) {
    return InkWell(
      splashColor: Colors.brown,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              menu["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
          Text(menu["name"], style: const TextStyle(fontSize: 20), textAlign: TextAlign.center, overflow: TextOverflow.fade),
        ],
      ),
      onTap: () {
        context.pushNamed(
          "detail",
          pathParameters: {"id": menu["menuId"].toString()},
        );
      },
    );
  }
}
