import 'package:dochome/utils/services/preference_services.dart';

abstract class LocaleCacheHelper {
  static Future<void> cacheLangCode(String langCode) async {
    PreferenceServices.setString("LOCALE", langCode);
  }

  static Future<String> getCachedLangCode() async {
    final cachedLocal = PreferenceServices.getString("LOCALE");
    if (cachedLocal != null) {
      return cachedLocal;
    } else {
      return "ar"; // default language
    }
  }
}
