// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizDto _$QuizDtoFromJson(Map<String, dynamic> json) => QuizDto(
      id: (json['id'] as num).toInt(),
      regionId: (json['regionId'] as num).toInt(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizDtoToJson(QuizDto instance) => <String, dynamic>{
      'id': instance.id,
      'regionId': instance.regionId,
      'questions': instance.questions,
    };
