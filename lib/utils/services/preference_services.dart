import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServices {
  static late SharedPreferences instance;
  static initCacheHelper() async {
    instance = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return instance.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    return instance.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return instance.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    return instance.getInt(key);
  }

  static Future<bool> remove(String key) async {
    return instance.remove(key);
  }

  static Future<bool> clear(String key) async {
    return instance.clear();
  }
}
