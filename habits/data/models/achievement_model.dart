import '../../domain/entities/achievement_entity.dart';

class AchievementModel extends AchievementEntity {
  const AchievementModel({
    required super.date,
    required super.foods,
    required super.drinks,
    required super.walks,
    required super.sleeps,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      date: json['date'] as String,
      foods: json['foods'] as int,
      drinks: json['drinks'] as int,
      walks: json['walks'] as int,
      sleeps: json['sleeps'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'foods': foods,
      'drinks': drinks,
      'walks': walks,
      'sleeps': sleeps,
    };
  }
}
