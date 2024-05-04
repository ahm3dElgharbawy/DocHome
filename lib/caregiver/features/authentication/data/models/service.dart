class ServiceModel {
  final int id;
  final String name;
  final String price;
  final int categoryId;

  ServiceModel({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "category_id": categoryId,
      };
}
