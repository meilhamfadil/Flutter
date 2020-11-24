import 'package:flutter/material.dart';

class AppTheme {
  AppColor colors = AppColor();
  ThemeData theme = ThemeData(
    primarySwatch: Colors.teal,
    primaryTextTheme: TextTheme(
      button: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white),
    ),
  );
}

class AppColor {
  static Color primary = Colors.cyan;
  static Color accent = Colors.indigo;
  static Color secondary = Colors.blueAccent;
  static Color white = Colors.white;
  static Color disable = Colors.black38;
  static Color textDisable = Colors.white54;
  static Color transparent = Colors.transparent;
  static Color black = Colors.black;
  static Color text = Colors.black45;
}
