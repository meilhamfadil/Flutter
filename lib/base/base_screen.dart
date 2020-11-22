import 'package:baseflutter/base/base_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen extends StatefulWidget {
  BaseScreen({Key key}) : super(key: key);
}

abstract class BaseScreenState<Page extends BaseScreen, Args> extends State<Page> {
  AvailableComponent _currentComponent;
  Args arguments;
  List<AvailableComponent> _components = List();

  void openComponent(AvailableComponent component) {
    setState(() {
      component.setOwner(this);
      _components.add(component);
      _currentComponent = component;
    });
  }

  void replaceComponent(AvailableComponent component) {
    setState(() {
      _components.removeLast();
      _components.add(component);
      _currentComponent = component;
    });
  }

  void onArgumentReceived(Args args) {
    setState(() {
      arguments = args;
    });
  }
}

mixin Screen<Page extends BaseScreen, Args> on BaseScreenState<Page, Args> {
  @override
  Widget build(BuildContext context) {
    onArgumentReceived(ModalRoute.of(context).settings.arguments);

    if (_currentComponent == null) {
      openComponent(getDefaultComponent());
    }

    return WillPopScope(
      onWillPop: _onBackPress,
      child: _currentComponent,
    );
  }

  Future<bool> _onBackPress() async {
    if (_components.length > 1) {
      setState(() {
        _components.removeLast();
        _currentComponent = _components.last;
      });
      return false;
    }
    return true;
  }

  AvailableComponent getDefaultComponent();
}
