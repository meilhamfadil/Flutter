import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/modules/main/main_component_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreenArguments {
  final String name;
  final String phone;

  MainScreenArguments(this.name, this.phone);
}

class MainScreen extends BaseScreen {
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends BaseScreenState<MainScreen, MainScreenArguments> with Screen {
  @override
  AvailableComponent getDefaultComponent() => MainComponent1();
}
