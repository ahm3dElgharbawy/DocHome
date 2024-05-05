class CenterModel {
  final int id;
  final String nameAr;
  final String nameEn;

  CenterModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
      };
}
