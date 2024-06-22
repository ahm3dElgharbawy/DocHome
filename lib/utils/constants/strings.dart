import 'package:dochome/utils/helpers/extension.dart';

abstract class CStrings {
  // success messages
  static String loginSuccess = "Login success".tr;
  static String registerSuccess = "User successfully registered".tr;
  static String sendOtpSuccess = "Send otp success".tr;
  static String checkOtpSuccess = "check otp success".tr;
  static String resetPasswordSuccess = "Reset password success".tr;
  static String caregiverSuccessRegister =
      "Joining request sended successfully, Please wait until the admin accept you".tr;
  // failure messages
  static String invalidCredentials = "invalid credentials".tr;
  static String offlineFailure = "Your are offline".tr;
  static String serverFailure = "Server failure".tr;
  static String notFoundFailure = "Not Found".tr;
  static String sendOtpFailure = "Send otp success".tr;
  static String checkOtpFailure = "check otp failure".tr;
  static String resetPasswordFailure = "Reset password failure".tr;
  static String passwordNotMatch =
      "Password and confirmation password not match".tr;
  static String agreeTerms = "Your must agree our terms and conditions".tr;
}
