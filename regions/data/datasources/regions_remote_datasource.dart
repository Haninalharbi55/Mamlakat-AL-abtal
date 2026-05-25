import 'package:dio/dio.dart';
import '../models/question_dto.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';

abstract class RegionsRemoteDataSource {
  Future<List<QuestionDto>> getCityQuestions(int cityId);
  Future<Map<String, dynamic>> submitQuiz(int regionId, List<int> answers);
}

class RegionsRemoteDataSourceImpl implements RegionsRemoteDataSource {
  final Dio dio;

  RegionsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<QuestionDto>> getCityQuestions(int cityId) async {
    try {
      final response = await dio.get(ApiEndpoints.cityQuestions(cityId));
      final List data = response.data['result']['data'];
      return data.map((json) => QuestionDto.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب الأسئلة');
    }
  }

  @override
  Future<Map<String, dynamic>> submitQuiz(
    int regionId,
    List<int> answers,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.submitQuiz(regionId),
        data: {'answers': answers},
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في إرسال الإجابات');
    }
  }
}
