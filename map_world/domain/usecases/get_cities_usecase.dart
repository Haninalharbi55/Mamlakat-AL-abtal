import '../entities/city_entity.dart';
import '../repositories/map_repository.dart';

class GetCitiesUseCase {
  final MapRepository repository;

  GetCitiesUseCase(this.repository);

  Future<List<CityEntity>> call() async {
    return await repository.getCities();
  }
}
