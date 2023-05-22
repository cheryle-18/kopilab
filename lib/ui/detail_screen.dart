import 'package:badges/badges.dart' as badges;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:go_router/go_router.dart';

import '../models/menu.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final menuQuery = FirebaseDatabase.instance
        .ref("menu")
        .orderByChild("menuId")
        .equalTo(widget.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('kopilab.'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: IconButton(
              icon: const badges.Badge(
                badgeContent: Text(
                  "0",
                  style: TextStyle(color: Colors.brown),
                ),
                badgeAnimation: badges.BadgeAnimation.fade(toAnimate: false),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                child: Icon(Icons.shopping_cart),
              ),
              onPressed: () {
                context.pushNamed("cart");
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: FirebaseDatabaseQueryBuilder(
          query: menuQuery,
          builder: (context, snapshot, child) {
            if (snapshot.isFetching) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            }

            Menu menu =
                Menu.fromJson(snapshot.docs[0].value as Map<String, dynamic>);

            var images = <Widget>[
              Image.asset(menu.imageUrl),
              Image.network(menu.imageUrl2),
            ];

            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                images[0],
                images[1],
                Text(menu.name),
                Text('Rp ${menu.price}'),
                Text(menu.description),
                Row(
                  children: [
                    Text('Item Quantity'),
                    ElevatedButton(
                      child: Text('-'),
                      onPressed: () {},
                    ),
                    Text('1'),
                    ElevatedButton(
                      child: Text('+'),
                      onPressed: () {},
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text('Add to cart - ${menu.price}'),
                  onPressed: () {},
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
