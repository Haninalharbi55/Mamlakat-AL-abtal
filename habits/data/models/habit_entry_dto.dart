import 'package:json_annotation/json_annotation.dart';

part 'habit_entry_dto.g.dart';

@JsonSerializable()
class HabitEntryDto {
  final String type;
  final double value;
  final String unit;
  final String date;

  HabitEntryDto({
    required this.type,
    required this.value,
    required this.unit,
    required this.date,
  });

  factory HabitEntryDto.fromJson(Map<String, dynamic> json) =>
      _$HabitEntryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HabitEntryDtoToJson(this);
}
