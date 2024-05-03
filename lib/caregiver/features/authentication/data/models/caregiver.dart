class Caregiver {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String profileImage;
  final String idCardImage;
  final String professionalCardImage;
  final int status;
  final int centerId;
  final int categoryId;

  Caregiver({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.idCardImage,
    required this.professionalCardImage,
    required this.status,
    required this.centerId,
    required this.categoryId,
  });

  factory Caregiver.fromJson(Map<String, dynamic> json) => Caregiver(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profileImage: json["profile_image"],
        idCardImage: json["id_card_image"],
        professionalCardImage: json["professional_card_image"],
        status: json["status"],
        centerId: json["center_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "profile_image": profileImage,
        "id_card_image": idCardImage,
        "professional_card_image": professionalCardImage,
        "status": status,
        "center_id": centerId,
        "category_id": categoryId,
      };
}
