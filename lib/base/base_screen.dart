import 'package:baseflutter/base/base_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePageScreen extends StatefulWidget {
  BasePageScreen({Key key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen> extends State<Page> {
  BasePageComponent _currentComponent;

  void openComponent(BasePageComponent component) {
    setState(() {
      component.setOwner(this);
      _currentComponent = component;
    });
  }
}

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  @override
  Widget build(BuildContext context) {
    if (_currentComponent == null) {
      openComponent(getDefaultComponent());
      return Center(child: CircularProgressIndicator());
    }
    return _currentComponent;
  }

  BasePageComponent getDefaultComponent();
}
