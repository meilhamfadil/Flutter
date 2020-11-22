import 'dart:async';

import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/components/pressable.dart';
import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_component_2.dart';

class MainComponent1 extends BaseComponent {
  @override
  State<StatefulWidget> createState() => _MainComponent1();
}

class _MainComponent1 extends BaseComponentState<MainComponent1> with Component {
  bool _loading = false;

  void setLoading(loading) => setState(() => _loading = loading);

  @override
  Widget renderBody() {
    MainScreenArguments arguments = widget.owner.arguments;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome ${arguments.name}"),
              Text("Phone Number : ${arguments.phone}"),
              Text("Click Button to Change Current Screen"),
              Container(height: 24),
              Pressable(
                label: "Hello",
                loading: _loading,
                onPress: () {
                  widget.owner.openComponent(MainComponent2());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
