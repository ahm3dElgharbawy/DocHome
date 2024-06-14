import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension Navigation on BuildContext {
  void pop() {
    Navigator.of(this).pop();
  }

  Future push(Widget screen) {
    return Navigator.push(
        this, MaterialPageRoute(builder: (context) => screen));
  }

  Future pushNamed(String routeName, {Object? args}) {
    return Navigator.pushNamed(this, routeName, arguments: args);
  }

  Future pushReplacement(Widget screen) {
    return Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => screen));
  }

  Future pushReplacementNamed(String routeName, {Object? args}) {
    return Navigator.pushReplacementNamed(this, routeName, arguments: args);
  }

  Future pushReplacementAll(Widget screen) {
    return Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }

  Future pushReplacementAllNamed(String routeName, {Object? args}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,
        arguments: args);
  }
}

extension StringAsToast on String {
  showAsToast(Color color, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
