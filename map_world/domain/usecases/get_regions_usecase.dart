import '../entities/region_entity.dart';
import '../repositories/map_repository.dart';

class GetRegionsUseCase {
  final MapRepository repository;

  GetRegionsUseCase(this.repository);

  Future<List<RegionEntity>> call() async {
    return await repository.getRegions();
  }
}
