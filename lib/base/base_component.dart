import 'package:baseflutter/assets/string.dart';
import 'package:baseflutter/base/base_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_screen.dart';

// Main Component
abstract class Component extends Widget {}

// Stateless
abstract class BaseStatelessComponent extends StatelessWidget implements Component {
  final ScreenContract screen;

  const BaseStatelessComponent(this.screen, {Key key}) : super(key: key);
}

// Stateful
abstract class BaseComponent extends StatefulWidget implements Component {
  final ScreenContract screen;

  const BaseComponent(this.screen, {Key key}) : super(key: key);
}

abstract class BaseComponentState<Page extends BaseComponent, Cubit extends BaseCubit<StateDao>, StateDao> extends State<Page> {
  final ScreenContract screen;
  var arguments;

  BaseComponentState(this.screen);
}

mixin RenderComponent<Page extends BaseComponent, Cubit extends BaseCubit<StateDao>, StateDao>
    on BaseComponentState<Page, Cubit, StateDao> {
  bool isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocProvider<Cubit>(
      create: (BuildContext context) => initCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: renderAppBar(),
          body: BlocConsumer<Cubit, StateDao>(
            listener: blocListener,
            builder: (BuildContext context, StateDao data) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: render(context, data),
            ),
          ),
        ),
      ),
    );
  }

  Cubit initCubit();

  void blocListener(BuildContext context, StateDao data);

  void openComponent(Component component) {
    screen.openComponent(component);
  }

  void replaceComponent(Component component) {
    screen.replaceComponent(component);
  }

  Widget renderAppBar() {
    return null;
  }

  Widget render(BuildContext context, StateDao data);
}
