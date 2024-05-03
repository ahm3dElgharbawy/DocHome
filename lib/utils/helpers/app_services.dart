import 'package:shared_preferences/shared_preferences.dart';

class AppServices {
  late SharedPreferences prefs;
  AppServices._({required this.prefs});
  static AppServices? _appServices;
  init() async {
    if (_appServices == null) {
      prefs = await SharedPreferences.getInstance();
      _appServices = AppServices._(prefs: prefs);
    }
    else{
      return _appServices;
    }
  }
  static getInstance(){
    return _appServices;
  }
}
