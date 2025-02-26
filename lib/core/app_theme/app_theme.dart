import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Constants.backgroundColor,
    primaryColor: Constants.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Constants.backgroundColor,
      actionsIconTheme: IconThemeData(color: Constants.iconColor),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Constants.primaryTextColor,
        fontFamily: Constants.fontFamily,
      ),


    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Constants.primaryTextColor,
        fontFamily: Constants.fontFamily,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF878787),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: Constants.fontFamily,
      ),
    ),
  );
}
