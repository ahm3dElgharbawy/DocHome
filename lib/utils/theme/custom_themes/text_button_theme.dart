import 'package:flutter/material.dart';

abstract class CTextButtonTheme {
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(shape: const StadiumBorder()),
  );
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(shape: const StadiumBorder()),
  );
}
