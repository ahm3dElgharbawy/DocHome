import 'package:equatable/equatable.dart';

class CategorieModel extends Equatable {
  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategorieModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
        id: json['id'] as int?,
        nameAr: json['name_ar'] as String?,
        nameEn: json['name_en'] as String?,
        descriptionAr: json['description_ar'] as String?,
        descriptionEn: json['description_en'] as String?,
        image: json['image'] as String?,
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
        'description_ar': descriptionAr,
        'description_en': descriptionEn,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      nameAr,
      nameEn,
      descriptionAr,
      descriptionEn,
      image,
      createdAt,
      updatedAt,
    ];
  }
}
