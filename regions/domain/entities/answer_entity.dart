import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_entity.freezed.dart';

@freezed
class AnswerEntity with _$AnswerEntity {
  const factory AnswerEntity({
    required int id,
    required String name,
    required bool isCorrect,
  }) = _AnswerEntity;
}
