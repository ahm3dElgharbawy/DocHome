import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

abstract class CChipTheme {
  static ChipThemeData lightChipTheme = ChipThemeData(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    selectedColor: CColors.primary,
    checkmarkColor: Colors.white,
    labelStyle: const TextStyle(color: Colors.black),
    showCheckmark: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CSizes.borderRadiusLg),
      side: const BorderSide(color: Colors.grey),
    ),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    selectedColor: CColors.primary,
    checkmarkColor: Colors.white,
    labelStyle: const TextStyle(color: Colors.white),
    showCheckmark: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CSizes.borderRadiusLg),
      side: const BorderSide(color: Colors.grey),
    ),
  );
}
