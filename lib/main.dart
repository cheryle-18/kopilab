import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kopilab/ui/cart_screen.dart';
import 'package:kopilab/ui/welcome_screen.dart';
import 'package:kopilab/ui/home_screen.dart';
import 'package:kopilab/ui/detail_screen.dart';
import 'package:kopilab/ui/admin/login_screen.dart';
import 'package:kopilab/ui/admin/admin_screen.dart';
import 'package:kopilab/ui/admin/order_screen.dart';
import 'package:kopilab/ui/admin/done_screen.dart';
import 'package:kopilab/ui/admin/order_detail_screen.dart';

import 'firebase_options.dart';

import 'models/menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kopilab',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: "Lato",
      ),
      initialRoute: AdminScreen.routeName,
      routes: {
        // USER ROUTES
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
            menu: ModalRoute.of(context)?.settings.arguments as Menu),
        CartScreen.routeName: (context) => const CartScreen(),
        // ADMIN ROUTES
        LoginScreen.routeName: (context) => const LoginScreen(),
        AdminScreen.routeName: (context) => const AdminScreen(),
        OrderScreen.routeName: (context) => const OrderScreen(),
        DoneScreen.routeName: (context) => const DoneScreen(),
        OrderDetailScreen.routeName: (context) => const OrderDetailScreen(),
      },
      // home: new Splash(),
    );
  }
}
