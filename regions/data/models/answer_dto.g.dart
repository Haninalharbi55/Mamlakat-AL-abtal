// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) => AnswerDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$AnswerDtoToJson(AnswerDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_correct': instance.isCorrect,
    };
