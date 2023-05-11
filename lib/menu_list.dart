import 'package:kopilab/menu_card.dart';
import 'package:flutter/material.dart';
import 'models/menu.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        final Menu m = menuList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuCard(menu: m),
            SizedBox(
              height: 10
            )
          ]
        );
      }
    );
  }
}
