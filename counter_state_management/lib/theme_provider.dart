import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  bool get isDark => isDarkMode;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData => isDarkMode ? ThemeData.dark() : ThemeData.light();
}
