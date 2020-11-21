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
  Color primary = Colors.green;
  Color accent = Colors.indigo;
  Color secondary = Colors.greenAccent;
  Color white = Colors.white;
  Color disable = Colors.black38;
  Color textDisable = Colors.white54;
  Color transparent = Colors.transparent;
  Color black = Colors.black;
  Color text = Colors.black45;
}
