import 'package:flutter/material.dart';

class BottomNavigationBarItemModel {
  final String title;
  final Widget icon;
  final Widget? activeIcon;
  final Widget screen;

  const BottomNavigationBarItemModel({required this.title,required this.icon,required this.screen,this.activeIcon});
  
}