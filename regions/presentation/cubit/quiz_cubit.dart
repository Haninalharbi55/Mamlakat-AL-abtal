import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_quiz_usecase.dart';
import '../../domain/usecases/submit_quiz_usecase.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final GetCityQuestionsUseCase getCityQuestionsUseCase;
  final SubmitQuizUseCase submitQuizUseCase;

  QuizCubit(
    this.getCityQuestionsUseCase,
    this.submitQuizUseCase,
  ) : super(QuizInitial());

  Future<void> loadQuiz(int cityId) async {
    emit(QuizLoading());
    try {
      final questions = await getCityQuestionsUseCase(cityId);
      emit(QuizLoaded(questions));
    } catch (e) {
      emit(QuizError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> submitQuiz(int regionId, List<int> answers) async {
    emit(QuizSubmitting());
    try {
      final result = await submitQuizUseCase(regionId, answers);
      emit(QuizSubmitted(
        score: result['score'] as int,
        total: result['total'] as int,
        passed: result['passed'] as bool,
      ));
    } catch (e) {
      emit(QuizSubmitError(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
