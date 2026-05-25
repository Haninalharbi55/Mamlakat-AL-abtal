import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/habits/presentation/pages/aldiriyah_region.dart';
import '../../features/habits/presentation/pages/home_page.dart';
import '../../features/map_world/data/models/city_model.dart';
import '../../features/map_world/domain/entities/city_entity.dart';
import '../../features/map_world/presentation/pages/map_screen.dart';
import '../../features/rewards/presentation/pages/rewards_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/habits/presentation/pages/daily_challenges_page.dart';
import '../../features/habits/presentation/pages/water_tracking_page.dart';
import '../../features/habits/presentation/pages/sleep_tracking_page.dart';
import '../../features/habits/presentation/pages/walk_tracking_page.dart';
import '../../features/habits/presentation/pages/food_tracking_page.dart';
import '../../features/regions/presentation/pages/region_detail_page.dart';
import '../../features/regions/presentation/pages/quiz_page.dart';
import '../../features/habits/presentation/pages/achievements_page.dart';
import 'route_names.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouteNames.rewards,
        builder: (context, state) => const RewardsPage(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: RouteNames.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: RouteNames.map,
            builder: (context, state) => const MapScreen(),
          ),
          GoRoute(
            path: RouteNames.map2,
            builder: (context, state) => const MapScreen(),
          ),
          GoRoute(
            path: RouteNames.settings,
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: RouteNames.achievements,
            builder: (context, state) =>  AchievementsPage(
            ),
          ),
        ],
      ),
      GoRoute(
        path: RouteNames.dailyChallenges,
        builder: (context, state) => const DailyChallengesPage(),
      ),
      GoRoute(
        path: RouteNames.waterTracking,
        builder: (context, state) => const WaterTrackingPage(),
      ),
      GoRoute(
        path: RouteNames.sleepTracking,
        builder: (context, state) => const SleepTrackingPage(),
      ),
      GoRoute(
        path: RouteNames.walkTracking,
        builder: (context, state) => const WalkTrackingPage(),
      ),
      GoRoute(
        path: RouteNames.foodTracking,
        builder: (context, state) => const FoodTrackingPage(),
      ),
      GoRoute(
        path: RouteNames.regionDetail,
        builder: (context, state) {
          final regionId = state.uri.queryParameters['id'];
          return RegionDetailPage(regionId: int.parse(regionId ?? '1'));
        },
      ),
      GoRoute(
        path: RouteNames.quiz,
        builder: (context, state) {
          final cityId = state.uri.queryParameters['cityId'];
          return QuizPage(cityId: int.parse(cityId ?? '1'));
        },
      ),

      GoRoute(
          path: RouteNames.aldiriyahRegion,
          builder: (context, state) {
            final city = cityEntityFromGoRouterExtra(state.extra);
            return AldiriyahRegion(city: city);
          }),
    ],
  );
}

/// [go_router] `extra` may be a [CityEntity] or a JSON [Map] depending on the caller.
CityEntity? cityEntityFromGoRouterExtra(Object? extra) {
  if (extra == null) return null;
  if (extra is CityEntity) return extra;
  if (extra is Map) {
    try {
      return CityModel.fromJson(Map<String, dynamic>.from(extra));
    } catch (_) {
      return null;
    }
  }
  return null;
}

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
        onTap: (index) => _onItemTapped(context, index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'الخريطة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'ألإنجازات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الإعدادات',
          ),
        ],
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location == RouteNames.home) return 0;
    if (location == RouteNames.map) return 1;
    if (location == RouteNames.achievements) return 2;
    if (location == RouteNames.settings) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(RouteNames.home);
        break;
      case 1:
        context.go(RouteNames.map);
        break;
      case 2:
        context.go(RouteNames.achievements);
        break;
      case 3:
        context.go(RouteNames.settings);
        break;
    }
  }
}
