import 'dart:convert';

import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/utils/services/preference_services.dart';

class PatientLocal {
  PatientLocal._();

  static String? get token => PreferenceServices.getString("TOKEN");
  static Patient? get(){
    String? patient = PreferenceServices.getString("PATIENT");
    if(patient != null){
      return Patient.fromJson(jsonDecode(patient));
    }
    return null;
  }
  static void updatePatient(Patient patient){
    String json = jsonEncode(patient.toJson());
    PreferenceServices.setString('PATIENT', json);
  }
}
