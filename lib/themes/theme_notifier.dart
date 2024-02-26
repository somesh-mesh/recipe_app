import 'package:demo_flutter/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = AppTheme().purpleTheme;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}