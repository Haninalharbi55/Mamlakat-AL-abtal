class AppConstants {
  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userRoleKey = 'user_role';
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  
  // API Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Validation
  static const int minPasswordLength = 6;
  static const int maxAge = 12;
  static const int minAge = 6;
  
  // Habit Limits
  static const int maxSleepHours = 14;
  static const int maxWaterMl = 5000;
  static const int maxSteps = 50000;
  
  // Default Goals
  static const int defaultWaterGoal = 6; // cups
  static const int defaultSleepGoal = 10; // hours
  static const int defaultWalkGoal = 5000; // steps
  static const int defaultFoodGoal = 8; // points
}
