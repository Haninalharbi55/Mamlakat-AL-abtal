import '../../../../core/error/error_handler.dart';
import '../../domain/entities/region_entity.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/repositories/map_repository.dart';
import '../datasources/map_remote_datasource.dart';
import '../models/region_dto.dart';

class MapRepositoryImpl implements MapRepository {
  final MapRemoteDataSource remoteDataSource;

  MapRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CityEntity>> getCities() async {
    try {
      return await remoteDataSource.getCities();
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<List<RegionEntity>> getRegions() async {
    try {
      final dtos = await remoteDataSource.getRegions();
      final childRegions = await remoteDataSource.getChildRegions();
      
      // Merge status from child regions
      final childRegionsMap = {
        for (var cr in childRegions)
          cr['regionId']: cr['status'] as String
      };
      
      return dtos.map((dto) {
        var status = childRegionsMap[dto.id] ?? dto.status;
        
        // Manual override: Swap Riyadh (1) and Diriyah (5) statuses
        if (dto.id == 1) {
          status = 'LOCKED';
        } else if (dto.id == 5) {
          status = 'UNLOCKED';
        }
        
        return _mapDtoToEntity(dto, status);
      }).toList();
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  RegionEntity _mapDtoToEntity(RegionDto dto, String status) {
    RegionStatus regionStatus;
    switch (status.toUpperCase()) {
      case 'LOCKED':
        regionStatus = RegionStatus.locked;
        break;
      case 'UNLOCKED':
        regionStatus = RegionStatus.unlocked;
        break;
      case 'COMPLETED':
        regionStatus = RegionStatus.completed;
        break;
      default:
        regionStatus = RegionStatus.locked;
    }
    
    return RegionEntity(
      id: dto.id,
      name: dto.name,
      nameEn: dto.nameEn,
      description: dto.description,
      status: regionStatus,
      image: dto.image,
    );
  }
}
