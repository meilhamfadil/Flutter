import 'package:baseflutter/modules/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

abstract class BasePageComponent extends StatefulWidget {
  BasePageComponent({Key key}) : super(key: key);

  BasePageScreenState owner;

  void setOwner(BasePageScreenState owner) {
    this.owner = owner;
  }
}

abstract class BasePageComponentState<Page extends BasePageComponent> extends State<Page> {
  BasePageScreenState getScreenOwner() => (this as Page).owner;
}

mixin BaseComponent<Page extends BasePageComponent> on BasePageComponentState<Page> {
  @override
  Widget build(BuildContext context) => renderBody();

  void openScreen(BasePageComponent component) {
    getScreenOwner().openComponent(component);
  }

  Widget renderBody();
}
