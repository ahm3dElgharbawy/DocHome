import 'dart:convert';

class NotificationModel {
    final String msgAr;
    final String msgEn;

    NotificationModel({
        required this.msgEn,
        required this.msgAr
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json){
      Map data =jsonDecode( json["data"]);
      return NotificationModel(
        msgEn: data['msg_en'],
        msgAr: data['msg_ar'],
    );}

    Map<String, dynamic> toJson() => {
        "msg_en" : msgAr,
        "msg_ar" : msgEn
    };
}
