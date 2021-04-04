import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flutter/material.dart';
const defaultDuration = Duration(milliseconds: 250);
const String fontFamily = 'GOTHIC';
ThemeData AppTheme() {
  return ThemeData(
    fontFamily: fontFamily,
    primaryColor: AppColor.colorPrimary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}