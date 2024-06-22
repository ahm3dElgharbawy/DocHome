
class Caregiver {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String profileImage;
  // final String? idCardImage;
  // final String? professionalCardImage;
  final int status;
  final int centerId;
  final int categoryId;
  final String? about;
  final String? title;
  final double stars;
  final int numberOfReviews;
  final int open;
  final String salary;

  Caregiver({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    // this.idCardImage,
    // this.professionalCardImage,
    required this.status,
    required this.centerId,
    required this.categoryId,
    this.about,
    this.title,
    required this.stars,
    required this.numberOfReviews,
    required this.open,
    required this.salary,
  });

  factory Caregiver.fromJson(Map<String, dynamic> json) => Caregiver(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profileImage: json["profile_image"],
        status: json["status"],
        centerId: json["center_id"],
        categoryId: json["category_id"],
        about: json['about'],
        title: json['title'],
        stars: json['stars'].toDouble(),
        numberOfReviews: json['number_of_reviews'],
        open: json['open'],
        salary: json['salary']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "profile_image": profileImage,
        "status": status,
        "center_id": centerId,
        "category_id": categoryId,
        "about" : about,
        "title" : title,
        "stars" : stars,
        "number_of_reviews" : numberOfReviews,
        "open" : open,
        "salary" : salary
      };
}
