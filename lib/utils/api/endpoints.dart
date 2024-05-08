abstract class EndPoints {
  static const baseUrl = "https://dochomd4u.000webhostapp.com/api";
  // static const baseUrl = "http://192.168.248.10:8000/api";

  // Patient authentication routes
  static const loginPatient = "$baseUrl/login/user";
  static const registerPatient = "$baseUrl/register/user";
  static const logoutPatient = "$baseUrl/logout/user";
  static const sendOtp = "$baseUrl/password/otp/send"; //? [post] email
  static const checkOtp =
      "$baseUrl/password/otp/check"; //? [post] email and otp
  static const resetPassword =
      "$baseUrl/password/reset"; //? [put] email and new_password

  // Centers
  static const getAllCenters = "$baseUrl/centers"; //? [get]

  // Caregiver authentication routes
  static const loginCaregiver = "$baseUrl/login/caregiver";
  static const registerCaregiver = "$baseUrl/register/caregiver";
  static const logoutCaregiver = "$baseUrl/logout/caregiver";

  // Categories
  //? [get] all categories
  static const allCategories = "$baseUrl/categories";
  //? [get] provide 'categoryID' when using this end point like => getCategory + "1"
  static const getCategory = "$baseUrl/categories/";
  //? [get] all services in the category
  static const allServicesInCategory = "$baseUrl/categories/";
  //? [get] provide 'categoryID' when using this end point like => getCategory + "1"
  static const getService = "$baseUrl/services/{id}";
}
