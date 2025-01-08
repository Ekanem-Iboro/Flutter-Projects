import 'package:flutter/material.dart';
import 'package:weather_app/weather_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// Theme Notifier class
class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = true;

  ThemeData get currentTheme => isDarkMode
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData.light(useMaterial3: true);

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

// Main app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.currentTheme,
            home: const WeatherApp(),
          );
        },
      ),
    );
  }
}
