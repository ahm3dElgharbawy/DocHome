import 'package:flutter/material.dart';

abstract class CAppStyles {
  static String fontFamily = "Poppins";

  static final textStyleBold30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );
  
  static final textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
  static final textStyle10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
}
