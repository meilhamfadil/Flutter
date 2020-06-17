import 'package:baseflutter/assets/measures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: this,
      );

  MainContainer({this.body});
}

class PaddedContainer extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        padding: Measures.mainContainer,
        child: child,
      );

  PaddedContainer({this.child});
}
