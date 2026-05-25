import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/usecases/get_regions_usecase.dart';
import '../../domain/usecases/get_child_regions_usecase.dart';
import '../../domain/usecases/get_cities_usecase.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final GetRegionsUseCase getRegionsUseCase;
  final GetChildRegionsUseCase getChildRegionsUseCase;
  final GetCitiesUseCase getCitiesUseCase;

  MapCubit(
    this.getRegionsUseCase,
    this.getChildRegionsUseCase,
    this.getCitiesUseCase,
  ) : super(MapInitial());

  Future<void> loadMapData() async {
    emit(MapLoading());
    try {
      final regions = await getRegionsUseCase();
      final cities = await getCitiesUseCase();
      emit(MapLoaded(regions: regions, cities: cities));
    } catch (e) {
      emit(MapError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  void selectCity(CityEntity city) {
    if (state is MapLoaded) {
      emit((state as MapLoaded).copyWith(selectedCity: city));
    }
  }
}
