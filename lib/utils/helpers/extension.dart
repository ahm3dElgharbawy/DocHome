import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future push(Widget screen) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }
  Future pushReplacement(Widget screen) {
    return Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => screen));
  }

  Future pushReplacementAll(Widget screen) {
    return Navigator.pushAndRemoveUntil(this, MaterialPageRoute(builder: (context) => screen),(route) => false);
  }
}