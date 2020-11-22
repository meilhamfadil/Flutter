import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/components/pressable.dart';
import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:baseflutter/modules/main/main_screen_argument.dart';
import 'package:flutter/material.dart';

class RegisterComponent extends BaseStatelessComponent {
  RegisterComponent(ScreenContract screen) : super(screen);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Pressable(
              label: "Move to next screen",
              onPress: () => screen.openScreen(MainScreen.routeName,
                  arguments: MainScreenArguments(
                    "Fadil",
                    "081313xxxxxx",
                  )),
            ),
          ),
        ),
      );
}
