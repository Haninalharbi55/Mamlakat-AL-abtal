import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamlakat_alabtal/core/di/injection_container.dart';
import 'package:mamlakat_alabtal/core/localization/localization_helper.dart';
import 'package:mamlakat_alabtal/core/theme/app_colors.dart';
import 'package:mamlakat_alabtal/core/widgets/loading_widget.dart';
import 'package:mamlakat_alabtal/core/widgets/error_widget.dart';
import 'package:mamlakat_alabtal/features/rewards/presentation/cubit/rewards_cubit.dart';
import 'package:mamlakat_alabtal/features/rewards/presentation/cubit/rewards_state.dart';
import 'package:mamlakat_alabtal/features/rewards/domain/entities/city_entity.dart';
import 'package:mamlakat_alabtal/features/rewards/domain/entities/achievement_data_entity.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RewardsCubit>()..loadRewards(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.skyBlue, AppColors.sandBeige],
              stops: [0.7, 0.7],
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<RewardsCubit, RewardsState>(
              builder: (context, state) {
                if (state is RewardsLoading) return const LoadingWidget();
                if (state is RewardsError) {
                  return AppErrorWidget(
                    message: state.message,
                    onRetry: () => context.read<RewardsCubit>().loadRewards(),
                  );
                }
                if (state is RewardsLoaded) {
                  return _RewardsContent(state: state);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _RewardsContent extends StatelessWidget {
  final RewardsLoaded state;
  const _RewardsContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final habits = state.achievementData;
    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        Text(
          context.l10n.rewards,
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        _buildSectionTitle(context, 'إنجازات العادات اليومية'),
        SizedBox(height: 16.h),
        _HabitsGrid(habits: habits),
        SizedBox(height: 32.h),
        _buildSectionTitle(context, 'المدن المفتوحة'),
        SizedBox(height: 16.h),
        _CitiesGrid(cities: habits.cities),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}

class _HabitsGrid extends StatelessWidget {
  final AchievementDataEntity habits;
  const _HabitsGrid({required this.habits});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'الأكل', 'isEarned': habits.foods},
      {'title': 'الماء', 'isEarned': habits.drinks},
      {'title': 'المشي', 'isEarned': habits.walks},
      {'title': 'النوم', 'isEarned': habits.sleeps},
      {'title': 'تسجيل الدخول', 'isEarned': true},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _TrophyCard(
          title: item['title'] as String,
          isEarned: item['isEarned'] as bool,
        );
      },
    );
  }
}

class _CitiesGrid extends StatelessWidget {
  final List<CityEntity> cities;
  const _CitiesGrid({required this.cities});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        return _TrophyCard(
          title: city.name,
          isEarned: city.isOpen,
          subtitle: city.points > 0 ? '${city.points} نقطة' : null,
        );
      },
    );
  }
}

class _TrophyCard extends StatelessWidget {
  final String title;
  final bool isEarned;
  final String? subtitle;

  const _TrophyCard({
    required this.title,
    required this.isEarned,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isEarned ? 8 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isEarned ? AppColors.trophyGold : Colors.grey.shade300,
          width: isEarned ? 3 : 1,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isEarned
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.trophyGold.withOpacity(0.1),
                    Colors.white,
                  ],
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isEarned
                      ? AppColors.trophyGold.withOpacity(0.2)
                      : Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.emoji_events,
                  size: 56.r,
                  color: isEarned ? AppColors.trophyGold : AppColors.trophyBlack,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isEarned ? AppColors.textDark : Colors.grey,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isEarned ? AppColors.primaryGreen : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
