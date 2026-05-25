import '../../domain/entities/reward_entity.dart';
import '../../domain/entities/achievement_data_entity.dart';
import '../../domain/repositories/rewards_repository.dart';
import '../datasources/rewards_remote_datasource.dart';
import '../models/reward_dto.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/error_handler.dart';

class RewardsRepositoryImpl implements RewardsRepository {
  final RewardsRemoteDataSource remoteDataSource;

  RewardsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<RewardEntity>> getRewards() async {
    try {
      final dtos = await remoteDataSource.getRewards();
      return dtos.map(_mapDtoToEntity).toList();
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<AchievementDataEntity> getAchievementsData() async {
    try {
      return await remoteDataSource.getAchievementsData();
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  RewardEntity _mapDtoToEntity(RewardDto dto) {
    return RewardEntity(
      id: dto.id,
      title: dto.title,
      titleEn: dto.titleEn,
      earned: dto.earned,
      earnedDate: dto.earnedDate != null
          ? DateTime.parse(dto.earnedDate!)
          : null,
    );
  }
}
