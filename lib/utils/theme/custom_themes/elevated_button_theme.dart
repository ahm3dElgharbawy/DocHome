import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

abstract class CElevatedButtonTheme {  
  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.light,
      backgroundColor: CColors.primary,
      disabledForegroundColor: CColors.darkGrey,
      disabledBackgroundColor: CColors.buttonDisabled,
      padding: const EdgeInsets.symmetric(vertical: CSizes.buttonPadding),
      textStyle: const TextStyle(fontSize: 16, color: CColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CSizes.buttonRadius)),
    )
  );
    static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.light,
      backgroundColor: CColors.primary,
      disabledForegroundColor: CColors.darkGrey,
      disabledBackgroundColor: CColors.darkerGrey,
      padding: const EdgeInsets.symmetric(vertical: CSizes.buttonPadding),
      textStyle: const TextStyle(fontSize: 16, color: CColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CSizes.buttonRadius)),
    )
  );
}