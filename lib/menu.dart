import 'package:baseflutter/core/model/MenuModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<MenuModel> menu = [
  MenuModel(label: "Home", icon: Icons.home, target: "/"),
  MenuModel(label: "History", icon: Icons.history, target: "/history"),
  MenuModel(label: "Add", icon: Icons.add, target: "/form"),
  MenuModel(label: "Favorite", icon: Icons.star, target: "/favorite"),
  MenuModel(label: "Profile", icon: Icons.person, target: "/profile"),
];
