import 'package:dochome/utils/services/preference_services.dart';

// For translate data that coming from the api
// IF current language is ar return the arabic string else return the english one
String trans({required String enText, required String arText}) {
  ;
  if (PreferenceServices.getString("LOCALE") == "en") {
    return enText;
  } else {
    return arText;
  }
}
