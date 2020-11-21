import 'file:///C:/Users/Euclid/AndroidStudioProjects/_Base/flutter/lib/modules/main_screen.dart';
import 'file:///C:/Users/Euclid/AndroidStudioProjects/_Base/flutter/lib/modules/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var routes = {
  "/": (BuildContext context) => MainScreen(),
  "/register": (BuildContext context) => RegisterScreen()
};

const homeRoute = "/";
const registerRoute = "/register";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}

class NavigateTo {
  static void home(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(homeRoute);

  static void register(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(registerRoute);
}
