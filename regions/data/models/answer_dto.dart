import 'package:json_annotation/json_annotation.dart';

part 'answer_dto.g.dart';

@JsonSerializable()
class AnswerDto {
  final int id;
  final String name;
  @JsonKey(name: 'is_correct')
  final bool isCorrect;

  AnswerDto({
    required this.id,
    required this.name,
    required this.isCorrect,
  });

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);
}
