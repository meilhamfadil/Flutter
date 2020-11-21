import 'dart:async';

import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/components/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_component_2.dart';

class MainComponent1 extends BasePageComponent {
  @override
  State<StatefulWidget> createState() => _MainComponent1();
}

class _MainComponent1 extends BasePageComponentState<MainComponent1> with BaseComponent {
  bool _loading = false;

  void setLoading(loading) => setState(() => _loading = loading);

  @override
  Widget renderBody() => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Click Button to Change Current Screen"),
                Container(height: 24),
                Pressable(
                  label: "Hello",
                  loading: _loading,
                  onPress: () {
                    setLoading(true);
                    Timer(Duration(seconds: 2), () {
                      widget.owner.openComponent(MainComponent2());
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
