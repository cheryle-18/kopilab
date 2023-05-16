import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kopilab/pages/home_screen.dart';
import 'package:kopilab/pages/detail_screen.dart';
import 'package:kopilab/pages/admin/login_page.dart';
import 'package:kopilab/pages/admin/order_page.dart';
import 'package:kopilab/pages/admin/done_page.dart';

import 'firebase_options.dart';

import 'models/menu.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kopilab',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: "Lato",
      ),
      initialRoute: OrderPage.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
            menu: ModalRoute.of(context)?.settings.arguments as Menu),
        // ADMIN ROUTES
        LoginPage.routeName: (context) => const LoginPage(),
        OrderPage.routeName: (context) => const OrderPage(),
        DonePage.routeName: (context) => const DonePage(),
      },
      // home: new Splash(),
    );
  }
}
