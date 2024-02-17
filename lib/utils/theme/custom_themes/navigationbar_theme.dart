import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class CNavigationBarTheme {
  static NavigationBarThemeData lightNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: CColors.white,
    indicatorColor: CColors.softGrey,
    labelTextStyle: MaterialStateProperty.resolveWith(
      (states) => const TextStyle(fontSize: 12),
    ),
  );
  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: CColors.black,
    indicatorColor: CColors.white.withOpacity(.1),
    labelTextStyle: MaterialStateProperty.resolveWith(
      (states) => const TextStyle(fontSize: 12),
    ),
  );
}
