import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/custom_themes/appbar_theme.dart';
import 'package:dochome/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:dochome/utils/theme/custom_themes/chip_theme.dart';
import 'package:dochome/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:dochome/utils/theme/custom_themes/navigationbar_theme.dart';
import 'package:dochome/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:dochome/utils/theme/custom_themes/text_button_theme.dart';
import 'package:dochome/utils/theme/custom_themes/text_field_theme.dart';
import 'package:dochome/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/checkbox_theme.dart';

abstract class CAppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.light,
    useMaterial3: false,
    primaryColor: CColors.primary,
    disabledColor: CColors.grey,
    scaffoldBackgroundColor: CColors.white,
    // textTheme: CTextTheme.lightTextTheme,
    // elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    // textButtonTheme: CTextButtonTheme.lightTextButtonTheme,
    // appBarTheme: CAppBarTheme.lightAppBarTheme,
    // navigationBarTheme: CNavigationBarTheme.lightNavigationBarTheme,
    // bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
    // inputDecorationTheme: CTextFieldTheme.lightTextFieldDecorationTheme,
    // chipTheme: CChipTheme.lightChipTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
    
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    useMaterial3: false,
    primaryColor: CColors.primary,
    disabledColor: CColors.grey,
    scaffoldBackgroundColor: CColors.dark,
    textTheme: CTextTheme.darkTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: CTextButtonTheme.darkTextButtonTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    navigationBarTheme: CNavigationBarTheme.darkNavigationBarTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: CTextFieldTheme.darkTextFieldDecorationTheme,
    checkboxTheme: CCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: CChipTheme.darkChipTheme,
  );
}
