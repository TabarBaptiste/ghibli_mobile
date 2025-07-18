import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'Amaranth',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Amaranth',
          fontSize: 21,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
