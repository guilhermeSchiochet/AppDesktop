import 'package:app_desktop/presenter/utils/themedata_app_desktop.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppDesktopColorsUtil implements ThemeDataAppDesktop {  

  static Color black = Colors.black;
  
  static Color white = Colors.white;
  
  static Color grey40 = Colors.grey.shade400;
  
  static Color grey = Colors.grey;

  static Color red = HexColor('FB4949');
 
  static Color getColorDefault = red;

  @override
  ThemeData themeData() {
    return ThemeData().copyWith(
      primaryColor: AppDesktopColorsUtil.grey40,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: AppDesktopColorsUtil.red,
      )
    );
  }
}