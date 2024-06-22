import 'package:dochome/patient/features/authentication/data/models/center.dart';
import 'package:dochome/patient/features/bookings/data/models/booking.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';

class CaregiverBookingsModel {
  final int id;
  final String startDate;
  final String userName;
  final String userProfileImage;
  final CenterModel center;
  final String caregiverName;
  final List<ServiceModel> services;
  final int totalPrice;
  final Location location;
  int? status;
  final String phoneNumber;
  int finished;

  CaregiverBookingsModel({
    required this.id,
    required this.startDate,
    required this.userName,
    required this.userProfileImage,
    required this.center,
    required this.caregiverName,
    required this.services,
    required this.totalPrice,
    required this.location,
    this.status,
    required this.phoneNumber,
    required this.finished
  });

  factory CaregiverBookingsModel.fromJson(Map<String, dynamic> json) =>
      CaregiverBookingsModel(
        id: json["id"],
        startDate: json["start_date"],
        userName: json["user_name"],
        userProfileImage: json["user_profile_image"],
        center: CenterModel.fromJson(json["center"]),
        caregiverName: json["caregiver_name"],
        services: List<ServiceModel>.from(
            json["services"].map((x) => ServiceModel.fromJson(x))),
        totalPrice: json["total_price"],
        location: Location.fromJson(json["location"]),
        status: json["status"],
        phoneNumber: json["phone_number"],
        finished: json['finished']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_date": startDate,
        "user_name": userName,
        "user_profile_image": userProfileImage,
        "center": center.toJson(),
        "caregiver_name": caregiverName,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "total_price": totalPrice,
        "location": location.toJson(),
        "status": status,
        "phone_number": phoneNumber,
        "finished" : finished
      };
}
