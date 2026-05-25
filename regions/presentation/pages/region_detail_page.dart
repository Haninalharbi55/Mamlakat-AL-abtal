import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/image_urls.dart';
import '../../../../core/localization/localization_helper.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class RegionDetailPage extends StatelessWidget {
  final int regionId;

  const RegionDetailPage({super.key, required this.regionId});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    // Mock region data - in real app, fetch from cubit
    final regionNames = {
      1: 'الرياض',
      2: 'جدة',
      3: 'نيوم',
      4: 'أبها',
      5: 'الدرعية',
    };
    
    final regionDescriptions = {
      1: 'عاصمة المملكة العربية السعودية',
      2: 'مدينة ساحلية جميلة',
      3: 'مدينة المستقبل',
      4: 'مدينة الجبال',
      5: 'كانت الدرعية اول عاصمة للدولة السعودية وهي مدينه جميله وتسمى قلب التاريخ لانها المكان الذي بدأت فيه قصه وطننا',
    };
    
    final regionName = regionNames[regionId] ?? 'منطقة';
    final regionDescription = regionDescriptions[regionId] ?? '';
    
    return Scaffold(
      appBar: AppBar(
        title: Text(regionName),
      ),
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Robot guide with speech bubble
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Robot image
                          Container(
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 16),
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
                                  size: 120,
                                  color: AppColors.primaryBlue,
                                );
                              },
                            ),
                          ),
                          // Speech bubble with text
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.skyBlue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.primaryBlue,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              regionDescription,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    height: 1.5,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Region character (girl in traditional dress)
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.network(
                    ImageUrls.regionCharacter,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 150,
                          color: Colors.black87,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),
                // Quiz button with yellow background
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryYellow.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: CustomButton(
                    text: l10n.quiz,
                    onPressed: () {
                      context.push('${RouteNames.quiz}?regionId=$regionId');
                    },
                    backgroundColor: AppColors.primaryYellow,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
