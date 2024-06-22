import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
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
