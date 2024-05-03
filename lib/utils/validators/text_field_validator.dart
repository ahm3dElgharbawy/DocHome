abstract class CTextFieldValidator {
  static String? requiredTextField(String? value) {
    if (value == null || value.isEmpty) {
      return "this field is required";
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
