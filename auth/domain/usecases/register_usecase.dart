import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<UserEntity> call({
    required String name,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await repository.register(
      name: name,
      gender: gender,
      dateOfBirth: dateOfBirth,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
