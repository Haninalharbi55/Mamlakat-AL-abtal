import 'package:dio/dio.dart';
import '../models/region_dto.dart';
import '../models/city_model.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';

abstract class MapRemoteDataSource {
  Future<List<RegionDto>> getRegions();
  Future<List<Map<String, dynamic>>> getChildRegions();
  Future<List<CityModel>> getCities();
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final Dio dio;

  MapRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RegionDto>> getRegions() async {
    try {
      final response = await dio.get(ApiEndpoints.regions);
      return (response.data as List)
          .map((json) => RegionDto.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب المناطق');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getChildRegions() async {
    try {
      final response = await dio.get(ApiEndpoints.childRegions);
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب حالة المناطق');
    }
  }

  @override
  Future<List<CityModel>> getCities() async {
    try {
      final response = await dio.get(ApiEndpoints.cities);
      final data = response.data['result']['data'] as List;
      return data.map((json) => CityModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException('حدث خطأ في جلب المدن');
    }
  }
}
