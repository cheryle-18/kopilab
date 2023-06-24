import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:kopilab/utils/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

import 'providers/cart.dart';
import 'providers/dtrans.dart';
import 'providers/htrans.dart';
import 'ui/welcome_screen.dart';
import 'ui/home_screen.dart';
import 'ui/detail_screen.dart';
import 'ui/cart_screen.dart';
import 'ui/admin/login_screen.dart';
import 'ui/admin/admin_screen.dart';
import 'ui/admin/order_detail_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: "/welcome",
  debugLogDiagnostics: true,
  errorBuilder: (context, state) {
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _router.goNamed('welcome'));
    return const SizedBox.shrink();
  },
  routes: [
    GoRoute(
      name: "welcome",
      path: "/welcome",
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      name: "home",
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: "detail",
      path: "/detail/:id",
      builder: (context, state) => DetailScreen(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      name: "cart",
      path: "/cart",
      builder: (context, state) => const CartScreen(),
    ),

    // ADMIN ROUTES
    GoRoute(
      name: "login",
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: "admin",
      path: "/admin",
      builder: (context, state) => const AdminScreen(),
    ),
    GoRoute(
      name: "order_detail",
      path: "/order/:id",
      builder: (context, state) => OrderDetailScreen(
        id: state.pathParameters['id']!,
      ),
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => HtransProvider()),
        ChangeNotifierProvider(create: (context) => DtransProvider()),
      ],
      child: MaterialApp.router(
        title: 'kopilab',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          fontFamily: "Lato",
        ),
        routerConfig: _router,
      ),
    );
  }
}
