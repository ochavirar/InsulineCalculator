import "package:flutter/material.dart";

import 'app_themes.dart';

class ThemeProvider with ChangeNotifier {
  int themeIndex = 0;
  ThemeData _themeData = arrThemes[0];
  ThemeData get themeData => _themeData;

  void changeTheme() {
    print(themeIndex);
    if (themeIndex == 0) {
      themeIndex = 1;
      _themeData = arrThemes[1];
    } else {
      themeIndex = 0;
      _themeData = arrThemes[0];
    }
    notifyListeners();
    print(themeIndex);
    print(themeData.primaryColor);
  }
}
