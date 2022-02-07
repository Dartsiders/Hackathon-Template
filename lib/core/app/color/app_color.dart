import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const transparent = "";

  static Color? get transparentColor =>
      Color(int.parse("0xff$transparent"));

  static Color? get greenColor => Colors.green;
  static Color? get redColor => Colors.red;
  static Color? get amberColor => Colors.amber;

 
}
