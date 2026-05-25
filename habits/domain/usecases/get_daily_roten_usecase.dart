import '../entities/roten_entity.dart';
import '../repositories/habits_repository.dart';

class GetDailyRotenUseCase {
  final HabitsRepository repository;

  GetDailyRotenUseCase(this.repository);

  Future<RotenEntity> call() async {
    return await repository.getDailyRotenStatus();
  }
}
