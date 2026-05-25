import 'package:freezed_annotation/freezed_annotation.dart';
import 'answer_entity.dart';

part 'question_entity.freezed.dart';

@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required int id,
    required String name,
    required int cityId,
    required List<AnswerEntity> answers,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _QuestionEntity;
}
