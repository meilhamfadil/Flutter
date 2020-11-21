import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/modules/main/main_component_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends BasePageScreen {
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends BasePageScreenState<MainScreen> with BaseScreen {
  @override
  BasePageComponent getDefaultComponent() => MainComponent1();

}
