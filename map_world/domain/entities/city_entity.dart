import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final int id;
  final String name;
  final String? description;
  final int points;
  final bool isOpen;
  final String imageUrl;
  final double? latitude;
  final double? longitude;
  final double? x; // X coordinate on map image (0-1)
  final double? y; // Y coordinate on map image (0-1)

  const CityEntity({
    required this.id,
    required this.name,
    this.description,
    required this.points,
    required this.isOpen,
    required this.imageUrl,
    this.latitude,
    this.longitude,
    this.x,
    this.y,
  });

  @override
  List<Object?> get props => [id, name, description, points, isOpen, imageUrl, latitude, longitude, x, y];
}
