import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final int id;
  final String name;
  final String? description;
  final int points;
  final bool isOpen;
  final String imageUrl;

  const CityEntity({
    required this.id,
    required this.name,
    this.description,
    required this.points,
    required this.isOpen,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, description, points, isOpen, imageUrl];
}
