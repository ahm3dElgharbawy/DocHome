class PatientProfileStatisticsModel {
    final int userId;
    final int caregiverCount;
    final int totalBookings;
    final int reviewsCount;

    PatientProfileStatisticsModel({
        required this.userId,
        required this.caregiverCount,
        required this.totalBookings,
        required this.reviewsCount,
    });

    factory PatientProfileStatisticsModel.fromJson(Map<String, dynamic> json) => PatientProfileStatisticsModel(
        userId: json["user_id"],
        caregiverCount: json["caregiver_count"],
        totalBookings: json["total_bookings"],
        reviewsCount: json["reviews_count"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "caregiver_count": caregiverCount,
        "total_bookings": totalBookings,
        "reviews_count": reviewsCount,
    };
}
