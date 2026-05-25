// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitEntryDto _$HabitEntryDtoFromJson(Map<String, dynamic> json) =>
    HabitEntryDto(
      type: json['type'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$HabitEntryDtoToJson(HabitEntryDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
      'unit': instance.unit,
      'date': instance.date,
    };
