import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/components/pressable.dart';
import 'package:baseflutter/modules/auth/register/register_component.dart';
import 'package:flutter/material.dart';

class LoginComponent extends BaseStatelessComponent {
  LoginComponent(ScreenContract screen) : super(screen);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("This is first Component"),
                Pressable(
                  label: "Click to open Second Component",
                  onPress: () => screen.openComponent(RegisterComponent(screen)),
                ),
              ],
            ),
          ),
        ),
      );
}
