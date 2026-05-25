// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      cityId: (json['city_id'] as num).toInt(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city_id': instance.cityId,
      'answers': instance.answers,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
