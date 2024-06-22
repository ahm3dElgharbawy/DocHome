abstract class EndPoints {
  // static const domainUrl = "https://dochomd4u.000webhostapp.com";
  static const domainUrl = "http://192.168.115.10:8000"; // local server
  static const baseUrl = "$domainUrl/api"; 
  // get image full path
  static String imagePath(String image) => "$domainUrl/$image";
  // Patient authentication routes
  static const loginPatient = "$baseUrl/login/user";
  static const registerPatient = "$baseUrl/register/user";
  static const logoutPatient = "$baseUrl/logout/user";
  static const sendOtp = "$baseUrl/password/otp/send"; //? [post] email
  static const checkOtp =
      "$baseUrl/password/otp/check"; //? [post] email and otp
  static const resetPassword =
      "$baseUrl/password/reset"; //? [put] email and new_password

  // patient profile
  static const patientProfileUpdate = "$baseUrl/user-profile-update";
  static const patientProfileStatistics = "$baseUrl/user-profile-statistics";

  // caregiver profile 
  static const caregiverProfileUpdate = "$baseUrl/caregiver-profile-update";
  static const caregiverProfileStatistics = "$baseUrl/caregiver-profile-statistics";
  // caregiver bookings
  static approveOrRejectBooking({required int bookingId}) => "$baseUrl/bookings/$bookingId/approve-or-reject"; // approval_status true or false
  // reports 
  static const makeReport = "$baseUrl/store_report"; // title content user_name booking_id
  // Centers
  static const getAllCenters = "$baseUrl/centers"; //? [get]
  // services 
  static const allServices = "$baseUrl/services"; 
  // ratings 
  static const addRating = "$baseUrl/ratings"; //? [post]
  static caregiverRatings(int caregiverId) => "$baseUrl/caregiver/$caregiverId/ratings"; //? [get]
  static caregiverAverageRatings(int caregiverId) =>"$baseUrl/caregiver/$caregiverId/average-rating"; //? [get]
  // notifications
  static const patientNotifications = "$baseUrl/user-notifications";
  static const caregiverNotifications = "$baseUrl/caregiver-notifications";
  
  static const bookCaregiver = "$baseUrl/bookings"; //? [post]
  static const patientBookings = "$baseUrl/bookingsuser";
  static const caregiverBookings = "$baseUrl/bookingscaregiver";
  // Caregiver authentication routes
  static const loginCaregiver = "$baseUrl/login/caregiver";
  static const registerCaregiver = "$baseUrl/register/caregiver";
  static const logoutCaregiver = "$baseUrl/logout/caregiver";
  // Chat 
  static const createNewChat  = "$baseUrl/chat"; // [Post] user_id & caregiver_id && Authorization in header
  static const getAllChats  = "$baseUrl/chat"; // [Get] Authorization in header
  static const getSingleChat  = "$baseUrl/chat/{id}"; // [Get] Authorization in header
  static const getChatMessages  = "$baseUrl/chat_message"; // [Get] chat_id & page
  static const addChatMessage  = "$baseUrl/chat_message"; // [Post] chat_id & caregiver_id & message

  // Categories
  //? [get] all categories
  static const allCategories = "$baseUrl/categories";
  static const popularCaregivers = "$baseUrl/popular-caregivers";
  //? [get] provide 'categoryID' when using this end point like => getCategory + "1"
  static const getCategory = "$baseUrl/categories/";
  //? [get] all services in the category
  static getAllServicesInCategory(int categoryId) => "$baseUrl/categories/$categoryId/services";
  static getAllCaregiversInCategory(int categoryId) => "$baseUrl/categories/$categoryId/caregivers";
  //? [get] provide 'categoryID' when using this end point like => getCategory + "1"
  static const getService = "$baseUrl/services/{id}";
  static const storeNewBooking = "$baseUrl/bookings";

  // wallet
  static const myWallet = "$baseUrl/my-wallet";
  static const walletCharging = "$baseUrl/wallet-charging-order";
}

