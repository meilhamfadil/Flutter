import 'package:baseflutter/assets/measures.dart';
import 'package:baseflutter/assets/string.dart';
import 'package:baseflutter/core/model/MenuModel.dart';
import 'package:baseflutter/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.appName),
        ),
        body: Container(
          padding: Measures.mainContainer,
          alignment: Alignment.center,
          child: _content(context),
        ),
        bottomNavigationBar: _bottomNavigationBar(context),
      );

  void _onNavigationTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) =>
      BottomNavigationBar(
        items: menu
            .map((MenuModel menu) => BottomNavigationBarItem(
                  icon: Icon(menu.icon),
                  title: Text(menu.label),
                ))
            .toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        onTap: _onNavigationTapped,
      );

  Widget _content(BuildContext context) =>
      Center(child: Center(child: _getWidget()));

  Widget _getWidget() => Opacity(
    opacity: 0.05,
    child: Icon(menu[selectedIndex].icon, size: 200),
  );
}
