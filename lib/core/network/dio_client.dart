import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/constants.dart';
import '../config/env.dart';
import 'api_endpoints.dart';

class DioClient {
  late Dio _dio;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final bool useMockData;

  DioClient({this.useMockData = true}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.apiBaseUrl,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
    
    // Enable mock data for endpoints not yet available on the server
    if (useMockData) {
      _dio.interceptors.add(MockInterceptor());
    }
  }

  Dio get dio => _dio;
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.accessTokenKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(AppConstants.accessTokenKey);
    }
    handler.next(err);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle different error types
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      err = DioException(
        requestOptions: err.requestOptions,
        type: err.type,
        error: 'انتهت مهلة الاتصال',
      );
    }
    handler.next(err);
  }
}

class MockInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return mock response based on endpoint
    // Use both path and uri.path for better matching
    final path = options.path;
    final uriPath = options.uri.path;
    final mockResponse = _getMockResponse(path, options.method) ?? 
                         _getMockResponse(uriPath, options.method);
    
    if (mockResponse != null) {
      handler.resolve(
        Response(
          requestOptions: options,
          data: mockResponse,
          statusCode: 200,
        ),
      );
    } else {
      handler.next(options);
    }
  }

  dynamic _getMockResponse(String path, String method) {
    // Normalize path - remove base URL if present
    final normalizedPath = path.replaceAll(RegExp(r'^https?://[^/]+'), '');
    final checkPath = normalizedPath.isEmpty ? path : normalizedPath;
    
    // Auth endpoints
    if (checkPath.contains('/auth/login') && method == 'POST') {
      return {
        'access_token': 'mock_token_12345',
        'refresh_token': 'mock_refresh_token',
        'user': {
          'id': 1,
          'name': 'أحمد',
          'email': 'test@example.com',
          'age': 8,
          'gender': 'boy',
        }
      };
    }
    
    if (checkPath.contains('/auth/register') && method == 'POST') {
      return {
        'access_token': 'mock_token_12345',
        'refresh_token': 'mock_refresh_token',
        'user': {
          'id': 1,
          'name': 'أحمد',
          'email': 'test@example.com',
          'age': 8,
          'gender': 'boy',
        }
      };
    }
    
    if (checkPath.contains('/auth/me') && method == 'GET') {
      return {
        'id': 1,
        'name': 'أحمد',
        'email': 'test@example.com',
        'age': 8,
        'gender': 'boy',
      };
    }
    
    // Habits endpoints
    if (checkPath.contains('/habits/today-summary') && method == 'GET') {
      return {
        'water': {'current': 2, 'goal': 6, 'unit': 'cups'},
        'sleep': {'current': 8, 'goal': 10, 'unit': 'hours'},
        'walk': {'current': 4000, 'goal': 5000, 'unit': 'steps'},
        'food': {'current': 5, 'goal': 8, 'unit': 'points'},
      };
    }
    
    if (checkPath.contains('/habits/goals') && method == 'GET') {
      return {
        'water': 6,
        'sleep': 10,
        'walk': 5000,
        'food': 8,
      };
    }
    
    if (checkPath.contains('/habits/entries') && method == 'POST') {
      return {'success': true, 'message': 'تم الحفظ بنجاح'};
    }
    
    // Regions endpoints
    if (checkPath.contains('/regions') && !checkPath.contains('quiz') && method == 'GET') {
      return [
        {
          'id': 1,
          'name': 'الرياض',
          'nameEn': 'Riyadh',
          'description': 'عاصمة المملكة العربية السعودية',
          'status': 'UNLOCKED',
          'image': '',
        },
        {
          'id': 2,
          'name': 'جدة',
          'nameEn': 'Jeddah',
          'description': 'مدينة ساحلية جميلة',
          'status': 'LOCKED',
          'image': '',
        },
        {
          'id': 3,
          'name': 'نيوم',
          'nameEn': 'NEOM',
          'description': 'مدينة المستقبل',
          'status': 'LOCKED',
          'image': '',
        },
        {
          'id': 4,
          'name': 'أبها',
          'nameEn': 'Abha',
          'description': 'مدينة الجبال',
          'status': 'LOCKED',
          'image': '',
        },
        {
          'id': 5,
          'name': 'الدرعية',
          'nameEn': 'Diriyah',
          'description': 'قلب التاريخ',
          'status': 'LOCKED',
          'image': '',
        },
      ];
    }
    
    if (checkPath.contains('/child/regions') && method == 'GET') {
      return [
        {'regionId': 1, 'status': 'UNLOCKED'},
        {'regionId': 2, 'status': 'LOCKED'},
        {'regionId': 3, 'status': 'LOCKED'},
        {'regionId': 4, 'status': 'LOCKED'},
        {'regionId': 5, 'status': 'LOCKED'},
      ];
    }
    
    if (checkPath.contains('quiz') && !checkPath.contains('submit') && method == 'GET') {
      return {
        'id': 1,
        'regionId': 1,
        'questions': [
          {
            'id': 1,
            'question': 'ما هي عاصمة المملكة العربية السعودية؟',
            'options': ['الرياض', 'جدة', 'الدمام', 'أبها'],
            'correctAnswer': 0,
          },
          {
            'id': 2,
            'question': 'متى تأسست المملكة العربية السعودية؟',
            'options': ['1932', '1920', '1945', '1950'],
            'correctAnswer': 0,
          },
        ],
      };
    }
    
    if (checkPath.contains('quiz') && checkPath.contains('submit') && method == 'POST') {
      return {
        'score': 2,
        'total': 2,
        'passed': true,
        'message': 'ممتاز! لقد نجحت في الاختبار',
      };
    }
    
    // Rewards endpoints
    if (checkPath.contains('/rewards') && method == 'GET') {
      return [
        {
          'id': 1,
          'title': 'اكمال تحدي الطعام الصحي',
          'titleEn': 'Complete Healthy Food Challenge',
          'earned': false,
          'earnedDate': null,
        },
        {
          'id': 2,
          'title': 'اكمال تحدي شرب الماء',
          'titleEn': 'Complete Water Drinking Challenge',
          'earned': false,
          'earnedDate': null,
        },
        {
          'id': 3,
          'title': 'تسجيل بيانات المستخدم',
          'titleEn': 'User Data Registration',
          'earned': true,
          'earnedDate': '2024-01-15',
        },
        {
          'id': 4,
          'title': 'اكمال تحدي المشي',
          'titleEn': 'Complete Walking Challenge',
          'earned': false,
          'earnedDate': null,
        },
        {
          'id': 5,
          'title': 'فتح منطق الدرعية',
          'titleEn': 'Unlock Diriyah Region',
          'earned': true,
          'earnedDate': '2024-01-20',
        },
        {
          'id': 6,
          'title': 'اكمال تحدي النوم',
          'titleEn': 'Complete Sleep Challenge',
          'earned': false,
          'earnedDate': null,
        },
      ];
    }
    
    return null;
  }
}
