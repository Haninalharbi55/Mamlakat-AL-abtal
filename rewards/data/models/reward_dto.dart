import 'package:json_annotation/json_annotation.dart';

part 'reward_dto.g.dart';

@JsonSerializable()
class RewardDto {
  final int id;
  final String title;
  @JsonKey(name: 'titleEn')
  final String titleEn;
  final bool earned;
  @JsonKey(name: 'earnedDate')
  final String? earnedDate;

  RewardDto({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.earned,
    this.earnedDate,
  });

  factory RewardDto.fromJson(Map<String, dynamic> json) =>
      _$RewardDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RewardDtoToJson(this);
}
