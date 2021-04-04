import 'package:flutter/material.dart';

abstract class AppColor {
  static const colorPrimary = const Color(0xFF6666ff);
  static const green = const Color(0xFF2ba562);
  static const red = const Color(0xFFFF0000);
  static const black = const Color(0xFF000000);
  static const lightBlack = const Color(0xFF626262);
  static const midBlack = const Color(0xFF4d4d4d);
  static const colorSecondary = const Color(0xFFFFFFFF);
  static const kTextColor = Color(0xFF757575);
  static final primaryGradientColor = LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [ Color(0xFF2ba562),Color(0xFF094b7c)]);



}
