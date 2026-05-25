import 'package:json_annotation/json_annotation.dart';
import 'answer_dto.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  final int id;
  final String name;
  @JsonKey(name: 'city_id')
  final int cityId;
  final List<AnswerDto> answers;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  QuestionDto({
    required this.id,
    required this.name,
    required this.cityId,
    required this.answers,
    this.createdAt,
    this.updatedAt,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);
}
