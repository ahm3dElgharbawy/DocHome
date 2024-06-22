class CaregiverProfileStatisticsModel {
    final int usersCount;
    final int totalBookings;
    final int reviewsCount;

    CaregiverProfileStatisticsModel({
        required this.usersCount,
        required this.totalBookings,
        required this.reviewsCount,
    });
    factory CaregiverProfileStatisticsModel.fromJson(Map<String, dynamic> json) => CaregiverProfileStatisticsModel(
        usersCount: json["users_count"],
        totalBookings: json["total_bookings"],
        reviewsCount: json["reviews_count"],
    );

    Map<String, dynamic> toJson() => {
        "users_count": usersCount,
        "total_bookings": totalBookings,
        "reviews_count": reviewsCount,
    };
}
