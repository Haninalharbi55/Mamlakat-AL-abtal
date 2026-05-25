import 'package:json_annotation/json_annotation.dart';
import 'question_dto.dart';

part 'quiz_dto.g.dart';

@JsonSerializable()
class QuizDto {
  final int id;
  @JsonKey(name: 'regionId')
  final int regionId;
  final List<QuestionDto> questions;

  QuizDto({
    required this.id,
    required this.regionId,
    required this.questions,
  });

  factory QuizDto.fromJson(Map<String, dynamic> json) =>
      _$QuizDtoFromJson(json);
  Map<String, dynamic> toJson() => _$QuizDtoToJson(this);
}
