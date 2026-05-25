import 'package:equatable/equatable.dart';

class AchievementEntity extends Equatable {
  final String date;
  final int foods;
  final int drinks;
  final int walks;
  final int sleeps;

  const AchievementEntity({
    required this.date,
    required this.foods,
    required this.drinks,
    required this.walks,
    required this.sleeps,
  });

  @override
  List<Object?> get props => [date, foods, drinks, walks, sleeps];
}
