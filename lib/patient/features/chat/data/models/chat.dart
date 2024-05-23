import 'package:dochome/patient/features/authentication/data/models/patient.dart';

class Chat {
    final int id;
    final int createdBy;
    final String name;
    final int isPrivate;
    final String? lastMessage;
    final String? lastMessageTime;
    final List<Participant> participants;

    Chat({
        required this.id,
        required this.createdBy,
        required this.name,
        required this.isPrivate,
        required this.lastMessage,
        required this.participants,
        required this.lastMessageTime
    });

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        createdBy: json["created_by"],
        name: json["name"],
        isPrivate: json["is_private"],
        lastMessage: json["last_message"]?['message'],
        lastMessageTime: json["last_message"]?['time'],
        participants: List<Participant>.from(json["participants"].map((x) => Participant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "name": name,
        "is_private": isPrivate,
        "last_message": lastMessage,
        "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
    };
}

class Participant {
    final Patient user;
    final Caregiver caregiver;

    Participant({
        required this.user,
        required this.caregiver,
    });

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        user: Patient.fromJson(json["user"]),
        caregiver: Caregiver.fromJson(json["caregiver"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "caregiver": caregiver.toJson(),
    };
}

class Caregiver {
    final int id;
    final String name;
    final String email;
    final String phone;
    final String profileImage;
    final int status;
    final int centerId;
    final int categoryId;

    Caregiver({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.profileImage,
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
        "status": status,
        "center_id": centerId,
        "category_id": categoryId,
    };
}
