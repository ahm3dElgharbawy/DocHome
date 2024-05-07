import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class CAppStyles {
  ///Bold
  static TextStyle styleBold10(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold25(context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold30(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w700,
    );
  }

  ///Reguler
  static TextStyle styleRegular10(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular13(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular17(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular23(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 23),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w400,
    );
  }

  ///Medium
  static TextStyle styleMedium8(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium13(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium24(context) {
    return TextStyle(
      color: CColors.primary,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w500,
    );
  }

  /// SemiBold
  static TextStyle styleSemiBold8(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold10(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold13(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold17(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold21(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 21),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold24(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold25(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w600,
    );
  }

  ///Light
  static TextStyle styleLight16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleLight10(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleLight12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleLight17(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: Localizations.localeOf(context).languageCode == "en"
          ? "Poppins"
          : "Cairo",
      fontWeight: FontWeight.w300,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 360;
  } else if (width < 1200) {
    return width / 900;
  } else {
    return width / 1300;
  }
}
