import '../entities/region_entity.dart';
import '../repositories/map_repository.dart';

class GetChildRegionsUseCase {
  final MapRepository repository;

  GetChildRegionsUseCase(this.repository);

  Future<List<RegionEntity>> call() async {
    return await repository.getRegions();
  }
}
