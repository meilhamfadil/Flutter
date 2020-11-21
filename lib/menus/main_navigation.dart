import 'package:baseflutter/core/model/MenuModel.dart';
import 'package:flutter/material.dart';

List<NavigationModel> mainNavigation = [
  NavigationModel(BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")), "Home"),
  NavigationModel(BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")), "Home")
];

class NavigationModel {
  final BottomNavigationBarItem menu;
  final String target;

  NavigationModel(this.menu, this.target);
}
