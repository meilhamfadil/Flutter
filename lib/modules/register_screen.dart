import 'dart:async';

import 'package:baseflutter/components/main_container.dart';
import 'package:baseflutter/components/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  bool _loading = false;

  _setLoading(bool value) => setState(() => _loading = value);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Aplikasi bagus ini"),
        ),
        body: Builder(
          builder: (BuildContext context) => MainContainer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Pressable(
                    label: "Do Something Here",
                    loading: _loading,
                    onPress: () {
                      _setLoading(true);
                      Timer(Duration(seconds: 2), () => _setLoading(false));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
