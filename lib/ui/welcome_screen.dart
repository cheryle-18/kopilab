import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kopilab/helpers/DatabaseHelper.dart';
import 'package:kopilab/models/cart.dart';
import 'package:kopilab/providers/cart.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.brown,
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background/background.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Image.asset("assets/images/logo/logo.png"),
                  iconSize: 160,
                  onPressed: () {
                    context.pushNamed("login");
                  },
                ),
                const SizedBox(height: 36),
                const Text(
                  "kopilab.",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  child: SizedBox(
                    width: 284,
                    child: Text(
                      "As long as there was coffee in the world, how bad could things be?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: const Size(240, 48),
                  ),
                  child: const Text(
                    "Order Now",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    context.pushNamed("home");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> setCarts(CartProvider cartProvider) async {
    List<Cart> carts = await DatabaseHelper().findAll();
    for (var cart in carts) {
      cartProvider.setCart(cart);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setCarts(Provider.of<CartProvider>(context, listen: false));
    });
  }
}
