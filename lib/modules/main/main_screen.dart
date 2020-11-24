import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'dashboard/dashboard_component.dart';
import 'main_screen_argument.dart';

class MainScreen extends BaseScreen {
  static final String routeName = "/main";

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends BaseScreenState<MainScreen, MainScreenArguments> with Screen {
  @override
  Component getDefaultComponent() => Dashboard(this);
}

class Dashboard extends BaseStatelessComponent {
  Dashboard(ScreenContract screen) : super(screen);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text("Apps"),
        ),
      );
}
