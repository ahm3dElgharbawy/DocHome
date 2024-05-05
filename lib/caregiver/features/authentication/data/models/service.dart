class ServiceModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final String price;
  final int categoryId;

  ServiceModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.price,
    required this.categoryId,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        price: json["price"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "price": price,
        "category_id": categoryId,
      };
}
