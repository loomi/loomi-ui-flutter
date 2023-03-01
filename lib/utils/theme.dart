import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData _theme = ThemeData();

  ThemeData get getTheme {
    return _theme;
  }

  setTheme(ThemeData theme) {
    _theme = theme;
  }
}
