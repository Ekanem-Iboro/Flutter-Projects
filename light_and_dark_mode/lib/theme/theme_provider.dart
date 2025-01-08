import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/theme/theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = themeData == lightMode ? darkMode : lightMode;
  }
}
