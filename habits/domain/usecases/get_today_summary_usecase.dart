import '../entities/habit_summary.dart';
import '../repositories/habits_repository.dart';

class GetTodaySummaryUseCase {
  final HabitsRepository repository;

  GetTodaySummaryUseCase(this.repository);

  Future<HabitSummary> call() async {
    return await repository.getTodaySummary();
  }
}
