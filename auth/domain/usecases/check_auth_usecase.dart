import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class CheckAuthUseCase {
  final AuthRepository repository;

  CheckAuthUseCase(this.repository);

  Future<UserEntity?> call() async {
    final isAuth = await repository.isAuthenticated();
    if (!isAuth) return null;
    return await repository.getCurrentUser();
  }
}
