import 'package:freezed_annotation/freezed_annotation.dart';
import 'question_entity.dart';

part 'quiz_entity.freezed.dart';

@freezed
class QuizEntity with _$QuizEntity {
  const factory QuizEntity({
    required int id,
    required int regionId,
    required List<QuestionEntity> questions,
  }) = _QuizEntity;
}
