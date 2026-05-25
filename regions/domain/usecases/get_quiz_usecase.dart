import '../repositories/regions_repository.dart';
import '../entities/question_entity.dart';

class GetCityQuestionsUseCase {
  final RegionsRepository repository;

  GetCityQuestionsUseCase(this.repository);

  Future<List<QuestionEntity>> call(int cityId) async {
    return await repository.getCityQuestions(cityId);
  }
}
