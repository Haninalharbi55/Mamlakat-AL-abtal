import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/dio_client.dart';
import '../utils/tts_service.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/check_auth_usecase.dart';
import '../../features/auth/domain/usecases/get_profile_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/update_profile_usecase.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/habits/data/datasources/habits_remote_datasource.dart';
import '../../features/habits/data/repositories/habits_repository_impl.dart';
import '../../features/habits/domain/repositories/habits_repository.dart';
import '../../features/habits/domain/usecases/submit_entry_usecase.dart';
import '../../features/habits/domain/usecases/get_today_summary_usecase.dart';
import '../../features/habits/domain/usecases/submit_habit_count_usecase.dart';
import '../../features/habits/domain/usecases/get_daily_achievements_usecase.dart';
import '../../features/habits/domain/usecases/get_daily_roten_usecase.dart';
import '../../features/habits/presentation/cubit/habits_cubit.dart';
import '../../features/map_world/data/datasources/map_remote_datasource.dart';
import '../../features/map_world/data/repositories/map_repository_impl.dart';
import '../../features/map_world/domain/repositories/map_repository.dart';
import '../../features/map_world/domain/usecases/get_regions_usecase.dart';
import '../../features/map_world/domain/usecases/get_child_regions_usecase.dart';
import '../../features/map_world/domain/usecases/get_cities_usecase.dart';
import '../../features/map_world/presentation/cubit/map_cubit.dart';
import '../../features/regions/data/datasources/regions_remote_datasource.dart';
import '../../features/regions/data/repositories/regions_repository_impl.dart';
import '../../features/regions/domain/repositories/regions_repository.dart';
import '../../features/regions/domain/usecases/get_quiz_usecase.dart';
import '../../features/regions/domain/usecases/submit_quiz_usecase.dart';
import '../../features/regions/presentation/cubit/region_cubit.dart';
import '../../features/regions/presentation/cubit/quiz_cubit.dart';
import '../../features/regions/presentation/cubit/region_progress_cubit.dart';
import '../../features/rewards/data/datasources/rewards_remote_datasource.dart';
import '../../features/rewards/data/repositories/rewards_repository_impl.dart';
import '../../features/rewards/domain/repositories/rewards_repository.dart';
import '../../features/rewards/domain/usecases/get_rewards_usecase.dart';
import '../../features/rewards/domain/usecases/get_achievements_usecase.dart';
import '../../features/rewards/presentation/cubit/rewards_cubit.dart';
import '../../features/settings/data/datasources/preferences_datasource.dart';
import '../../features/settings/data/repositories/settings_repository_impl.dart';
import '../../features/settings/domain/repositories/settings_repository.dart';
import '../../features/settings/domain/usecases/change_language_usecase.dart';
import '../../features/settings/presentation/cubit/settings_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  
  // Core
  sl.registerLazySingleton(() => DioClient(useMockData: true));
  sl.registerLazySingleton(() => sl<DioClient>().dio);
  sl.registerLazySingleton(() => TtsService());

  // Features - Auth
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => CheckAuthUseCase(sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));

  // Cubits
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl(), sl(), sl()));

  // Features - Habits
  // Data sources
  sl.registerLazySingleton<HabitsRemoteDataSource>(
    () => HabitsRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<HabitsRepository>(
    () => HabitsRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => SubmitEntryUseCase(sl()));
  sl.registerLazySingleton(() => GetTodaySummaryUseCase(sl()));
  sl.registerLazySingleton(() => SubmitHabitCountUseCase(sl()));
  sl.registerLazySingleton(() => GetDailyAchievementsUseCase(sl()));
  sl.registerLazySingleton(() => GetDailyRotenUseCase(sl()));

  // Cubits
  sl.registerFactory(() => HabitsCubit(sl(), sl(), sl(), sl(), sl()));

  // Features - Map
  // Data sources
  sl.registerLazySingleton<MapRemoteDataSource>(
    () => MapRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<MapRepository>(
    () => MapRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetRegionsUseCase(sl()));
  sl.registerLazySingleton(() => GetChildRegionsUseCase(sl()));
  sl.registerLazySingleton(() => GetCitiesUseCase(sl()));

  // Cubits
  sl.registerFactory(() => MapCubit(sl(), sl(), sl()));

  // Features - Regions
  // Data sources
  sl.registerLazySingleton<RegionsRemoteDataSource>(
    () => RegionsRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<RegionsRepository>(
    () => RegionsRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCityQuestionsUseCase(sl()));
  sl.registerLazySingleton(() => SubmitQuizUseCase(sl()));

  // Cubits
  sl.registerFactory(() => RegionCubit());
  sl.registerFactory(() => QuizCubit(sl(), sl()));
  sl.registerFactory(() => RegionProgressCubit(sl()));

  // Features - Rewards
  // Data sources
  sl.registerLazySingleton<RewardsRemoteDataSource>(
    () => RewardsRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<RewardsRepository>(
    () => RewardsRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetRewardsUseCase(sl()));
  sl.registerLazySingleton(() => GetAchievementsUseCase(sl()));

  // Cubits
  sl.registerFactory(() => RewardsCubit(
        getRewardsUseCase: sl(),
        getAchievementsUseCase: sl(),
      ));

  // Features - Settings
  // Data sources
  sl.registerLazySingleton<PreferencesDataSource>(
    () => PreferencesDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => ChangeLanguageUseCase(sl()));

  // Cubits
  sl.registerFactory(() => SettingsCubit(sl()));
}
