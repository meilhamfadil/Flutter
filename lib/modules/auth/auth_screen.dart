import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/components/pressable.dart';
import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:flutter/material.dart';

class AuthScreenArguments {}

class AuthScreen extends BaseScreen {
  @override
  State<StatefulWidget> createState() => _AuthScreen();
}

class _AuthScreen extends BaseScreenState<AuthScreen, AuthScreenArguments> with Screen {
  @override
  AvailableComponent getDefaultComponent() => SingleAuthComponent();
}

class SingleAuthComponent extends BaseStatelessComponent {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Pressable(
              label: "Move to next screen",
              onPress: () => Navigator.of(context).pushNamed(
                "/home",
                arguments: MainScreenArguments("Fadil", "081313xxxxxx"),
              ),
            ),
          ),
        ),
      );
}
