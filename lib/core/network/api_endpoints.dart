class ApiEndpoints {
  // Auth endpoints
  static const String register = '/api/register';
  static const String login = '/api/login';
  static const String me = '/auth/me';
  static const String profile = '/api/profile';
  
  // Habits endpoints
  static const String habitEntries = '/habits/entries';
  static const String goals = '/habits/goals';
  static const String foods = '/api/foods';
  static const String drinks = '/api/drinks';
  static const String walks = '/api/walks';
  static const String sleeps = '/api/sleeps';
  static const String dailyAchievements = '/api/daily-achievements';
  
  // Regions endpoints
  static const String regions = '/regions';
  static String childRegions = '/child/regions';
  static const String cities = '/api/cities';
  static String unlockRegion(int regionId) => '/child/regions/$regionId/unlock';
  static String cityQuestions(int cityId) => '/api/cities/$cityId/questions';
  static String submitQuiz(int regionId) => '/regions/$regionId/quiz/submit';
  
  // Rewards endpoints
  static const String rewards = '/rewards';
  static const String achievements = '/api/achievements';
}

// Force compiler refresh
