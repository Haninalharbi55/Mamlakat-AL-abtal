import 'package:json_annotation/json_annotation.dart';

part 'habit_summary_dto.g.dart';

@JsonSerializable()
class HabitSummaryDto {
  final Map<String, dynamic> water;
  final Map<String, dynamic> sleep;
  final Map<String, dynamic> walk;
  final Map<String, dynamic> food;

  HabitSummaryDto({
    required this.water,
    required this.sleep,
    required this.walk,
    required this.food,
  });

  factory HabitSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$HabitSummaryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HabitSummaryDtoToJson(this);
}
