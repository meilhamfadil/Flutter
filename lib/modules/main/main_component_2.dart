import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainComponent2 extends BaseComponent {
  @override
  State<StatefulWidget> createState() => _MainComponent2();
}

class _MainComponent2 extends BaseComponentState<MainComponent2> with Component {
  @override
  Widget renderBody() => Scaffold(
        body: Center(
          child: Text("Welcome to Second Component"),
        ),
      );
}
