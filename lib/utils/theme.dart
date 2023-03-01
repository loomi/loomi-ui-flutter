import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData _theme = ThemeData();

  static ThemeData get getTheme {
    return _theme;
  }

  static setTheme(ThemeData theme) {
    _theme = theme;
  }
}
