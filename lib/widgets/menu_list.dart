import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';

import '../models/menu.dart';

class MenuList extends StatefulWidget {
  final String query;
  int current;

  MenuList({Key? key, required this.query, required this.current})
      : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final menuQuery = FirebaseDatabase.instance
        .ref("menu")
        .orderByChild("category")
        .equalTo(widget.query);

    return FirebaseDatabaseQueryBuilder(
      query: menuQuery,
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        }

        List<Menu> menus = [];
        for (var item in snapshot.docs) {
          final c = item.value as Map<String, dynamic>;
          menus.add(Menu.fromJson(c));
        }

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  disableCenter: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: false,
                  height: 200,
                  onPageChanged: (index, reason) {
                    setState(() {
                      widget.current = index;
                    });
                  }),
              items: menus
                  .map((item) => Column(
                        children: [
                          Text(item.name),
                          IconButton(
                            icon: Image.asset(item.imageUrl),
                            iconSize: 160,
                            onPressed: () {},
                          ),
                        ],
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menus.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(widget.current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
