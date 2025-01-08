import 'package:flutter/material.dart';
import 'package:ticket_booking_app/screens/buttom_bar.dart';
import 'package:ticket_booking_app/utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primary,
          useMaterial3: true,
        ),
        home: const LayOutPage());
  }
}
