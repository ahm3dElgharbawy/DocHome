import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleCacheHelper {
  static Future<void> cacheLangCode(String langCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", langCode);
  }

  static Future<String> getCachedLangCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLocal = sharedPreferences.getString("LOCALE");
    if (cachedLocal != null) {
      return cachedLocal;
    } else {
      return "ar"; // default language
    }
  }
}
