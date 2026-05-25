import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_entity.freezed.dart';

@freezed
class RewardEntity with _$RewardEntity {
  const factory RewardEntity({
    required int id,
    required String title,
    required String titleEn,
    required bool earned,
    required DateTime? earnedDate,
  }) = _RewardEntity;
}
