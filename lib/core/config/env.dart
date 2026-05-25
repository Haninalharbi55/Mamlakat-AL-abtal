import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get apiBaseUrl {
    try {
      return dotenv.env['API_BASE_URL'] ?? 'https://api.example.com';
    } catch (e) {
      // dotenv not loaded yet, use default
      return 'https://api.example.com';
    }
  }
  
  static Future<void> load() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (e) {
      // .env file not found, use default values
      // This is fine for development with mock data
      // The app will use the default API_BASE_URL from getter above
    }
  }
}
