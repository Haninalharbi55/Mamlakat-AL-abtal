import 'package:dio/dio.dart';
import '../models/reward_dto.dart';
import '../models/achievement_data_model.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';

abstract class RewardsRemoteDataSource {
  Future<List<RewardDto>> getRewards();
  Future<AchievementDataModel> getAchievementsData();
}

class RewardsRemoteDataSourceImpl implements RewardsRemoteDataSource {
  final Dio dio;

  RewardsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RewardDto>> getRewards() async {
    try {
      final response = await dio.get(ApiEndpoints.rewards);
      return (response.data as List)
          .map((json) => RewardDto.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب المكافئات');
    }
  }

  @override
  Future<AchievementDataModel> getAchievementsData() async {
    try {
      final response = await dio.get(ApiEndpoints.achievements);
      return AchievementDataModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب بيانات الإنجازات');
    }
  }
}
