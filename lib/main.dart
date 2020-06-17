import 'package:baseflutter/assets/styles.dart';
import 'package:baseflutter/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: appTheme,
      initialRoute: "/",
      routes: routes,
      debugShowCheckedModeBanner: false,
    ));
