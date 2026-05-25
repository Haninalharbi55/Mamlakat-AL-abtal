import '../entities/region_entity.dart';
import '../entities/city_entity.dart';
import '../../../../core/error/failures.dart';

abstract class MapRepository {
  Future<List<RegionEntity>> getRegions();
  Future<List<CityEntity>> getCities();
}
