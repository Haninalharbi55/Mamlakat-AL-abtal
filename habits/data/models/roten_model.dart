import '../../domain/entities/roten_entity.dart';

class RotenModel extends RotenEntity {
  const RotenModel({
    required super.foods,
    required super.drinks,
    required super.walks,
    required super.sleeps,
  });

  factory RotenModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data']['roten'] != null) {
      final roten = json['data']['roten'] as Map<String, dynamic>;
      return RotenModel(
        foods: roten['foods'] as bool? ?? false,
        drinks: roten['drinks'] as bool? ?? false,
        walks: roten['walks'] as bool? ?? false,
        sleeps: roten['sleeps'] as bool? ?? false,
      );
    }
    // Fallback if structure is different
    return const RotenModel(
      foods: false,
      drinks: false,
      walks: false,
      sleeps: false,
    );
  }
}
