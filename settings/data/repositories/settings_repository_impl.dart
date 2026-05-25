import '../../../../core/error/failures.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/preferences_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final PreferencesDataSource preferencesDataSource;

  SettingsRepositoryImpl(this.preferencesDataSource);

  @override
  Future<String?> getLanguage() async {
    return await preferencesDataSource.getLanguage();
  }

  @override
  Future<void> setLanguage(String language) async {
    await preferencesDataSource.setLanguage(language);
  }

  @override
  Future<bool?> getTheme() async {
    return await preferencesDataSource.getTheme();
  }

  @override
  Future<void> setTheme(bool isDark) async {
    await preferencesDataSource.setTheme(isDark);
  }
}
