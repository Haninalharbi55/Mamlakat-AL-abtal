import 'package:equatable/equatable.dart';
import '../../domain/entities/region_entity.dart';
import '../../domain/entities/city_entity.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final List<RegionEntity> regions;
  final List<CityEntity> cities;
  final CityEntity? selectedCity;

  const MapLoaded({
    required this.regions,
    required this.cities,
    this.selectedCity,
  });

  MapLoaded copyWith({
    List<RegionEntity>? regions,
    List<CityEntity>? cities,
    CityEntity? selectedCity,
  }) {
    return MapLoaded(
      regions: regions ?? this.regions,
      cities: cities ?? this.cities,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }

  @override
  List<Object?> get props => [regions, cities, selectedCity];
}

class MapError extends MapState {
  final String message;

  const MapError(this.message);

  @override
  List<Object> get props => [message];
}
