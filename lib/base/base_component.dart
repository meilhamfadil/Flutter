import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

// Main Component
abstract class Component extends Widget {}

// Stateless
abstract class BaseStatelessComponent extends StatelessWidget implements Component {
  final ScreenContract screen;

  BaseStatelessComponent(this.screen, {Key key}) : super(key: key);
}

// Stateful
abstract class BaseComponent extends StatefulWidget implements Component {
  final ScreenContract screen;

  BaseComponent(this.screen, {Key key}) : super(key: key);
}

abstract class BaseComponentState<Page extends BaseComponent> extends State<Page> {
  final ScreenContract screen;
  var arguments;

  BaseComponentState(this.screen);
}

mixin RenderComponent<Page extends BaseComponent> on BaseComponentState<Page> {
  @override
  Widget build(BuildContext context) => render();

  void openComponent(Component component) {
    screen.openComponent(component);
  }

  void replaceComponent(Component component) {
    screen.replaceComponent(component);
  }

  Widget render();
}
