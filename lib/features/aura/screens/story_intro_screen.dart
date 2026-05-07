import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/name_aura_result.dart';
import '../models/nationality_aura_result.dart';
import '../models/zodiac_aura_result.dart';
import '../widgets/app_gradient_background.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/aura_orb.dart';
import 'story_scene_screen.dart';

class StoryIntroScreen extends StatelessWidget {
  final NameAuraResult nameResult;
  final ZodiacAuraResult zodiacResult;
  final NationalityAuraResult nationalityResult;

  const StoryIntroScreen({
    super.key,
    required this.nameResult,
    required this.zodiacResult,
    required this.nationalityResult,
  });

  void _onStart(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => StorySceneScreen(
          nameResult: nameResult,
          zodiacResult: zodiacResult,
          nationalityResult: nationalityResult,
        ),
        transitionsBuilder: (_, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppGradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Atmospheric orb, top-right aligned
                Align(
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: const Offset(40, 0),
                    child: const AuraOrb(
                      color: AppColors.primaryNeon,
                      size: 160,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Hikaye başlıyor',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'Şimdi kısa bir içsel yolculuğa çıkacaksın. Her sahnede sana en doğal gelen seçeneği işaretle.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.75,
                      ),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: Text(
                    'Bu deneyim klinik veya psikolojik tanı amacı taşımaz. Sembolik ve yaratıcı bir renk keşfidir.',
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                      height: 1.65,
                    ),
                  ),
                ),
                const Spacer(),
                AppPrimaryButton(
                  label: 'Yolculuğa Başla',
                  onPressed: () => _onStart(context),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
