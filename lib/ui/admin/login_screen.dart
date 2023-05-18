import 'package:flutter/material.dart';
import 'package:kopilab/ui/admin/admin_screen.dart';
import 'package:kopilab/ui/admin/order_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool _isError = false;
  bool _obscureText = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "kopilab",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.admin_panel_settings_outlined),
                hintText: "Username",
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: _obscureText,
              controller: _passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.vpn_key_outlined),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 400,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.brown,
                    padding: const EdgeInsets.all(20)),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                    if (_usernameController.text == "admin" &&
                        _passwordController.text == "admin") {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminScreen(),
                      ));
                      return;
                    }
                    _isLoading = false;
                    _isError = true;
                  });
                },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            Text(
              _isError ? "No Credential Found!" : "",
              style: const TextStyle(color: Colors.redAccent, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }
}
