import '../entities/reward_entity.dart';
import '../repositories/rewards_repository.dart';

class GetRewardsUseCase {
  final RewardsRepository repository;

  GetRewardsUseCase(this.repository);

  Future<List<RewardEntity>> call() async {
    return await repository.getRewards();
  }
}
