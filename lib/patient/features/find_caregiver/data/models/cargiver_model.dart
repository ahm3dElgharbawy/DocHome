import 'package:equatable/equatable.dart';

class CargiverModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? profileImage;
  final dynamic status;
  final int? centerId;
  final int? categoryId;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CargiverModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.profileImage,
    this.status,
    this.centerId,
    this.categoryId,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory CargiverModel.fromJson(Map<String, dynamic> json) => CargiverModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        profileImage: json['image'] as String?,
        status: json['status'] as dynamic,
        centerId: json['center_id'] as int?,
        categoryId: json['category_id'] as int?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': profileImage,
        'status': status,
        'center_id': centerId,
        'category_id': categoryId,
        'email_verified_at': emailVerifiedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      profileImage,
      status,
      centerId,
      categoryId,
      emailVerifiedAt,
      createdAt,
      updatedAt,
    ];
  }
}
