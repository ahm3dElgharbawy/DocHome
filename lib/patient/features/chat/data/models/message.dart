class MessageModel {
    final String id;
    final String chatId;
    final String userId;
    final String caregiverId;
    final String createdBy;
    final String? file;
    final String time;
    final String message;

    MessageModel({
        required this.id,
        required this.chatId,
        required this.userId,
        required this.caregiverId,
        required this.createdBy,
        this.file,
        required this.time,
        required this.message,

    });

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"].toString(),
        chatId: json["chat_id"].toString(),
        userId: json["user_id"].toString(),
        caregiverId: json["caregiver_id"].toString(),
        createdBy: json["created_by"].toString(),
        file: json["file"],
        time: json["time"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "chat_id": chatId,
        "user_id": userId,
        "caregiver_id": caregiverId,
        "created_by": createdBy,
        "file": file,
        "time": time,
        "message": message,
    };
}