abstract class CTextFieldValidator {
  static String? requiredTextField(String? value) {
    if (value == null || value.isEmpty) {
      return "this field is required";
    }
    return null;
  }

  static String? phoneNumberTextFieldValidator(String? value) {
    if (value != null && value!.length != 11) {
      return "the phone number must be 11 digit";
    }
    return null;
  }

  static String? passwordTextFieldValidator(String? value) {
    if (value != null && value!.length < 8) {
      return "must be greater than or equal 8 digits";
    }
    return null;
  }

  static String? emailCheck(String? value, {String message = "Invalid email"}) {
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
