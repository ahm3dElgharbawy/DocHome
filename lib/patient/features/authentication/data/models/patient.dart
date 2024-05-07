class Patient {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? avatar;
  final int centerId;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.centerId,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["profile_image"],
        centerId: json["center_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "profile_image": avatar,
        "center_id": centerId,
      };
}
