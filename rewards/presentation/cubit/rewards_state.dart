import 'package:equatable/equatable.dart';
import '../../domain/entities/reward_entity.dart';
import '../../domain/entities/achievement_data_entity.dart';

abstract class RewardsState extends Equatable {
  const RewardsState();

  @override
  List<Object?> get props => [];
}

class RewardsInitial extends RewardsState {}

class RewardsLoading extends RewardsState {}

class RewardsLoaded extends RewardsState {
  final List<RewardEntity> rewards;
  final AchievementDataEntity achievementData;

  const RewardsLoaded({
    required this.rewards,
    required this.achievementData,
  });

  @override
  List<Object?> get props => [rewards, achievementData];
}

class RewardsError extends RewardsState {
  final String message;

  const RewardsError(this.message);

  @override
  List<Object> get props => [message];
}
