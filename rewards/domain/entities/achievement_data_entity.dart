import 'package:equatable/equatable.dart';
import 'city_entity.dart';

class AchievementDataEntity extends Equatable {
  final bool foods;
  final bool drinks;
  final bool walks;
  final bool sleeps;
  final bool register;
  final List<CityEntity> cities;

  const AchievementDataEntity({
    required this.foods,
    required this.drinks,
    required this.walks,
    required this.sleeps,
    required this.register,
    required this.cities,
  });

  @override
  List<Object?> get props => [foods, drinks, walks, sleeps, register, cities];
}
