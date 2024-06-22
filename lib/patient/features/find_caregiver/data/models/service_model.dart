import 'package:dochome/caregiver/features/authentication/data/models/category.dart';
import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final int? id;
  final String nameAr;
  final String nameEn;
  final String price;
  final int? categoryId;
  final CategoryModel? category;

  const ServiceModel(
      {this.id,
      required this.nameAr,
      required this.nameEn,
      required this.price,
      this.categoryId,
      this.category});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'] as int?,
        nameAr: json['name_ar'],
        nameEn: json['name_en'],
        price: json['price'],
        categoryId: json['category_id'] as int?,
        category: json["category"] != null
            ? CategoryModel.fromJson(json["category"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_ar': nameAr,
        'name_en': nameEn,
        'price': price,
        'category_id': categoryId,
        "category": category?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      nameAr,
      nameEn,
      price,
      categoryId,
    ];
  }
}
