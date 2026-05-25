import '../../../../core/error/failures.dart';
import '../entities/habit_entry.dart';
import '../repositories/habits_repository.dart';

class SubmitEntryUseCase {
  final HabitsRepository repository;

  SubmitEntryUseCase(this.repository);

  Future<String> call(HabitEntry entry) async {
    return await repository.submitEntry(entry);
  }
}
