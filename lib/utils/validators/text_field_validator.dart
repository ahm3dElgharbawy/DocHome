abstract class CTextFieldValidator {
  static String? requiredTextField(String? value,
      {String message = "This field is required"}) {
    if (value == null || value.isEmpty) {
      return message;
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
