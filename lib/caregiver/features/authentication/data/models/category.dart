class CategoryModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final String image;

  CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "image": image,
      };
}
