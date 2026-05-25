import '../entities/question_entity.dart';
import '../../../../core/error/failures.dart';

abstract class RegionsRepository {
  Future<List<QuestionEntity>> getCityQuestions(int cityId);
  Future<Map<String, dynamic>> submitQuiz(int regionId, List<int> answers);
}
