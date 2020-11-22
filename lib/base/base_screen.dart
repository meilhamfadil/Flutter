import 'package:baseflutter/base/base_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ScreenContract<Page extends BaseScreen, Args> extends State<Page> {
  List<Component> _components = List();
  Component _currentComponent;
  Args arguments;

  void openComponent(Component component) => setState(() {
        _components.add(component);
        _currentComponent = component;
      });

  void replaceComponent(Component component) => setState(() {
        _components.removeLast();
        _components.add(component);
        _currentComponent = component;
      });

  void onArgumentReceived(Args args) => setState(() {
        arguments = args;
      });

  void openScreen(String target, {dynamic arguments}) => Navigator.of(context).pushNamed(
        target,
        arguments: arguments,
      );
}

abstract class BaseScreen extends StatefulWidget {
  BaseScreen({Key key}) : super(key: key);
}

abstract class BaseScreenState<Page extends BaseScreen, Args> extends ScreenContract<Page, Args> {}

mixin Screen<Page extends BaseScreen, Args> on BaseScreenState<Page, Args> {
  @override
  Widget build(BuildContext context) {
    onArgumentReceived(ModalRoute.of(context).settings.arguments);
    if (_currentComponent == null) openComponent(getDefaultComponent());

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

  Component getDefaultComponent();
}
