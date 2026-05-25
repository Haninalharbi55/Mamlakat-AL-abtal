import 'package:dio/dio.dart';
import '../models/auth_dto.dart';
import '../models/user_dto.dart';
import '../models/profile_response_dto.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<AuthDto> login(String email, String password);
  Future<AuthDto> register({
    required String name,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
  Future<UserDto> getCurrentUser();
  Future<UserDto> getProfile();
  Future<UserDto> updateProfile({
    required String name,
    required String gender,
    required String dateOfBirth,
    String? avatarPath,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthDto> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      return AuthDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      }
      throw ServerException('حدث خطأ في تسجيل الدخول');
    }
  }

  @override
  Future<AuthDto> register({
    required String name,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'gender': gender,
        'date_of_birth': dateOfBirth,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });

      final response = await dio.post(
        ApiEndpoints.register,
        data: formData,
      );
      return AuthDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 422) {
        final message = e.response?.data?['message'] ?? 'البيانات المدخلة غير صحيحة';
        throw ValidationException(message);
      }
      throw ServerException('حدث خطأ في إنشاء الحساب');
    }
  }

  @override
  Future<UserDto> getCurrentUser() async {
    try {
      final response = await dio.get(ApiEndpoints.me);
      return UserDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('غير مصرح');
      }
      throw ServerException('حدث خطأ في جلب بيانات المستخدم');
    }
  }

  @override
  Future<UserDto> getProfile() async {
    try {
      final response = await dio.get(ApiEndpoints.profile);
      final profileResponse = ProfileResponseDto.fromJson(response.data);
      if (profileResponse.result == null) {
        throw ServerException('لم يتم العثور على بيانات المستخدم');
      }
      return profileResponse.result!;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('غير مصرح');
      }
      throw ServerException('حدث خطأ في جلب بيانات البروفايل');
    }
  }

  @override
  Future<UserDto> updateProfile({
    required String name,
    required String gender,
    required String dateOfBirth,
    String? avatarPath,
  }) async {
    try {
      final Map<String, dynamic> formDataMap = {
        'name': name,
        'gender': gender,
        'date_of_birth': dateOfBirth,
        '_method': 'PUT',
      };

      if (avatarPath != null) {
        formDataMap['avatar'] = await MultipartFile.fromFile(avatarPath);
      }

      final formData = FormData.fromMap(formDataMap);

      final response = await dio.post(
        ApiEndpoints.profile,
        data: formData,
      );
      
      final profileResponse = ProfileResponseDto.fromJson(response.data);
      if (profileResponse.result == null) {
        throw ServerException('فشل في تحديث بيانات المستخدم');
      }
      return profileResponse.result!;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('غير مصرح');
      }
      throw ServerException('حدث خطأ في تحديث بيانات البروفايل');
    }
  }
}
