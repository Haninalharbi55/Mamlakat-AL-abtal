import '../../domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({
    required super.id,
    required super.name,
    super.description,
    required super.points,
    required super.isOpen,
    required super.imageUrl,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      points: json['points'] as int? ?? 0,
      isOpen: json['is_open'] as bool? ?? false,
      imageUrl: json['image_url'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'points': points,
      'is_open': isOpen,
      'image_url': imageUrl,
    };
  }
}
