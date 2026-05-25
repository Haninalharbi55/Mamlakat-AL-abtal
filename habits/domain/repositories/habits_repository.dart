import '../entities/habit_entry.dart';
import '../entities/habit_summary.dart';
import '../entities/achievement_entity.dart';
import '../entities/roten_entity.dart';
import '../../../../core/error/failures.dart';

abstract class HabitsRepository {
  Future<String> submitEntry(HabitEntry entry);
  Future<HabitSummary> getTodaySummary();
  Future<Map<String, double>> getGoals();
  Future<String> submitFood(int count);
  Future<String> submitDrink(int count);
  Future<String> submitWalk(int count);
  Future<String> submitSleep(int count);
  Future<List<AchievementEntity>> getDailyAchievements();
  Future<RotenEntity> getDailyRotenStatus();
}
