import 'package:flutter/material.dart';
import 'package:kopilab/menu_list.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('kopilab.')
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.brown,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(32.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF58390c),
                    Colors.brown,
                  ],
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "It's Coffee Time!",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                    textAlign: TextAlign.left
                  ),
                  SizedBox(
                      height: 15
                  ),
                  Text(
                    "Spend your break with a refreshing beverage from our delightful selection",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                  color: Color(0xFFFAFAFA),
                ),
                child: const MenuList()
              )
            ),
          ]
        )
      )
    );
  }
}
