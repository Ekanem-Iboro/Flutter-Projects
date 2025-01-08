import 'package:eccomance_flutter/models/cart.dart';
import 'package:eccomance_flutter/pages/cart_page.dart';
import 'package:eccomance_flutter/pages/home_page.dart';
import 'package:eccomance_flutter/pages/intro_page.dart';
import 'package:eccomance_flutter/pages/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModal(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const IntroPage(),
          '/home': (context) => const HomePage(),
          '/shop': (context) =>
              const ShopPage(), // Add your HomePage widget here
          '/cart': (context) =>
              const CartPage(), // Add your HomePage widget here
        },
      ),
    );
  }
}
