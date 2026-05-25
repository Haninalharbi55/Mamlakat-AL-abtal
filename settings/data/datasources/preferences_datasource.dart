import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/constants.dart';

abstract class PreferencesDataSource {
  Future<String?> getLanguage();
  Future<void> setLanguage(String language);
  Future<bool?> getTheme();
  Future<void> setTheme(bool isDark);
}

class PreferencesDataSourceImpl implements PreferencesDataSource {
  final SharedPreferences sharedPreferences;

  PreferencesDataSourceImpl(this.sharedPreferences);

  @override
  Future<String?> getLanguage() async {
    return sharedPreferences.getString(AppConstants.languageKey);
  }

  @override
  Future<void> setLanguage(String language) async {
    await sharedPreferences.setString(AppConstants.languageKey, language);
  }

  @override
  Future<bool?> getTheme() async {
    return sharedPreferences.getBool(AppConstants.themeKey);
  }

  @override
  Future<void> setTheme(bool isDark) async {
    await sharedPreferences.setBool(AppConstants.themeKey, isDark);
  }
}
