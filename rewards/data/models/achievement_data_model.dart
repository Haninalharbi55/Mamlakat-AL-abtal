import '../../domain/entities/achievement_data_entity.dart';
import 'city_model.dart';

class AchievementDataModel extends AchievementDataEntity {
  const AchievementDataModel({
    required super.foods,
    required super.drinks,
    required super.walks,
    required super.sleeps,
    required super.register,
    required super.cities,
  });

  factory AchievementDataModel.fromJson(Map<String, dynamic> json) {
    // Assuming json is the full response object
    final data = json['data'] as Map<String, dynamic>;
    final roten = data['roten'] as Map<String, dynamic>;
    
    final List<dynamic> citiesList = data['cities'] as List<dynamic>;
    final List<CityModel> mappedCities = citiesList.map((cityMap) {
      final map = cityMap as Map<String, dynamic>;
      // Each map in the list has city name as key and city data as value
      final cityJson = map.values.first as Map<String, dynamic>;
      return CityModel.fromJson(cityJson);
    }).toList();

    return AchievementDataModel(
      foods: roten['foods'] as bool? ?? false,
      drinks: roten['drinks'] as bool? ?? false,
      walks: roten['walks'] as bool? ?? false,
      sleeps: roten['sleeps'] as bool? ?? false,
      register: data['register'] as bool? ?? false,
      cities: mappedCities,
    );
  }
}
