import '../repositories/settings_repository.dart';

class ChangeLanguageUseCase {
  final SettingsRepository repository;

  ChangeLanguageUseCase(this.repository);

  Future<void> call(String language) async {
    await repository.setLanguage(language);
  }
}
