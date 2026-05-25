import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/image_urls.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/localization_helper.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';
import '../../domain/entities/region_entity.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    return BlocProvider(
      create: (_) => sl<MapCubit>()..loadMapData(),
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
            child: BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                if (state is MapLoading) {
                  return const LoadingWidget();
                }
                
                if (state is MapError) {
                  return AppErrorWidget(
                    message: state.message,
                    onRetry: () => context.read<MapCubit>().loadMapData(),
                  );
                }
                
                if (state is MapLoaded) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Trophy icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.emoji_events,
                                color: AppColors.trophyGold,
                                size: 32,
                              ),
                            ),
                            Text(
                              'خريطة المملكة',
                              style: Theme.of(context).textTheme.displaySmall,
                              textAlign: TextAlign.center,
                            ),
                            // Target icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.gps_fixed,
                                color: AppColors.primaryBlue,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: state.regions.length,
                          itemBuilder: (context, index) {
                            final region = state.regions[index];
                            return _RegionCard(
                              region: region,
                              onTap: () {
                                if (region.status == RegionStatus.locked) {
                                  _showLockedDialog(context, l10n);
                                } else {
                                  context.push(
                                      RouteNames.map2
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                      // Robot character at bottom
                      Container(
                        height: 120,
                        margin: const EdgeInsets.all(16),
                        child: Image.network(
                          ImageUrls.robotCharacter,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.smart_toy,
                              size: 100,
                              color: AppColors.primaryBlue,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showLockedDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.regionLocked),
        content: Text(l10n.completeGoalsToUnlock),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
  }
}

class _RegionCard extends StatelessWidget {
  final RegionEntity region;
  final VoidCallback onTap;

  const _RegionCard({
    required this.region,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusText;
    
    switch (region.status) {
      case RegionStatus.locked:
        statusColor = Colors.grey;
        statusIcon = Icons.lock;
        statusText = 'مقفل';
        break;
      case RegionStatus.unlocked:
        statusColor = AppColors.primaryBlue;
        statusIcon = Icons.lock_open;
        statusText = 'مفتوح';
        break;
      case RegionStatus.completed:
        statusColor = AppColors.primaryGreen;
        statusIcon = Icons.check_circle;
        statusText = 'مكتمل';
        break;
    }
    
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                statusIcon,
                size: 48,
                color: statusColor,
              ),
              const SizedBox(height: 8),
              Text(
                region.name,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                statusText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: statusColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
