abstract class SettingsRepository {
  Future<String?> getLanguage();
  Future<void> setLanguage(String language);
  Future<bool?> getTheme();
  Future<void> setTheme(bool isDark);
}
