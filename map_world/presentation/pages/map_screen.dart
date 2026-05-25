import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/city_entity.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/tts_service.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MapCubit>()..loadMapData(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/images/background.png",
            ),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
              child: BlocBuilder<MapCubit, MapState>(
            builder: (context, state) {
              if (state is MapLoading) return const LoadingWidget();
              if (state is MapError) return AppErrorWidget(message: state.message, onRetry: () => context.read<MapCubit>().loadMapData());
              if (state is MapLoaded) {
                return _MapContent(state: state);
              }
              return const SizedBox.shrink();
            },
          )),
        ),
      ),
    );
  }
}

class _MapContent extends StatelessWidget {
  final MapLoaded state;
  const _MapContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => context.push(RouteNames.rewards),
                child: Image.asset("assets/images/waner.png", width: 100),
              ),
              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: Image.asset("assets/images/back.png", width: 100),
              ),
            ],
          ),
          InkWell(
              onTap: () => context.push(RouteNames.dailyChallenges),

              child: Image.asset("assets/images/arrow.png", width: 100)),


          Center(
            child: SizedBox(
              width: 400,
              height: 400,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/map.png",
                    width: 400,
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                  ...state.cities.map((city) => _CityMarker(
                        city: city,
                        isSelected: state.selectedCity?.id == city.id,
                      )),
                ],
              ),
            ),
          ),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    sl<TtsService>().speak("أهلاً بك يا بطل في خريطة مملكة الأبطال! استكشف المدن لتعرف المزيد عن تاريخ وطننا العظيم.");
                  },
                  child: Image.asset(
                    "assets/images/bot.png",
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: sl<TtsService>().isSpeaking,
                  builder: (context, isSpeaking, _) {
                    if (!isSpeaking) return const SizedBox.shrink();
                    return Positioned(
                      top: 0,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 4),
                          ],
                        ),
                        child: const Icon(
                          Icons.headset,
                          color: Color(0xFF8C6C05),
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CityMarker extends StatelessWidget {
  final CityEntity city;
  final bool isSelected;
  const _CityMarker({required this.city, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    // Positioning logic based on city name from image reference
    double left = 0;
    double top = 0;

    final String cityName = city.name.trim();

    if (cityName.contains('نيوم')) {
      left = 40; top = 100;
    } else if (cityName.contains('الجوف')) {
      left = 150; top = 80;
    } else if (cityName.contains('العلا')) {
      left = 50; top = 160;
    } else if (cityName.contains('المدينة')) {
      left = 90; top = 200;
    } else if (cityName.contains('مكة')) {
      left = 80; top = 260;
    } else if (cityName.contains('الرياض')) {
      left = 200; top = 170;
    } else if (cityName.contains('الدرعية')) {
      left = 180; top = 220;
    } else if (cityName.contains('أبها')) {
      left = 160; top = 300;
    } else if (cityName.contains('الشرقية')) {
      left = 280; top = 210;
    } else {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () => _tryOpenCity(context, city),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.trophyGold.withOpacity(0.9)
                    : (city.isOpen
                        ? Colors.white.withOpacity(0.8)
                        : Colors.grey.withOpacity(0.8)),
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSelected
                        ? Colors.white
                        : (city.isOpen ? AppColors.trophyGold : Colors.black),
                    width: 2),
              ),
              child: Icon(
                Icons.location_on,
                color: isSelected
                    ? Colors.white
                    : (city.isOpen ? AppColors.trophyGold : Colors.grey),
                size: isSelected ? 24 : 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _tryOpenCity(BuildContext context, CityEntity city) {
  final authState = context.read<AuthCubit>().state;
  final childPoints = authState is AuthAuthenticated
      ? (authState.user.points ?? 0)
      : 0;

  if (childPoints < city.points) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تنبيه'),
        content: Text(
          'يجب عليك إكمال تحديات أكثر من أجل فتح المدينة.\n\n'
          'نقاطك الحالية: $childPoints\n'
          'النقاط المطلوبة: ${city.points}',
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
    return;
  }

  context.read<MapCubit>().selectCity(city);
  context.push(RouteNames.aldiriyahRegion, extra: city);
}
