// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitSummaryDto _$HabitSummaryDtoFromJson(Map<String, dynamic> json) =>
    HabitSummaryDto(
      water: json['water'] as Map<String, dynamic>,
      sleep: json['sleep'] as Map<String, dynamic>,
      walk: json['walk'] as Map<String, dynamic>,
      food: json['food'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$HabitSummaryDtoToJson(HabitSummaryDto instance) =>
    <String, dynamic>{
      'water': instance.water,
      'sleep': instance.sleep,
      'walk': instance.walk,
      'food': instance.food,
    };
