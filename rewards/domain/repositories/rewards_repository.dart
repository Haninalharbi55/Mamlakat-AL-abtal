import '../entities/reward_entity.dart';
import '../entities/achievement_data_entity.dart';
import '../../../../core/error/failures.dart';

abstract class RewardsRepository {
  Future<List<RewardEntity>> getRewards();
  Future<AchievementDataEntity> getAchievementsData();
}
