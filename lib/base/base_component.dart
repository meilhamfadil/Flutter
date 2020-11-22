import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

abstract class AvailableComponent extends Widget {
  void setOwner(BaseScreenState owner) {}
}

abstract class BaseComponent extends StatefulWidget implements AvailableComponent {
  BaseComponent({Key key}) : super(key: key);

  BaseScreenState owner;

  @override
  void setOwner(BaseScreenState owner) {
    this.owner = owner;
  }
}

abstract class BaseStatelessComponent extends StatelessWidget implements AvailableComponent {
  BaseScreenState owner;

  void setOwner(BaseScreenState owner) {
    this.owner = owner;
  }
}

abstract class BaseComponentState<Page extends BaseComponent> extends State<Page> {
  BaseScreenState getScreenOwner() => (this as Page).owner;
}

mixin Component<Page extends BaseComponent> on BaseComponentState<Page> {
  @override
  Widget build(BuildContext context) => renderBody();

  void openScreen(BaseComponent component) {
    getScreenOwner().openComponent(component);
  }

  Widget renderBody();
}
