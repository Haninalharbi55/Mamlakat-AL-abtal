import 'package:equatable/equatable.dart';
import '../../domain/entities/question_entity.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuestionEntity> questions;

  const QuizLoaded(this.questions);

  @override
  List<Object> get props => [questions];
}

class QuizError extends QuizState {
  final String message;

  const QuizError(this.message);

  @override
  List<Object> get props => [message];
}

class QuizSubmitting extends QuizState {}

class QuizSubmitted extends QuizState {
  final int score;
  final int total;
  final bool passed;

  const QuizSubmitted({
    required this.score,
    required this.total,
    required this.passed,
  });

  @override
  List<Object> get props => [score, total, passed];
}

class QuizSubmitError extends QuizState {
  final String message;

  const QuizSubmitError(this.message);

  @override
  List<Object> get props => [message];
}
