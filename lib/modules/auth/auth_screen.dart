import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/modules/auth/login/login_component.dart';
import 'package:flutter/material.dart';
import 'auth_screen_argument.dart';

class AuthScreen extends BaseScreen {
  static final String routeName = "/";

  @override
  State<StatefulWidget> createState() => _AuthScreen();
}

class _AuthScreen extends BaseScreenState<AuthScreen, AuthScreenArguments> with Screen {
  @override
  Component getDefaultComponent() => LoginComponent(this);
}
