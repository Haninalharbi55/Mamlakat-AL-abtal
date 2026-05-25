import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/habit_entry.dart';
import '../../domain/entities/habit_summary.dart';
import '../../domain/entities/achievement_entity.dart';
import '../../domain/entities/roten_entity.dart';
import '../../domain/repositories/habits_repository.dart';
import '../datasources/habits_remote_datasource.dart';
import '../models/habit_entry_dto.dart';
import '../models/habit_summary_dto.dart';

class HabitsRepositoryImpl implements HabitsRepository {
  final HabitsRemoteDataSource remoteDataSource;

  HabitsRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> submitEntry(HabitEntry entry) async {
    try {
      final message = await remoteDataSource.submitEntry(
        HabitEntryDto(
          type: entry.type.name,
          value: entry.value,
          unit: entry.unit,
          date: entry.date.toIso8601String(),
        ),
      );
      return message;
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<HabitSummary> getTodaySummary() async {
    try {
      final dto = await remoteDataSource.getTodaySummary();
      return _mapDtoToEntity(dto);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<Map<String, double>> getGoals() async {
    try {
      return await remoteDataSource.getGoals();
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<String> submitFood(int count) async {
    try {
      return await remoteDataSource.submitFood(count);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<String> submitDrink(int count) async {
    try {
      return await remoteDataSource.submitDrink(count);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<String> submitWalk(int count) async {
    try {
      return await remoteDataSource.submitWalk(count);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<String> submitSleep(int count) async {
    try {
      return await remoteDataSource.submitSleep(count);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<List<AchievementEntity>> getDailyAchievements() async {
    try {
      final models = await remoteDataSource.getDailyAchievements();
      return models; // AchievementModel extends AchievementEntity
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<RotenEntity> getDailyRotenStatus() async {
    try {
      return await remoteDataSource.getDailyRotenStatus();
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  HabitSummary _mapDtoToEntity(HabitSummaryDto dto) {
    return HabitSummary(
      waterCurrent: (dto.water['current'] as num).toDouble(),
      waterGoal: (dto.water['goal'] as num).toDouble(),
      sleepCurrent: (dto.sleep['current'] as num).toDouble(),
      sleepGoal: (dto.sleep['goal'] as num).toDouble(),
      walkCurrent: (dto.walk['current'] as num).toDouble(),
      walkGoal: (dto.walk['goal'] as num).toDouble(),
      foodCurrent: (dto.food['current'] as num).toDouble(),
      foodGoal: (dto.food['goal'] as num).toDouble(),
    );
  }
}
