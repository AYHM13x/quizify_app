import 'package:flutter/material.dart';

import 'AsstesApp.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme;

  setLightMode() {
    currentTheme = ThemeData(
      brightness: Brightness.light, // LightMode
      fontFamily: FontFamilies.comicSansMS,
      //scaffoldBackgroundColor: Colors.red,
    );
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: FontFamilies.comicSansMS, // DarkMode
      //scaffoldBackgroundColor: Colors.green,
    );
    notifyListeners();
  }
}
