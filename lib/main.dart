import 'package:flutter/material.dart';
import 'package:kopilab/detail_screen.dart';
import 'package:kopilab/home_screen.dart';

import 'models/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Time',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
          menu: ModalRoute.of(context)?.settings.arguments as Menu
        ),
      },
      // home: new Splash(),
    );
  }
}