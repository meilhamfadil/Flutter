import 'package:baseflutter/assets/app_theme.dart';
import 'package:baseflutter/modules/auth/auth_screen.dart';
import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

var appTheme = AppTheme();

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.theme,
        initialRoute: AuthScreen.routeName,
        routes: {
          AuthScreen.routeName: (BuildContext context) => AuthScreen(),
          MainScreen.routeName: (BuildContext context) => MainScreen(),
        },
      );
}
