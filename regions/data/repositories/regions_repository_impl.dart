import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/entities/answer_entity.dart';
import '../../domain/repositories/regions_repository.dart';
import '../datasources/regions_remote_datasource.dart';
import '../models/question_dto.dart';
import '../models/answer_dto.dart';

class RegionsRepositoryImpl implements RegionsRepository {
  final RegionsRemoteDataSource remoteDataSource;

  RegionsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<QuestionEntity>> getCityQuestions(int cityId) async {
    try {
      final dtos = await remoteDataSource.getCityQuestions(cityId);
      return dtos.map((dto) => _mapQuestionDtoToEntity(dto)).toList();
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<Map<String, dynamic>> submitQuiz(
    int regionId,
    List<int> answers,
  ) async {
    try {
      return await remoteDataSource.submitQuiz(regionId, answers);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  QuestionEntity _mapQuestionDtoToEntity(QuestionDto dto) {
    return QuestionEntity(
      id: dto.id,
      name: dto.name,
      cityId: dto.cityId,
      answers: dto.answers.map((a) => _mapAnswerDtoToEntity(a)).toList(),
      createdAt: DateTime.tryParse(dto.createdAt ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(dto.updatedAt ?? '') ?? DateTime.now(),
    );
  }

  AnswerEntity _mapAnswerDtoToEntity(AnswerDto dto) {
    return AnswerEntity(
      id: dto.id,
      name: dto.name,
      isCorrect: dto.isCorrect,
    );
  }
}
