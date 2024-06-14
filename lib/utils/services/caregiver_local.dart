import 'dart:convert';

import 'package:dochome/components/chat/data/models/chat.dart';
import 'package:dochome/utils/services/preference_services.dart';

class CaregiverLocal {
  static String? get token => PreferenceServices.getString("TOKEN");
  static Caregiver? get(){
    String? caregiver = PreferenceServices.getString("PATIENT");
    if(caregiver != null){
      return Caregiver.fromJson(jsonDecode(caregiver));
    }
    return null;
  }
}