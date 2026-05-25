import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl(this.remoteDataSource, this.sharedPreferences);

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final authDto = await remoteDataSource.login(email, password);
      if (authDto.success && authDto.result?.token != null) {
        await sharedPreferences.setString(
          AppConstants.accessTokenKey,
          authDto.result!.token!,
        );
        if (authDto.result?.role != null) {
          await sharedPreferences.setString(
            AppConstants.userRoleKey,
            authDto.result!.role!,
          );
        }
        try {
          final userDto = await remoteDataSource.getProfile();
          return _mapDtoToEntity(userDto);
        } catch (_) {
          return UserEntity(
            id: 0,
            name: 'المستخدم',
            email: email,
            gender: 'unknown',
          );
        }
      } else {
        throw ServerException(authDto.message);
      }
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<UserEntity> register({
    required String name,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final authDto = await remoteDataSource.register(
        name: name,
        gender: gender,
        dateOfBirth: dateOfBirth,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      
      if (authDto.success) {
        // After registration success, we don't have a token yet in the sample response.
        // We might need to login the user or return a user entity.
        return UserEntity(
          id: 0,
          name: name,
          email: email,
          gender: gender,
        );
      } else {
        throw ServerException(authDto.message);
      }
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final token = sharedPreferences.getString(AppConstants.accessTokenKey);
    if (token == null) return null;
    try {
      final userDto = await remoteDataSource.getProfile();
      return _mapDtoToEntity(userDto);
    } on UnauthorizedException {
      await logout();
      return null;
    } catch (_) {
      return UserEntity(
        id: 0,
        name: 'المستخدم',
        email: '',
        gender: 'unknown',
      );
    }
  }

  @override
  Future<void> logout() async {
    await sharedPreferences.remove(AppConstants.accessTokenKey);
    await sharedPreferences.remove(AppConstants.refreshTokenKey);
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = sharedPreferences.getString(AppConstants.accessTokenKey);
    return token != null;
  }

  @override
  Future<UserEntity> getProfile() async {
    try {
      final userDto = await remoteDataSource.getProfile();
      return _mapDtoToEntity(userDto);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  @override
  Future<UserEntity> updateProfile({
    required String name,
    required String gender,
    required String dateOfBirth,
    String? avatarPath,
  }) async {
    try {
      final userDto = await remoteDataSource.updateProfile(
        name: name,
        gender: gender,
        dateOfBirth: dateOfBirth,
        avatarPath: avatarPath,
      );
      return _mapDtoToEntity(userDto);
    } on Exception catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  UserEntity _mapDtoToEntity(UserDto dto) {
    return UserEntity(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      gender: dto.gender,
      dateOfBirth: dto.dateOfBirth,
      points: dto.points,
      avatarUrl: dto.avatarUrl,
    );
  }
}
