import '../entities/user_entity.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register({
    required String name,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
  Future<UserEntity?> getCurrentUser();
  Future<void> logout();
  Future<bool> isAuthenticated();
  Future<UserEntity> getProfile();
  Future<UserEntity> updateProfile({
    required String name,
    required String gender,
    required String dateOfBirth,
    String? avatarPath,
  });
}
