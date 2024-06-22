import 'package:dochome/patient/features/authentication/data/models/patient.dart';

class ReviewModel {
  final int id;
  final num rating;
  final String comments;
  final int userId;
  final int caregiverId;
  final Patient user;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.comments,
    required this.userId,
    required this.caregiverId,
    required this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        rating: json["rating"],
        comments: json["comments"],
        userId: json["user_id"],
        caregiverId: json["caregiver_id"],
        user: Patient.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "comments": comments,
        "user_id": userId,
        "caregiver_id": caregiverId,
        "user": user.toJson(),
      };
}
