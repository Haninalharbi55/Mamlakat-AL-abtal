import '../repositories/regions_repository.dart';

class SubmitQuizUseCase {
  final RegionsRepository repository;

  SubmitQuizUseCase(this.repository);

  Future<Map<String, dynamic>> call(int regionId, List<int> answers) async {
    return await repository.submitQuiz(regionId, answers);
  }
}
