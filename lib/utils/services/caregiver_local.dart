import 'dart:convert';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/utils/services/preference_services.dart';

class CaregiverLocal {
  CaregiverLocal._();

  static String? get token => PreferenceServices.getString("TOKEN");
  static Caregiver? get(){
    String? patient = PreferenceServices.getString("CAREGIVER");
    if(patient != null){
      return Caregiver.fromJson(jsonDecode(patient));
    }
    return null;
  }
  static void updateCaregiver(Caregiver patient){
    String json = jsonEncode(patient.toJson());
    PreferenceServices.setString('CAREGIVER', json);
  }
}
