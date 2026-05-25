import 'package:dio/dio.dart';
import '../models/habit_entry_dto.dart';
import '../models/habit_summary_dto.dart';
import '../models/achievement_model.dart';
import '../models/roten_model.dart';
import 'package:mamlakat_alabtal/core/network/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';

abstract class HabitsRemoteDataSource {
  Future<String> submitEntry(HabitEntryDto entry);
  Future<HabitSummaryDto> getTodaySummary();
  Future<Map<String, double>> getGoals();
  Future<String> submitFood(int count);
  Future<String> submitDrink(int count);
  Future<String> submitWalk(int count);
  Future<String> submitSleep(int count);
  Future<List<AchievementModel>> getDailyAchievements();
  Future<RotenModel> getDailyRotenStatus();
}

class HabitsRemoteDataSourceImpl implements HabitsRemoteDataSource {
  final Dio dio;

  HabitsRemoteDataSourceImpl(this.dio);

  @override
  Future<String> submitEntry(HabitEntryDto entry) async {
    try {
      final response = await dio.post(
        ApiEndpoints.habitEntries,
        data: entry.toJson(),
      );
      return response.data['message'] ?? 'تم الحفظ بنجاح';
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في حفظ البيانات');
    }
  }

  @override
  Future<String> submitFood(int count) async {
    try {
      final response = await dio.post(ApiEndpoints.foods, data: {'count': count});
      return response.data['message'] ?? 'تم حفظ بيانات الطعام';
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في حفظ بيانات الطعام');
    }
  }

  @override
  Future<String> submitDrink(int count) async {
    try {
      final response = await dio.post(ApiEndpoints.drinks, data: {'count': count});
      return response.data['message'] ?? 'تم حفظ بيانات الشراب';
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في حفظ بيانات الشراب');
    }
  }

  @override
  Future<String> submitWalk(int count) async {
    try {
      final response = await dio.post(ApiEndpoints.walks, data: {'count': count});
      return response.data['message'] ?? 'تم حفظ بيانات المشي';
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في حفظ بيانات المشي');
    }
  }

  @override
  Future<String> submitSleep(int count) async {
    try {
      final response = await dio.post(ApiEndpoints.sleeps, data: {'count': count});
      return response.data['message'] ?? 'تم حفظ بيانات النوم';
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في حفظ بيانات النوم');
    }
  }

  @override
  Future<HabitSummaryDto> getTodaySummary() async {
    // Mock local data since endpoint does not exist
    return HabitSummaryDto(
      water: {'current': 0.0, 'goal': 8.0},
      sleep: {'current': 0.0, 'goal': 8.0},
      walk: {'current': 0.0, 'goal': 6000.0},
      food: {'current': 0.0, 'goal': 3.0},
    );
  }

  @override
  Future<Map<String, double>> getGoals() async {
    try {
      final response = await dio.get(ApiEndpoints.goals);
      return Map<String, double>.from(response.data);
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب الأهداف');
    }
  }

  @override
  Future<List<AchievementModel>> getDailyAchievements() async {
    try {
      final response = await dio.get(ApiEndpoints.dailyAchievements);
      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => AchievementModel.fromJson(json)).toList();
      } else {
        throw ServerException(response.data['message'] ?? 'حدث خطأ في جلب الإنجازات');
      }
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب الإنجازات اليومية');
    }
  }

  @override
  Future<RotenModel> getDailyRotenStatus() async {
    try {
      final response = await dio.get(ApiEndpoints.achievements);
      return RotenModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في التحقق من التحديات اليومية');
    }
  }
}
