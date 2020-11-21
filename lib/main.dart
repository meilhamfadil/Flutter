import 'package:baseflutter/assets/app_theme.dart';
import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:baseflutter/modules/register_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BaseScreen());

var appTheme = AppTheme();

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.theme,
        home: MainScreen(),
      );
}
