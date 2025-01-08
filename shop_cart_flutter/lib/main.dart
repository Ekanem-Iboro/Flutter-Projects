import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart_flutter/components/cart_provider.dart';
import 'package:shop_cart_flutter/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//types of provider
//1. ChangeNotifierProvider
//2. Provider
//3. Future Provider
//4. stream Provider.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            fontFamily: 'Roboto',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: const TextTheme(
              titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            useMaterial3: true,
          ),
          home: const Home(),),
    );
  }
}
