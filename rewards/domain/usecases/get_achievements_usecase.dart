import '../entities/achievement_data_entity.dart';
import '../repositories/rewards_repository.dart';

class GetAchievementsUseCase {
  final RewardsRepository repository;

  GetAchievementsUseCase(this.repository);

  Future<AchievementDataEntity> call() async {
    return await repository.getAchievementsData();
  }
}
