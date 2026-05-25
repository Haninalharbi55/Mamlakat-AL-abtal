import '../entities/achievement_entity.dart';
import '../repositories/habits_repository.dart';

class GetDailyAchievementsUseCase {
  final HabitsRepository repository;

  GetDailyAchievementsUseCase(this.repository);

  Future<List<AchievementEntity>> call() async {
    return await repository.getDailyAchievements();
  }
}
