import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? price;
  final int? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Service({
    this.id,
    this.nameAr,
    this.nameEn,
    this.price,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as int?,
        nameAr: json['name_ar'] as String?,
        nameEn: json['name_en'] as String?,
        price: json['price'] as String?,
        categoryId: json['category_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_ar': nameAr,
        'name_en': nameEn,
        'price': price,
        'category_id': categoryId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      nameAr,
      nameEn,
      price,
      categoryId,
      createdAt,
      updatedAt,
    ];
  }
}
