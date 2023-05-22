import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:go_router/go_router.dart';

class MenuList extends StatelessWidget {
  final String query;

  const MenuList({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuQuery = FirebaseDatabase.instance
        .ref("menu")
        .orderByChild("category")
        .equalTo(query);

    return FirebaseDatabaseQueryBuilder(
      query: menuQuery,
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        }

        return GridView.builder(
          shrinkWrap: true,
          itemCount: snapshot.docs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 240,
          ),
          itemBuilder: (context, index) {
            final menu = snapshot.docs[index].value as Map<String, dynamic>;
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
          Image.asset(
            menu["imageUrl"],
            fit: BoxFit.cover,
            height: 200,
          ),
          Text(menu["name"], style: const TextStyle(fontSize: 20)),
        ],
      ),
      onTap: () {
        context.pushNamed(
          "detail",
          pathParameters: {"id": menu["menuId"]},
        );
      },
    );
  }
}
