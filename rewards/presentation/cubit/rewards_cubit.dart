import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_rewards_usecase.dart';
import '../../domain/usecases/get_achievements_usecase.dart';
import 'rewards_state.dart';

class RewardsCubit extends Cubit<RewardsState> {
  final GetRewardsUseCase getRewardsUseCase;
  final GetAchievementsUseCase getAchievementsUseCase;

  RewardsCubit({
    required this.getRewardsUseCase,
    required this.getAchievementsUseCase,
  }) : super(RewardsInitial());

  Future<void> loadRewards() async {
    emit(RewardsLoading());
    try {
      final rewards = await getRewardsUseCase();
      final achievementData = await getAchievementsUseCase();
      emit(RewardsLoaded(
        rewards: rewards,
        achievementData: achievementData,
      ));
    } catch (e) {
      emit(RewardsError(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
