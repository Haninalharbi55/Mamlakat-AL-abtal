import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../habits/domain/usecases/get_daily_achievements_usecase.dart';

part 'region_progress_state.dart';

class RegionProgressCubit extends Cubit<RegionProgressState> {
  final GetDailyAchievementsUseCase getDailyAchievementsUseCase;

  RegionProgressCubit(this.getDailyAchievementsUseCase) : super(RegionProgressInitial());

  Future<void> fetchProgress() async {
    emit(RegionProgressLoading());
    try {
      final achievements = await getDailyAchievementsUseCase();
      
      int completedDays = 0;
      for (var entry in achievements) {
        if (entry.foods > 0 || entry.drinks > 0 || entry.walks > 0 || entry.sleeps > 0) {
          completedDays++;
        }
      }

      emit(RegionProgressLoaded(completedDays: completedDays));
    } catch (e) {
      emit(RegionProgressError(message: 'حدث خطأ في تحميل التحديات'));
    }
  }
}
