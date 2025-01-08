import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/pages/home_page.dart';
// import 'package:light_and_dark_mode/theme/theme_data.dart';
import 'package:light_and_dark_mode/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<ThemeProvider>(context).themeData,
        // theme: lightMode,
        // darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
