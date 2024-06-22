import 'package:dochome/utils/helpers/extension.dart';

abstract class CTextFieldValidator {
  static String? requiredTextField(String? value) {
    if (value == null || value.isEmpty) {
      return "* this field is required".tr;
    }
    return null;
  }

  static String? phoneNumberTextFieldValidator(String? value) {
    if (value != null && value.length != 11) {
      return "the phone number must be 11 digit".tr;
    } else {
      return requiredTextField(value);
    }
  }

  static String? passwordTextFieldValidator(String? value) {
    if (value != null && value.length < 8) {
      return "must be greater than or equal 8 digits".tr;
    } else {
      return requiredTextField(value);
    }
  }

  static String? emailCheck(String? value, [String? message ]) {
    message =  "Invalid email".tr;
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    if (value != null && emailRegex.hasMatch(value)) {
      return null;
    }
    return message;
  }
}
