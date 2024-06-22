import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';

class PatientBookingModel {
    final int id;
    final String userName;
    final String caregiverName;
    final String caregiverProfileImage;
    final String startDate;
    final List<ServiceModel> services;
    final double totalPrice;
    final Location location;
    final int? status;
    final String phoneNumber;

    PatientBookingModel({
        required this.id,
        required this.userName,
        required this.caregiverName,
        required this.caregiverProfileImage,
        required this.startDate,
        required this.services,
        required this.totalPrice,
        required this.location,
        this.status,
        required this.phoneNumber,
    });

    factory PatientBookingModel.fromJson(Map<String, dynamic> json) => PatientBookingModel(
        id: json["id"],
        userName: json["user_name"],
        caregiverName: json["caregiver_name"],
        caregiverProfileImage: json["caregiver_profile_image"],
        startDate: json["start_date"],
        services: List<ServiceModel>.from(json["services"].map((x) => ServiceModel.fromJson(x))),
        totalPrice: json["total_price"].toDouble(),
        location: Location.fromJson(json["location"]),
        status: json["status"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "caregiver_name": caregiverName,
        "caregiver_profile_image": caregiverProfileImage,
        "start_date": startDate,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "total_price": totalPrice,
        "location": location.toJson(),
        "status": status,
        "phone_number": phoneNumber,
    };
}

class Location {
    final double latitude;
    final double longitude;

    Location({
        required this.latitude,
        required this.longitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

